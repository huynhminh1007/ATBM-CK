package Controller.security;

import Database.KeyDAO;
import Database.OrderDAO;
import Database.OrderSignatureDAO;
import Model.Order_details;
import Model.Orders;
import Model.User;
import Model.security.DigitalSignature;
import Model.security.Hash;
import Model.security.Key;
import Utils.JsonUtils;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.SignatureException;
import java.security.spec.InvalidKeySpecException;

@WebServlet("/order-security")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1MB
        maxFileSize = 1024 * 1024 * 10,      // 10MB
        maxRequestSize = 1024 * 1024 * 15   // 15MB
)
public class SecurityOrderController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private DigitalSignature signature;
    private Hash hashAlgorithm;

    private OrderDAO orderDAO;
    private OrderSignatureDAO orderSignatureDAO;
    private KeyDAO keyDAO;

    public SecurityOrderController() {
        signature = new DigitalSignature();
        hashAlgorithm = new Hash();
        orderDAO = new OrderDAO();
        keyDAO = new KeyDAO();
        orderSignatureDAO = new OrderSignatureDAO();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }

        String action = req.getParameter("action").toLowerCase();
        switch (action.toLowerCase()) {
            case "upload-key" -> uploadKey(req, resp);
            case "send-hash" -> sendHashOrder(req, resp);
            case "verify-signature" -> verifySignature(req, resp);
            case "report-key" -> reportKey(req, resp);
        }
    }

    private void reportKey(HttpServletRequest req, HttpServletResponse resp) {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        int userId = user.getId();

        keyDAO.disableLatestKey(user.getId());
        var keys = keyDAO.findByUsers(userId);
        session.setAttribute("keys", keys);
        try {
            resp.setStatus(HttpServletResponse.SC_OK);
            session.setAttribute("keys", keys);
            String json = new Gson().toJson(keys); // Sử dụng Gson để chuyển đổi đối tượng thành JSON
            resp.getWriter().write(json);
        } catch (IOException e) {
        }
    }

    /**
     * Upload public key
     */
    private void uploadKey(HttpServletRequest req, HttpServletResponse resp) {
        try (InputStream inputStream = getFileStream(req, resp);
             DataInputStream in = new DataInputStream(new BufferedInputStream(inputStream))) {

            // Đọc nội dung file từ DataInputStream
            String algorithm = in.readUTF();
            String publicKey = in.readUTF();

            // Cập nhật thông tin chữ ký
            signature.setAlgorithm(algorithm);
            signature.loadPublicKey(publicKey);

            HttpSession session = req.getSession();
            User user = (User) session.getAttribute("user");

            keyDAO.disableLatestKey(user.getId());
            keyDAO.insert(new Key(user.getId(), signature.getPublicKey(), algorithm, true));
            var keys = keyDAO.findByUsers(user.getId());
            session.setAttribute("keys", keys);
            // Phản hồi thành công
            resp.setStatus(HttpServletResponse.SC_OK);
            String json = new Gson().toJson(keys); // Sử dụng Gson để chuyển đổi đối tượng thành JSON
            resp.getWriter().write(json);

        } catch (IOException | NoSuchAlgorithmException | InvalidKeySpecException e) {
            try {
                resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                resp.getWriter().write("Error processing the public key: " + e.getMessage());
            } catch (IOException ioException) {
            }
        }
    }

    /**
     * Receive public key file from client using HttpServlet Part API
     *
     * @param req
     * @param resp
     * @return InputStream of the uploaded file
     */
    private InputStream getFileStream(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        try {
            // Lấy file từ request part
            Part filePart = req.getPart("key-file-input"); // "file" là tên field từ form
            if (filePart != null && filePart.getSize() > 0) {
                return filePart.getInputStream(); // Trả về InputStream của file
            } else {
                resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                resp.getWriter().write("No file uploaded or file is empty!");
            }
        } catch (ServletException e) {
            resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            resp.getWriter().write("Error handling file upload: " + e.getMessage());
        }

        throw new IOException("Không tìm thấy file hợp lệ trong request!");
    }

    /**
     * Send a hash text of order
     * User use this hash text to sign
     *
     * @param req
     * @param resp
     */
    private void sendHashOrder(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        int orderId = Integer.parseInt(req.getParameter("orderId"));

        Orders order = orderDAO.findById(orderId);
        if (order == null) {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Không tìm thấy đơn hàng");
            return;
        }

        String shortInfo = getShortInfo(user, order);
        try {
            String hash = hashAlgorithm.hashBase64(shortInfo, "utf-8");
            JsonObject response = new JsonObject();
            response.addProperty("hash", hash);
            JsonUtils.sendJsonResponse(resp, HttpServletResponse.SC_OK, response.toString());
        } catch (UnsupportedEncodingException | NoSuchAlgorithmException e) {
        }
    }

    /**
     * Verify Signature
     *
     * @param req
     * @param resp
     */
    private void verifySignature(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        int userId = user.getId();
        int orderId = Integer.parseInt(req.getParameter("orderId"));
        String signed = req.getParameter("digitalSignature");

        Orders order = orderDAO.findById(orderId);
        if (order == null) {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Không tìm thấy đơn hàng");
            return;
        }

        Key key = keyDAO.findByUser(userId);

        if (key == null) {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Bạn chưa có Public Key");
            return;
        }
        JsonObject response = new JsonObject();
        int status;

        String shortInfo = getShortInfo(user, order);
        try {
            signature.setAlgorithm(key.getAlgorithm());
            signature.loadPublicKey(key.getKey());
            String hash = hashAlgorithm.hashBase64(shortInfo, "utf-8");


            // Nếu xác thực thành công
            if (signature.verify(hash, signed)) {
                status = HttpServletResponse.SC_OK;
            } else {
                status = HttpServletResponse.SC_INTERNAL_SERVER_ERROR;
            }
            JsonUtils.sendJsonResponse(resp, status, response.toString());
        } catch (UnsupportedEncodingException | NoSuchAlgorithmException | InvalidKeyException | SignatureException |
                 InvalidKeySpecException e) {
            status = HttpServletResponse.SC_INTERNAL_SERVER_ERROR;
            JsonUtils.sendJsonResponse(resp, status, response.toString());
        }
    }

    /**
     * Get short info for hash
     *
     * @param order
     * @return
     */
    private String getShortInfo(User user, Orders order) {
        JsonObject result = new JsonObject();

        result.addProperty("userId", user.getId());
        result.addProperty("orderId", order.getId());
        result.addProperty("totalPrice", order.getTotalPrice());
        result.addProperty("discountId", order.getDiscountId());
        result.addProperty("paymentMethod", order.getPaymentMethod());
        result.addProperty("shippingFee", order.getShippingFee());
        result.addProperty("dateCreated", order.getDateCreated().toString());

        JsonArray detailsArray = new JsonArray();
        for (Order_details detail : order.getDetails()) {
            JsonObject detailObject = new JsonObject();
            detailObject.addProperty("productId", detail.getProduct().getId());
            detailObject.addProperty("quantity", detail.getQuantity());
            detailObject.addProperty("price", detail.getPrice());
            detailsArray.add(detailObject);
        }

        result.add("details", detailsArray);

        return result.toString();
    }
}
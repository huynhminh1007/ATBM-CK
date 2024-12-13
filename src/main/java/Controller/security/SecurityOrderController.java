package Controller.security;

import Model.Order_details;
import Model.Orders;
import Model.User;
import Model.security.DigitalSignature;
import Model.security.Hash;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.SignatureException;
import java.security.spec.InvalidKeySpecException;

@WebServlet("/order-security")
public class SecurityOrderController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private DigitalSignature signature;
    private Hash hashAlgorithm;

    public SecurityOrderController() {
        signature = new DigitalSignature();
        hashAlgorithm = new Hash();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        switch (action.toLowerCase()) {
            case "upload-key" -> uploadKey(req, resp);
            case "send-hash" -> sendHashOrder(req, resp);
            case "verify-signature" -> verifySignature(req, resp);
        }
    }

    /**
     * Upload public key
     */
    private void uploadKey(HttpServletRequest req, HttpServletResponse resp) {
        File publicKeyFile = getFile("public-key");

        try (DataInputStream in = new DataInputStream(new BufferedInputStream(new FileInputStream(publicKeyFile)))) {
            String algorithm = in.readUTF();
            String publicKey = in.readUTF();

            signature.setAlgorithm(algorithm);
            signature.loadPublicKey(publicKey);

            // Handle if successful
        } catch (IOException | NoSuchAlgorithmException | InvalidKeySpecException e) {
            e.printStackTrace();
        }
    }

    /**
     * Send a hash text of order
     * User use this hash text to sign
     * @param req
     * @param resp
     */
    private void sendHashOrder(HttpServletRequest req, HttpServletResponse resp) {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        // Change logic for get Order
        Orders order = new Orders();

        String shortInfo = getShortInfo(user, order);
        try {
            String hash = hashAlgorithm.hashBase64(shortInfo, "utf-8");
            session.setAttribute("order_sign", order);
            session.setAttribute("hash", hash);

            // Send an email with hash
        } catch (UnsupportedEncodingException | NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
    }

    /**
     * Verify Signature
     * @param req
     * @param resp
     */
    private void verifySignature(HttpServletRequest req, HttpServletResponse resp) {
        HttpSession session = req.getSession();
        Orders orders = (Orders) session.getAttribute("order_sign");
        String hash = (String) session.getAttribute("hash");

        // Change logic to get signature
        String signed = req.getParameter("sign");

        try {
            // Logic here
            if (signature.verify(hash, signed)) {

            } else {

            }
        } catch (InvalidKeyException | SignatureException e) {
            e.printStackTrace();
        }
    }

    /**
     * Receive public key file from client
     *
     * @param fileName
     * @return
     */
    private File getFile(String fileName) {
        return null;
    }

    /**
     * Get short info for hash
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
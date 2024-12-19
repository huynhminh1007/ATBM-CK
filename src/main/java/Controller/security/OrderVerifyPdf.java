package Controller.security;

import Database.KeyDAO;
import Database.OrderDAO;
import Model.security.DigitalSignature;
import Model.security.Hash;
import Services.IOrderService;
import Services.IUserService;
import Services.KeyService;
import Services.UserServices;
import Utils.pdf.PdfHelper;
import org.springframework.web.servlet.DispatcherServlet;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.SignatureException;
import java.security.spec.InvalidKeySpecException;
import java.util.Map;


@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1MB
        maxFileSize = 1024 * 1024 * 10,      // 10MB
        maxRequestSize = 1024 * 1024 * 15   // 15MB
)
@WebServlet("/OrderVerifyPdf")
public class OrderVerifyPdf extends HttpServlet {
    @Inject
    OrderDAO orderDAO;
    @Inject
    KeyDAO keyDAO;
    @Inject
    IUserService userServices;

    public OrderVerifyPdf() {
    }

    public InputStream extractFileInputStream(HttpServletRequest request) throws IOException {
        try {
            // Lấy file từ request part
            Part filePart = request.getPart("order-pdf"); // "file" là tên field từ form
            if (filePart != null && filePart.getSize() > 0) {
                return filePart.getInputStream(); // Trả về InputStream của file
            } else {
                throw new RuntimeException("File trống");
            }
        } catch (ServletException e) {
            throw new IOException("Xảy ra lỗi trong quá trình xử lý file");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        InputStream inputStream = request.getInputStream();
        Map<String, String> digitalSignatureInfo = PdfHelper.verifyPdfMetadata(inputStream);
        //Compare 2 signatures
        var orderId = Integer.parseInt(digitalSignatureInfo.get("orderId"));
        var userId = Integer.parseInt(digitalSignatureInfo.get("userId"));
        var digitalSignature = digitalSignatureInfo.get("digitalSignature");
        var currentOrder = orderDAO.findById(orderId);
        var user = userServices.findUserById(userId);
        var activePublicKey = keyDAO.findByUser(userId);
        var shortInfo = SecurityOrderController.getShortInfo(user, currentOrder);
        DigitalSignature signature = new DigitalSignature();
        Hash hashAlgorithm = new Hash();
        request.setAttribute("status", "error");
        try {
            signature.setAlgorithm(activePublicKey.getAlgorithm());
            signature.loadPublicKey(activePublicKey.getKey());
            String currentOrderHash = hashAlgorithm.hashBase64(shortInfo, "utf-8");
            System.out.printf("current hash:%s ", currentOrderHash);
            System.out.printf("signature:%s ", digitalSignature);
            if (signature.verify(currentOrderHash, digitalSignature)) {
                request.setAttribute("orderId", orderId);
                request.setAttribute("userId", userId);
                request.setAttribute("digitalSignature", digitalSignatureInfo);
                request.setAttribute("status", "ok");
            } else {
                System.out.println("not match");
            }
        } catch (NoSuchAlgorithmException | InvalidKeySpecException | InvalidKeyException | SignatureException e) {
            throw new RuntimeException(e);
        }
        request.getRequestDispatcher("/order-pdf-verify.jsp").forward(request, response);
    }

    //delete post traffic to doGet method
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
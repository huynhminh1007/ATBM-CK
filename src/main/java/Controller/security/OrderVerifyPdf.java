package Controller.security;

import Database.KeyDAO;
import Database.OrderDAO;
import Model.security.DigitalSignature;
import Model.security.Hash;
import Model.security.Key;
import Services.IUserService;
import Utils.pdf.PdfHelper;
import com.google.gson.Gson;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.SignatureException;
import java.security.spec.InvalidKeySpecException;
import java.util.HashMap;
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


    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        // API response too fast, we have to sleep a little bit to make it more realistic
        try {
            Thread.sleep(500);
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }
        Map<String, String> jsonResponse = new HashMap<>();
        InputStream inputStream = request.getInputStream();
        Map<String, String> digitalSignatureInfo = PdfHelper.verifyPdfMetadata(inputStream);
        //Compare 2 signatures
        var orderId = Integer.parseInt(digitalSignatureInfo.get("orderId"));
        var userId = Integer.parseInt(digitalSignatureInfo.get("userId"));
        var digitalSignature = digitalSignatureInfo.get("digitalSignature");
        var currentOrder = orderDAO.findById(orderId);
        var user = userServices.findUserById(userId);
        Key activePublicKey = keyDAO.findByOrderSigned(orderId);
        var shortInfo = SecurityOrderController.getShortInfo(user, currentOrder);
        DigitalSignature signature = new DigitalSignature();
        Hash hashAlgorithm = new Hash();
        request.setAttribute("status", "error");
        try {
            signature.setAlgorithm(activePublicKey.getAlgorithm());
            signature.loadPublicKey(activePublicKey.getKey());
            String currentOrderHash = hashAlgorithm.hashBase64(shortInfo, "utf-8");
            jsonResponse.put("orderId", String.valueOf(orderId));
            jsonResponse.put("user", user.getFullName());
            jsonResponse.put("digitalSignature", digitalSignature);
            if (signature.verify(currentOrderHash, digitalSignature)) {
                jsonResponse.put("status", "success");
            } else {
                jsonResponse.put("status", "unmatched");
            }
        } catch (NoSuchAlgorithmException | InvalidKeySpecException | InvalidKeyException | SignatureException e) {
            throw new RuntimeException(e);
        }
        Gson gson = new Gson();
        response.getWriter().write(gson.toJson(jsonResponse));
    }

    //delete post traffic to doGet method
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
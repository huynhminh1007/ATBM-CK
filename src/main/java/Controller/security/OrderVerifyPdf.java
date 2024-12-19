package Controller.security;

import Utils.pdf.PdfHelper;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Map;


@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1MB
        maxFileSize = 1024 * 1024 * 10,      // 10MB
        maxRequestSize = 1024 * 1024 * 15   // 15MB
)
@WebServlet("/OrderVerifyPdfOrder")
public class OrderVerifyPdf extends HttpServlet {

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
        //Compare 2 sigture
    }

    //delete post traffic to doGet method
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
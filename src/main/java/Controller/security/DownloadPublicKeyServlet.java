package Controller.security;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedOutputStream;
import java.io.DataOutputStream;
import java.io.IOException;

@WebServlet("/downloadPublicKey")
public class DownloadPublicKeyServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String publicKey = request.getParameter("key");
        String algorithm = request.getParameter("algorithm");

        response.setContentType("application/octet-stream");
        response.setHeader("Content-Disposition", "attachment;filename=publicKey.pub");

        try (DataOutputStream dos = new DataOutputStream(new BufferedOutputStream(response.getOutputStream()))) {
            dos.writeUTF(algorithm);
            dos.writeUTF(publicKey);
        }
    }
}
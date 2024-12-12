package Controller;

import java.awt.geom.QuadCurve2D;
import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Log;
import Model.User;
import Model.Verification;
import Services.*;
import Utils.BHash;
import Utils.TokenGenerator;

/**
 * Servlet implementation class ForgotPassword
 */
@WebServlet("/ForgotPassword")
public class ForgotPassword extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Inject
    IUserService userService;
    @Inject
    IVerificationService verificationService;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ForgotPassword() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        doPost(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "" : request.getParameter("action").trim();
        switch (action) {
            case "ForgotPassword" -> forgotPassword(request, response);
            case "Verifier" -> verifier(request, response);
            default -> throw new IllegalArgumentException("Unexpected value: " + action);
        }

    }

    private void forgotPassword(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String Email = request.getParameter("Email");
        User user = null;
        user = userService.findUserByEmail(Email);
        String error = "";
        String url = "/login.jsp";
        if (user == null) {
            error = "Email không tồn tại trong hệ thống";
            request.setAttribute("error", error);
        } else {
            request.setAttribute("userId", user.getId());
            url = "/quen-mat-khau.jsp";
            Verification verification = verificationService.create(user.getId());
            Log log = MLogFactory.getLog(request, this, 2);
            log.setDescription("Người dùng quên mật khẩu ");
            LogServiceManager.getLogService().saveLog(log);
            Thread emailThread = new Thread(() -> {
                verificationService.save(verification);
                verificationService.sendResetPasswordEmail(Email, verification);
            });
            emailThread.start();
        }
        request.getRequestDispatcher(url).forward(request, response);
    }

    private void verifier(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String verificationCode = request.getParameter("verificationCode");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");
        int userId = Integer.valueOf(request.getParameter("userId"));
        String oldPassword = userService.findUserById(userId).getPasswordHash();
        String error = "";
        String url = "/quen-mat-khau.jsp";
        if (!newPassword.equals(confirmPassword)) {
            error = "Mật khẩu xác nhận chưa chính xác";
        } else if (BHash.login(newPassword, oldPassword)) {
            error = "Mật khẩu mới không thể trùng với mật khẩu cũ";
        } else {
            int status = verificationService.verifyForgotPassword(userId, verificationCode, newPassword);
            switch (status) {
                case 1:
                    url = "/login.jsp";
                    break;
                case 2:
                    error = "Mã OTP đã hết hạn";
                    break;
                case 0:
                    error = "Mã OTP không chính xác";
                    break;
                default:
                    error = "Lỗi không xác định";
                    break;
            }
        }
        request.setAttribute("error", error);
        request.setAttribute("userId", userId);
        request.getRequestDispatcher(url).forward(request, response);
    }

}

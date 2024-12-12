package Controller;

import java.io.IOException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Log;
import Model.Status;
import Model.User;
import Model.Verification;
import Services.*;
import Utils.BHash;
import Utils.TokenGenerator;
import Utils.Validator;


/**
 * Servlet implementation class SignUp
 */
@WebServlet("/SignUp")
public class SignUp extends HttpServlet {
    @Inject
    IUserService userService;
    @Inject
    IVerificationService verificationService;
    private final ExecutorService excutor = Executors.newFixedThreadPool(5);

    public SignUp() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email").toLowerCase();
        String lastName = request.getParameter("lastName").trim();
        String name = request.getParameter("firstName").trim();
        String fullName = lastName + " " + name;
        String phone = request.getParameter("PhoneNumber");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        User users = userService.findUserByEmail(email);
        String error = "";
        String url = "/Verification.jsp";
        request.setAttribute("email", email);
        request.setAttribute("phone", phone);
        request.setAttribute("lastName", lastName);
        request.setAttribute("name", name);
        if (!password.equals(confirmPassword)) {
            error = "Xác nhận lại mật khẩu đăng nhập";
        }
        if (!Validator.validateEmail(email)) {
            error = "Email không đúng định dạng";
        }
        if (users != null) {
            error = "Email đã tồn tại trong hệ thống";
        }
        if (error.length() > 0) {
            request.setAttribute("error", error);
            url = "/signup.jsp";
        } else {
            User user = new User();
            user.setEmail(email);
            user.setFullName(fullName);
            user.setPasswordHash(BHash.hashWithSalt(confirmPassword));
            user.setPhone(phone);
            user.setStatus(new Status(2, "chưa kích hoạt email"));
            int userId = userService.signUp(user);
            Verification verification = saveAndSendMail(userId, email);
            Log log = MLogFactory.getLog(request, this, 2);
            log.setDescription("Người dùng đăng ký tài khoản với email: " + email);
            LogServiceManager.getLogService().saveLog(log);
            request.setAttribute("userId", userId);
            request.setAttribute("second", 60);
        }
        request.getRequestDispatcher(url).forward(request, response);
    }

    public Verification saveAndSendMail(int userId, String email) {
        Verification verification = verificationService.create(userId);
        verificationService.save(verification);
        excutor.execute(() -> {
            verificationService.sendVerificationEmail(email, verification);
        });
        return verification;
    }

    @Override
    public void destroy() {
        excutor.shutdown();
    }

}

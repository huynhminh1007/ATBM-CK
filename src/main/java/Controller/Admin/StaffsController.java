package Controller.Admin;

import Model.Log;
import Model.Status;
import Model.User;
import Services.IAddressService;
import Services.IOrderDetailsService;
import Services.IUserService;
import Services.MLogFactory;
import Utils.BHash;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * Servlet implementation class UserController
 */
@WebServlet("/admin/StaffController")
public class StaffsController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Inject
    IUserService userService;

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action") != null ? request.getParameter("action") : "get";
        switch (action) {
            case "get" -> get(request, response);
            case "detail" -> detail(request, response);
            case "create" -> create(request, response);
            case "login" -> login(request, response);
            case "put" -> put(request, response);
            default -> throw new IllegalArgumentException("Unexpected value: " + action);
        }

    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void get(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> users = userService.findAll();
        List<User> staffs = users
                .stream()
                .filter(user -> user.getRoleId() == 3)
                .toList();
        request.setAttribute("users", staffs);
        request.getRequestDispatcher("/admin/staffs-data-table.jsp").forward(request, response);
    }

    protected void login(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        User user = userService.findUserByEmail(email);
        HttpSession session = request.getSession();
        System.out.println(user);
        System.out.println(password);
        System.out.println(BHash.login(password, user.getPasswordHash()));
        String url = "/admin/DashboardController";
        String error = "";
        if (user != null) {
            if (BHash.login(password, user.getPasswordHash())&&user.getRoleId()!=2) {
                session.setAttribute("user", user);
            } else {
                url = "/admin/login.jsp";
                error = "Đăng nhập thất bại, vui lòng kiểm tra email hoặc mật khẩu";
            }
        } else {
            url = "/admin/login.jsp";
            error = "Đăng nhập thất bại, vui lòng kiểm tra email hoặc mật khẩu";
        }
        request.setAttribute("error", error);
        request.getRequestDispatcher(url).forward(request, response);
    }

    protected void detail(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int userId = request.getParameter("userId") != null ? Integer.parseInt(request.getParameter("userId")) : 0;
        User user = userService.findUserById(userId);
        request.setAttribute("user", user);
        request.setAttribute("action", "put");
        request.getRequestDispatcher("/admin/staffs-create-form.jsp").forward(request, response);
    }

    protected void create(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String fullName = request.getParameter("fullName");
        String phoneNumber = request.getParameter("phoneNumber");
        User user = new User();
        user.setEmail(email);
        user.setFullName(fullName);
        user.setPasswordHash(BHash.hashWithSalt(password));
        user.setPhone(phoneNumber);
        user.setStatus(new Status(1, ""));
        user.setRoleId(3);
        System.out.println(password);
        int userId = userService.signUp(user);
        user.setId(userId);
        userService.updateRole(user);
        get(request, response);
    }

    protected void put(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("userId") != null ? request.getParameter("userId") : "";
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String fullName = request.getParameter("fullName");
        String phoneNumber = request.getParameter("phoneNumber");
        User user = userService.findUserById(Integer.parseInt(userId));
        user.setEmail(email);
        user.setFullName(fullName);
        System.out.println(password);
        user.setPasswordHash(BHash.hashWithSalt(password));
        user.setPhone(phoneNumber);
        userService.update(user);
        get(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}

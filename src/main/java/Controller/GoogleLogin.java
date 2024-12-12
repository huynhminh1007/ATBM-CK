package Controller;

import Controller.cart.Cart;
import Model.*;
import Services.ICartService;
import Services.LogServiceManager;
import Services.MLogFactory;
import Services.UserServices;
import Utils.BHash;
import Utils.GoogleLoginHelper;

import javax.inject.Inject;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "GoogleLogin", value = "/GoogleLogin")
public class GoogleLogin extends HttpServlet {
    @Inject
    UserServices userServices;
    @Inject
    private ICartService cartService;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession();
        String code = request.getParameter("code");
        String error = request.getParameter("error");
        //neu nguoi dung huy uy quyen
        if (error != null) {
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
        GoogleLoginHelper gg = new GoogleLoginHelper();
        String accessToken = gg.getToken(code);
        GoogleAccount acc = gg.getUserInfo(accessToken);
        User user = userServices.findUserByEmail(acc.getEmail());
        LogServiceManager.getLogService().saveLog(MLogFactory.getLog(request, this, 2));
        if (user == null) {
            user = new User();
            user.setEmail(acc.getEmail());
            user.setFullName(acc.getName());
            user.setPasswordHash(BHash.hashWithSalt(acc.getId()));
            user.setRoleId(2);
            user.setPhone("");
            user.setStatus(new Status(1, ""));
            session.setAttribute("wishlist", new Wishlist());
            userServices.save(user);
            user = userServices.findUserByEmail(acc.getEmail());
        } else {
            List<CartItem> cartItems = cartService.findByUserId(user.getId());
            Map<Integer, CartItem> map = new HashMap<>();
            cartItems.forEach(ci -> {
                map.put(ci.getProduct().getId(), ci);
            });
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null) {
                cart = new Cart();
            }
            cart.addAll(user.getId(), map);
            session.setAttribute("cart", cart);
            session.setAttribute("wishlist", new Wishlist(userServices.getWishlist(user.getId())));
        }
        Log log = MLogFactory.getLog(request, this, 2);
        log.setDescription("Người dùng đăng nhập bằng tài khoản Google");
        LogServiceManager.getLogService().saveLog(log);
        session.setAttribute("user", user);
        String url = "tai-khoan.jsp";
        response.sendRedirect(url);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }
}
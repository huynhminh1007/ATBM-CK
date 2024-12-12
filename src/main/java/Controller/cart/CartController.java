package Controller.cart;

import Model.CartItem;
import Model.Log;
import Model.User;
import Services.ICartService;
import Services.ILogService;
import Services.LogServiceManager;
import Services.MLogFactory;
import Utils.JsonUtils;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.MessageFormat;

/**
 * Servlet implementation class Cart
 */
@WebServlet("/CartController")
public class CartController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private Cart cart;

    private final String PRODUCT_NOT_FOUND = "Lỗi, không tìm thấy sản phẩm";
    private final String ADD_SUCCESS = "Thêm vào giỏ hàng thành công";
    Log log;
    String fullName;
    @Inject
    private ICartService cartService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        log = MLogFactory.getLog(req, this, 1);
        User user = (User) req.getSession().getAttribute("user");
        fullName = user == null ? "Khách" : user.getFullName();
        if (action != null) {
            action = action.trim().toUpperCase();
        } else
            action = "";

        switch (action) {
            case "ADD" -> addToCart(req, resp);
            case "UPDATE" -> update(req, resp);
        }
    }

    private void update(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

        cart = (Cart) session.getAttribute("cart");

        if (cart == null)
            return;

        int idProduct = Integer.parseInt(req.getParameter("idProduct"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));
        JsonObject jsonResp = new JsonObject();
        int status;
        User user = (User) session.getAttribute("user");
        int userId = -1;
        if (user != null) userId = user.getId();

        if (cart.update(userId, idProduct, quantity)) {
            session.setAttribute("cart", cart);

            addJsonCart(cart.getItem(idProduct), jsonResp);

            status = HttpServletResponse.SC_OK;
        } else {
            jsonResp.addProperty("error", PRODUCT_NOT_FOUND);
            status = HttpServletResponse.SC_INTERNAL_SERVER_ERROR;
        }
        String des = MessageFormat.format("Người dùng  {0} cập nhập sản phẩm {1} với số lượng {2} trong giỏ hàng",
                fullName, idProduct, quantity);
        log.setDescription(des);
        LogServiceManager.getLogService().saveLog(log);
        JsonUtils.sendJsonResponse(resp, status, jsonResp.toString());
    }

    private void addToCart(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }

        int quantity = 1;
        quantity = req.getParameter("quantity") == null ? quantity : Integer.parseInt(req.getParameter("quantity"));
        int idProduct = Integer.parseInt(req.getParameter("idProduct"));
        JsonObject jsonResp = new JsonObject();
        int status;
        User user = (User) session.getAttribute("user");
        int userId = -1;
        if (user != null) userId = user.getId();
        if (cart.add(userId, idProduct, quantity)) {
            session.setAttribute("cart", cart);
            addJsonCart(cart.getItem(idProduct), jsonResp);
            jsonResp.addProperty("success", ADD_SUCCESS);
            status = HttpServletResponse.SC_OK;
        } else {
            jsonResp.addProperty("error", PRODUCT_NOT_FOUND);
            status = HttpServletResponse.SC_INTERNAL_SERVER_ERROR;
        }
        String des = MessageFormat.format("Người dùng {0} thêm sản phẩm  {1} vào giỏ hàng", fullName, idProduct);
        log.setDescription(des);
        LogServiceManager.getLogService().saveLog(log);
        JsonUtils.sendJsonResponse(resp, status, jsonResp.toString());
    }

    private void addJsonCart(CartItem item, JsonObject jsonResp) {
        jsonResp.addProperty("totalItems", cart.getTotalItems());
        jsonResp.addProperty("totalPrice", cart.getTotalPrice());
        jsonResp.addProperty("itemTotalPrice", item != null ? item.calculatePrice() : 0);

        jsonResp.add("item", new Gson().toJsonTree(item, CartItem.class));
    }
}
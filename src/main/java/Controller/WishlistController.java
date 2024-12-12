package Controller;

import Model.Product;
import Model.User;
import Model.Wishlist;
import Services.IProductService;
import Services.IUserService;
import Services.LogServiceManager;
import Services.MLogFactory;
import Utils.JsonUtils;
import com.google.gson.JsonObject;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/san-pham-yeu-thich")
public class WishlistController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Inject
    IUserService userService;

    @Inject
    IProductService productService;
    private Wishlist wishlist;

    public WishlistController() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("san-pham-yeu-thich.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        wishlist = (Wishlist) session.getAttribute("wishlist");

        if (user == null) {
            addToSession(req, resp);
        } else {
            add(req, resp, user.getId());
        }
    }

    private void add(HttpServletRequest req, HttpServletResponse resp, int userId) throws ServletException, IOException {
        String idParam = req.getParameter("productId");

        JsonObject jsonResp = new JsonObject();
        int status;

        if (idParam != null && !idParam.trim().isEmpty()) {
            int productId = Integer.parseInt(idParam);
            Product product = productService.findProductById(productId);
            if (product != null) {
                if (wishlist.add(product)) {
                    userService.addWishlist(userId, productId);
                    LogServiceManager
                            .getLogService()
                            .saveLog(MLogFactory
                                    .getLog(req, this, 1, "Người dùng thêm sản phẩm " + product.getName() + " vào wishlist"));
                    jsonResp.addProperty("status", "add");
                } else {
                    LogServiceManager
                            .getLogService()
                            .saveLog(MLogFactory
                                    .getLog(req, this, 1, "Người dùng xóa sản phẩm " + product.getName() + " khỏi wishlist"));
                    userService.removeWishlist(userId, productId);
                    jsonResp.addProperty("status", "remove");
                }
            }

            jsonResp.addProperty("totalWishlist", wishlist.size());
            status = HttpServletResponse.SC_OK;
        } else {
            status = HttpServletResponse.SC_INTERNAL_SERVER_ERROR;
        }
        JsonUtils.sendJsonResponse(resp, status, jsonResp.toString());
    }

    private void addToSession(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idParam = req.getParameter("productId");

        JsonObject jsonResp = new JsonObject();
        int status;

        if (idParam != null && !idParam.trim().isEmpty()) {
            int productId = Integer.parseInt(idParam);
            Product product = productService.findProductById(productId);

            if (product != null) {
                if (wishlist.add(product)) {
                    jsonResp.addProperty("status", "add");
                } else {
                    jsonResp.addProperty("status", "remove");
                }
            }

            jsonResp.addProperty("totalWishlist", wishlist.size());

            status = HttpServletResponse.SC_OK;
        } else {
            status = HttpServletResponse.SC_INTERNAL_SERVER_ERROR;
        }
        JsonUtils.sendJsonResponse(resp, status, jsonResp.toString());
    }
}

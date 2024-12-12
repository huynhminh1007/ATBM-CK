package Controller.cart;

import java.io.IOException;
import java.net.http.HttpResponse;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import Services.ICategoryService;
import Services.IDiscountService;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

import Model.CartItem;
import Utils.JsonUtils;

/**
 * Servlet implementation class Cart
 */
@WebServlet("/CartDispatcher")
public class CartDispatcher extends HttpServlet {
    @Inject
    IDiscountService discountService;

    @Inject
    ICategoryService categoryService;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("discounts",discountService.findAllActive());
        req.setAttribute("categories", categoryService.findAll());
        req.getRequestDispatcher("gio-hang.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
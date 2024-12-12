package Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import Database.DiscountDAO;
import Model.Categories;
import Model.Discounts;
import Model.Product;
import Model.Wishlist;
import Services.ICategoryService;
import Services.IDiscountService;
import Services.IProductService;
import Services.ProductService;
import Utils.JsonUtils;

@WebServlet("/san-pham")
public class ProductController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    @Inject
    IProductService productService;
    @Inject
    IDiscountService discountService;
    @Inject
    ICategoryService categoryService;

    private int page, pageSize;
    private boolean isSale;
    private String action;
    private int categoryId;

    public ProductController() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        getParams(req, resp);
        List<Discounts> discounts = discountService.findAllActive();
        List<Categories> categories = categoryService.findAll();
        req.setAttribute("count", getCount(req, resp));
        req.setAttribute("page", page);
        req.setAttribute("discounts", discounts);
        req.setAttribute("categories", categories);
        req.setAttribute("action", action);
        getFilters(req, resp).forEach((k, v) -> {
            req.setAttribute(k, v);
        });
        String[] order = getOrder(req, resp);
        req.setAttribute("order", order[0]);
        req.setAttribute("sort", order[1]);
        req.setAttribute("category", categoryId);
        req.getRequestDispatcher("san-pham.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        getParams(req, resp);
        if (req.getParameter("need") != null) {
            sendParam(req, resp);
            return;
        }
        JsonObject jsonResp = new JsonObject();
        int status;
        if (action != null) {
            jsonResp.addProperty("count", getCount(req, resp));
        }
        String[] order = getOrder(req, resp);
        List<Product> productList = findProducts(getFilters(req, resp), order[0], order[1]);

        if (productList != null) {
            Wishlist wishlist = (Wishlist) req.getSession().getAttribute("wishlist");
            if (wishlist == null)
                wishlist = new Wishlist();
            jsonResp.add("wishlist", new Gson().toJsonTree(wishlist.getWishListId()).getAsJsonArray());

            jsonResp.add("productList", new Gson().toJsonTree(productList).getAsJsonArray());
            status = HttpServletResponse.SC_OK;
        } else {
            status = HttpServletResponse.SC_INTERNAL_SERVER_ERROR;
        }

        JsonUtils.sendJsonResponse(resp, status, jsonResp.toString());
    }

    private void sendParam(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        JsonObject jsonResp = new JsonObject();

        switch (req.getParameter("need")) {
            case "count":
                isSale = req.getParameter("isSale") != null ? Boolean.parseBoolean(req.getParameter("isSale")) : false;
                jsonResp.addProperty("count", getCount(req, resp));
                break;
        }
        jsonResp.addProperty("category", categoryId);
        JsonUtils.sendJsonResponse(resp, HttpServletResponse.SC_OK, jsonResp.toString());
    }

    private String[] getOrder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String order = req.getParameter("order") != null ? req.getParameter("order").trim() : "";
        String sort = req.getParameter("sort") != null ? req.getParameter("sort").trim() : "";

        return new String[]{order, sort};
    }

    private Map<String, Object> getFilters(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String minPriceParam = req.getParameter("minPrice") != null ? req.getParameter("minPrice").trim() : "";
        String maxPriceParam = req.getParameter("maxPrice") != null ? req.getParameter("maxPrice").trim() : "";
        categoryId = req.getParameter("category") != null ? Integer.valueOf(req.getParameter("category").trim()) : 0;

        double minPrice = !minPriceParam.isEmpty() ? Double.parseDouble(minPriceParam) : 0;
        double maxPrice = !maxPriceParam.isEmpty() ? Double.parseDouble(maxPriceParam) : 0;

        isSale = req.getParameter("isSale") != null ? Boolean.parseBoolean(req.getParameter("isSale")) : false;
        boolean isFreeShip = req.getParameter("isFreeShip") != null
                ? Boolean.parseBoolean(req.getParameter("isFreeShip"))
                : false;

        String name = req.getParameter("name") != null ? req.getParameter("name").trim() : "";

        Map<String, Object> filters = new HashMap<String, Object>();
        if (minPrice > 0) {
            filters.put("minPrice", minPrice);
        }
        if (maxPrice > 0) {
            filters.put("maxPrice", maxPrice);
        }
        if (isSale) {
            filters.put("isSale", isSale);
        }
        if (isFreeShip) {
            filters.put("isFreeShip", isFreeShip);
        }
        if (!name.isEmpty()) {
            filters.put("name", name);
        }
        if (categoryId != 0) {
            filters.put("category", categoryId);
        }
        return filters;
    }

    private int getCount(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int count = 0;

        switch (action) {
            case "all":
                if (isSale) {
                    count = productService.getCountProductSale();
                } else
                    count = productService.getCount();
                break;

            case "filter":
                if (isSale) {
                    count = productService.getCountProductSale(getFilters(req, resp));
                } else
                    count = productService.getCount(getFilters(req, resp));
                break;
        }
        return count;
    }

    private void getParams(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pageSizeParam = req.getParameter("pageSize");
        String pageParam = req.getParameter("page");
        page = (pageParam != null && pageParam.matches("\\d+")) ? Integer.parseInt(pageParam) : 1;
        pageSize = (pageSizeParam != null && pageSizeParam.matches("\\d+")) ? Integer.parseInt(pageSizeParam) : 16;
        action = req.getParameter("action") != null ? req.getParameter("action").trim() : "";
        categoryId = req.getParameter("category") != null ? Integer.valueOf(req.getParameter("category")) : 0;
    }

    private List<Product> findProducts(Map<String, Object> filters, String order, String sort) {
        if (filters != null && !filters.isEmpty()) {
            if (isSale) {
                return productService.findProductSaleByFilter(filters, pageSize, (page - 1) * pageSize, order, sort);
            }
            return productService.findProductByFilter(filters, pageSize, (page - 1) * pageSize, order, sort);
        } else {
            if (isSale) {
                return productService.findProductSales(pageSize, (page - 1) * pageSize, order, sort);
            }
            return productService.findAll(pageSize, (page - 1) * pageSize, order, sort);
        }
    }
}
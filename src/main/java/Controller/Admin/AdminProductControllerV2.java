package Controller.Admin;

import Database.ProductDAOV2;
import Model.Categories;
import Model.Product;
import Services.ICategoryService;
import Services.IProductService;
import Utils.JsonUtils;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.MessageFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/admin/quan-ly-san-pham")
public class AdminProductControllerV2 extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private ProductDAOV2 productDAOV2 = new ProductDAOV2();

    @Inject
    IProductService productService;

    @Inject
    ICategoryService categoryService;

    private List<Categories> categoriesList;
    private int totalRecords;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        categoriesList = categoryService.findAll();
        totalRecords = productDAOV2.getCount(new HashMap<>());

        req.setAttribute("categoriesList", categoriesList);
        req.getRequestDispatcher("/admin/products-data-table.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        switch (action.toLowerCase()) {
            case "get":
                get(req, resp);
                break;
        }
    }

    private void get(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int limit = Integer.parseInt(req.getParameter("length"));
        int offset = Integer.parseInt(req.getParameter("start"));
        String searchValue = req.getParameter("search[value]");
        String orderBy = req.getParameter("order[0][column]");
        String orderDir = req.getParameter("order[0][dir]");
        int categoryId = Integer.parseInt(req.getParameter("categoryId"));
        String status = req.getParameter("status").toLowerCase();
        String lastUpdated = req.getParameter("lastUpdated");

        if (orderBy != null && !orderBy.isEmpty()) {
            orderBy = req.getParameter(MessageFormat.format("columns[{0}][name]", Integer.parseInt(orderBy)));
        }

        Map<String, Object> filters = new HashMap<>();

        if (searchValue != null && !searchValue.isEmpty()) {
            filters.put("search", searchValue);
        }

        if(lastUpdated != null && !lastUpdated.isEmpty()) {
            filters.put("lastUpdated", lastUpdated);
        }

        if (status != null) {
            int statusId = 8;
            switch (status) {
                case "còn hàng":
                    statusId = 8;
                    break;
                case "hết hàng":
                    statusId = 9;
                    break;
            }
            filters.put("status", statusId);
        }

        if (categoryId > 0) {
            filters.put("category", categoryId);
        }

        int totalRecordsFiltered = productDAOV2.getCount(filters);
        JsonObject jsonObject = new JsonObject();

        if (totalRecordsFiltered != -1) {
            List<Product> data = productDAOV2.find(filters, limit, offset, orderBy, orderDir);
            jsonObject.addProperty("recordsFiltered", totalRecordsFiltered);
            jsonObject.add("data", new Gson().toJsonTree(data).getAsJsonArray());
        }

        jsonObject.addProperty("recordsTotal", totalRecords);
        JsonUtils.sendJsonResponse(resp, HttpServletResponse.SC_OK, jsonObject.toString());
    }
}

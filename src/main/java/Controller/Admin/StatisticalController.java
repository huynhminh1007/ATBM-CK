package Controller.Admin;

import Model.Categories;
import Model.ProductStatistics;
import Services.ICategoryService;
import Services.IProductService;
import Services.IProductStatisticsService;
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

@WebServlet("/admin/thong-ke")
public class StatisticalController extends HttpServlet {
    @Inject
    IProductService productService;

    @Inject
    IProductStatisticsService productStatisticsService;

    @Inject
    ICategoryService categoryService;

    private int totalRecords;
    private List<Categories> categoriesList;

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        totalRecords = productService.getCount();
        categoriesList = categoryService.findAll();

        req.setAttribute("categoriesList", categoriesList);
        req.getRequestDispatcher("/admin/thong-ke.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int limit = Integer.parseInt(req.getParameter("length"));
        int offset = Integer.parseInt(req.getParameter("start"));
        String searchValue = req.getParameter("search[value]");
        String orderBy = req.getParameter("order[0][column]");
        String orderDir = req.getParameter("order[0][dir]");
        int duration = Integer.parseInt(req.getParameter("duration"));
        String durationType = req.getParameter("durationType");
        int categoryId = Integer.parseInt(req.getParameter("categoryId"));
        String status = req.getParameter("status").toLowerCase();

        if (orderBy != null && !orderBy.isEmpty()) {
            orderBy = req.getParameter(MessageFormat.format("columns[{0}][name]", Integer.parseInt(orderBy)));
        }

        Map<String, Object> filters = new HashMap<>();

        if (searchValue != null && !searchValue.isEmpty()) {
            filters.put("search", searchValue);
        }
        if (categoryId > 0) {
            filters.put("category", categoryId);
        }
        if (status != null && !status.equalsIgnoreCase("-1")) {
            int statusId = 8;
            switch (status) {
                case "còn hàng":
                    statusId = 8;
                    break;
                case "hết hàng":
                    statusId = 9;
                    break;
            }
            if (status.equalsIgnoreCase("cần nhập")) {
                filters.put("requiredImport", true);
            } else {
                filters.put("status", statusId);
            }
        }

        int totalRecordsFiltered;
        if (duration == -1) {
            totalRecordsFiltered = productService.getCount(filters);
        } else {
            if (status.equalsIgnoreCase("cần nhập")) {
                totalRecordsFiltered = productStatisticsService.getCountProductRequiredImport(filters, duration, durationType);
            } else {
                totalRecordsFiltered = productStatisticsService.getCount(filters, duration, durationType);
            }
        }

        JsonObject jsonObject = new JsonObject();

        if (totalRecordsFiltered != -1) {
            List<ProductStatistics> data = productStatisticsService
                    .findProductStatisticsByFilter(filters, limit, offset, orderBy, orderDir, duration, durationType);
            jsonObject.addProperty("recordsFiltered", totalRecordsFiltered);
            jsonObject.add("data", new Gson().toJsonTree(data).getAsJsonArray());
        }

        jsonObject.addProperty("recordsTotal", totalRecords);
        JsonUtils.sendJsonResponse(resp, HttpServletResponse.SC_OK, jsonObject.toString());
    }
}
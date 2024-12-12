package Controller.Admin;

import Model.Categories;
import Model.Product;
import Model.ProductImport;
import Model.ProductSale;
import Services.ICategoryService;
import Services.IProductSaleService;
import Services.IProductService;
import Utils.JsonUtils;
import adapter.ProductSaleTypeAdapter;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import com.google.gson.JsonSyntaxException;
import com.google.gson.reflect.TypeToken;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Type;
import java.text.MessageFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/admin/quan-ly-giam-gia")
public class ProductSaleController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Inject
    IProductSaleService productSaleService;
    @Inject
    IProductService productService;

    @Inject
    ICategoryService categoryService;

    private List<Categories> categoriesList;
    private int totalRecords;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        categoriesList = categoryService.findAll();
        totalRecords = productSaleService.getCount(new HashMap<>());

        req.setAttribute("categoriesList", categoriesList);
        req.getRequestDispatcher("/admin/sale-management.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        switch (action.toLowerCase()) {
            case "search":
                search(req, resp);
                break;

            case "import":
                importProducts(req, resp);
                break;

            case "get":
                get(req, resp);
                break;
        }
    }

    private void importProducts(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String jsonData = req.getParameter("data");

        JsonObject jsonObject = new JsonObject();

        try {
            Gson gson = new GsonBuilder()
                    .registerTypeAdapter(ProductSale.class, new ProductSaleTypeAdapter())
                    .create();
            Type productListType = new TypeToken<List<ProductSale>>() {
            }.getType();

            List<ProductSale> productSales = gson.fromJson(jsonData, productListType);

            int rowAffected = productSaleService.save(productSales);

            jsonObject.addProperty("affected", rowAffected);
            JsonUtils.sendJsonResponse(resp, HttpServletResponse.SC_OK, jsonObject.toString());
        } catch (JsonSyntaxException e) {
            jsonObject.addProperty("msg", "Invalid JSON format");
            JsonUtils.sendJsonResponse(resp, HttpServletResponse.SC_BAD_REQUEST, jsonObject.toString());
        } catch (Exception e) {
            jsonObject.addProperty("msg", "Internal server error");
            JsonUtils.sendJsonResponse(resp, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, jsonObject.toString());
        }
    }

    private void search(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String request = req.getParameter("request").trim();
        String id = req.getParameter("id").trim();

        JsonObject jsonObject = new JsonObject();

        switch (request.toLowerCase()) {
            case "find-id-list":
                List<Integer> idList = productService.findId(id);
                jsonObject.add("data", new Gson().toJsonTree(idList).getAsJsonArray());
                break;

            case "find-product":
                Product product = productService.findProductById(Integer.parseInt(id));
                jsonObject.add("data", new Gson().toJsonTree(product));
                break;
        }
        JsonUtils.sendJsonResponse(resp, HttpServletResponse.SC_OK, jsonObject.toString());
    }

    private void get(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int limit = Integer.parseInt(req.getParameter("length"));
        int offset = Integer.parseInt(req.getParameter("start"));
        String searchValue = req.getParameter("search[value]");
        String orderBy = req.getParameter("order[0][column]");
        String orderDir = req.getParameter("order[0][dir]");
        int categoryId = Integer.parseInt(req.getParameter("categoryId"));
        String saleType = req.getParameter("saleType");
        String startDate = req.getParameter("startDate");
        String endDate = req.getParameter("endDate");

        if (orderBy != null && !orderBy.isEmpty()) {
            orderBy = req.getParameter(MessageFormat.format("columns[{0}][name]", Integer.parseInt(orderBy)));
        }

        Map<String, Object> filters = new HashMap<>();

        if (searchValue != null && !searchValue.isEmpty()) {
            filters.put("search", searchValue);
        }

        if (saleType != null && !saleType.isEmpty() && !saleType.equals("-1")) {
            filters.put("saleType", saleType);
        }

        if (startDate != null && !startDate.isEmpty()) {
            filters.put("startDate", startDate);
        }

        if (endDate != null && !endDate.isEmpty()) {
            filters.put("endDate", endDate);
        }

        if (categoryId > 0) {
            filters.put("category", categoryId);
        }

        int totalRecordsFiltered = productSaleService.getCount(filters);
        JsonObject jsonObject = new JsonObject();

        if (totalRecordsFiltered != -1) {
            List<ProductSale> data = productSaleService.find(filters, limit, offset, orderBy, orderDir);
            jsonObject.addProperty("recordsFiltered", totalRecordsFiltered);
            jsonObject.add("data", new Gson().toJsonTree(data).getAsJsonArray());
        }

        jsonObject.addProperty("recordsTotal", totalRecords);
        JsonUtils.sendJsonResponse(resp, HttpServletResponse.SC_OK, jsonObject.toString());
    }
}

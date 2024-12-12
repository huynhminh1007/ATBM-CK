package Controller.Admin;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Categories;
import Services.ICategoryService;

/**
 * Servlet implementation class CategoryController
 */
@WebServlet(name = "CategoryController", urlPatterns = {"/admin/Category"})
public class CategoryController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Inject
    ICategoryService categoryService;

    public CategoryController() {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action") != null ? request.getParameter("action") : "get";
        switch (action) {
            case "get" -> get(request, response);
            case "post" -> post(request, response);
            case "put" -> put(request, response);
            default -> throw new IllegalArgumentException("Unexpected value: " + action);
        }
    }

    private void get(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Categories> categories = categoryService.findAllAdmin();
        request.setAttribute("categories", categories);
        request.getRequestDispatcher("categories-data-table.jsp").forward(request, response);

    }

    private void post(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String categoryName = request.getParameter("category-name") != null ? request.getParameter("category-name")
                : "";
        int parentCategoryId = request.getParameter("category-parent-id") != null
                ? Integer.valueOf(request.getParameter("category-parent-id"))
                : 0;
        int active = request.getParameter("status") != null ? Integer.valueOf(request.getParameter("status")) : 1;
        Categories categories = new Categories();
        categories.setActive(active);
        categories.setName(categoryName);
        categories.setParentCategoryId(parentCategoryId);
        int re = categoryService.save(categories);
        String result = re > 0 ? "Thêm danh mục mới thành công" : "Thêm danh mục mới thất bại";
        request.setAttribute("result", result);
        get(request, response);
    }

    private void put(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String categoryName = request.getParameter("category-name") != null ? request.getParameter("category-name")
                : "";
        int parentCategoryId = request.getParameter("category-parent-id") != null
                ? Integer.valueOf(request.getParameter("category-parent-id"))
                : 0;
        int CategoryId = request.getParameter("CategoryId") != null
                ? Integer.valueOf(request.getParameter("CategoryId"))
                : 0;
        int active = request.getParameter("status") != null ? Integer.valueOf(request.getParameter("status")) : 1;
        Categories categories = new Categories();
        categories.setActive(active);
        categories.setId(CategoryId);
        categories.setName(categoryName);
        categories.setParentCategoryId(parentCategoryId);
        boolean re = categoryService.update(categories);
        String result = re ? "Cập nhập danh mục mới thành công" : "Cập nhập danh mục mới thất bại";
        request.setAttribute("result", result);
        get(request, response);

    }

}

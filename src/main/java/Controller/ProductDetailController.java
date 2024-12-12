package Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.Log;
import Services.ILogService;

import Model.Product;
import Model.ProductDetail;
import Services.IProductService;
import Services.LogServiceManager;
import Services.MLogFactory;

/**
 * Servlet implementation class ProductDetail
 */
@WebServlet("/ProductDetail")
public class ProductDetailController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Inject
    IProductService productService;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("productId"));
        ProductDetail productDetail = productService.findProductDetailById(id);
        if (productDetail != null) {
            addToVisitedProducts(productDetail, request);
            Log log = MLogFactory.getLog(request, this, 1);
            log.setDescription("Người dùng xem sản phẩm " + productDetail.getName());
            LogServiceManager.getLogService().saveLog(log);
            int categoryId = productDetail.getCategories().getId();
            List<Product> relativeProducts = productService.findProductByCategoryId(categoryId, 10, 1);
            List<Product> recommendedProducts = productService.find10Product();
            request.setAttribute("productDetail", productDetail);
            request.setAttribute("relativeProducts", relativeProducts);
            request.setAttribute("recommendedProducts", recommendedProducts);
            String url = "/product-detail.jsp";
            request.getRequestDispatcher(url).forward(request, response);
        } else {
            response.sendRedirect(request.getHeader("referer"));
        }
    }

    private void addToVisitedProducts(Model.ProductDetail productDetail, HttpServletRequest request) {
        HttpSession session = request.getSession();
        List<ProductDetail> visitedProducts = (List<ProductDetail>) session.getAttribute("visitedProducts");
        if (visitedProducts == null) {
            visitedProducts = new ArrayList<ProductDetail>();
        }
        for (ProductDetail p : visitedProducts) {
            if (p.getId() == productDetail.getId()) {
                visitedProducts.remove(p);
                break;
            }
        }
        visitedProducts.add(0, productDetail);
        if (visitedProducts.size() >= 10) {
            visitedProducts.add(0, productDetail);
            visitedProducts = visitedProducts.subList(1, visitedProducts.size());
        }
        session.setAttribute("visitedProducts", visitedProducts);

    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}

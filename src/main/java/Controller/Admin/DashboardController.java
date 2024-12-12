package Controller.Admin;

import Model.Orders;
import Model.User;
import Services.IOrderService;
import Services.IProductService;
import Services.IProductStatisticsService;
import Services.IUserService;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Servlet implementation class DashboardController
 */
@WebServlet("/admin/DashboardController")
public class DashboardController extends HttpServlet {
    @Inject
    IUserService userService;
    @Inject
    IProductService productService;
    @Inject
    IOrderService orderService;
    @Inject
    IProductStatisticsService productStatisticsService;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public DashboardController() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int userCount = userService.findAll().size() - 1;
        int productCount = productService.getCount();
        int orderCount = orderService.findAll().size();
        List<Orders> orders = orderService.findAll()
                .stream()
                .sorted(Comparator.comparing(Orders::getDateCreated).reversed())
                .limit(5).toList();
        List<User> users = userService.findAll().subList(0, 5);
        Map<Integer, Double> statisticsMap = productStatisticsService.getStatisTicMap();
        List<Integer> months = statisticsMap.keySet()
                .stream()
                .sorted()
                .toList();
        List<Double> revenues = months
                .stream()
                .map(statisticsMap::get)
                .toList();
        request.setAttribute("userCount", userCount);
        request.setAttribute("productCount", productCount);
        int requiredProductCount = 30;
        request.setAttribute("requiredProductCount", requiredProductCount);
        request.setAttribute("orderCount", orderCount);
        request.setAttribute("orders", orders);
        request.setAttribute("users", users);
        request.setAttribute("months", months);
        request.setAttribute("revenues", revenues);
        request.getRequestDispatcher("/admin/dashboard.jsp").forward(request, response);
        ;

    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}

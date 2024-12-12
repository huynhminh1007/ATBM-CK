package Controller.Admin;

import java.io.IOException;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import EmailService.IEmailService;
import Model.Order_details;
import Model.Orders;
import Model.Status;
import Services.IDiscountService;
import Services.IOrderDetailsService;
import Services.IOrderService;

/**
 * Servlet implementation class OrderController
 */
@WebServlet("/admin/OrderController")
public class OrderController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Inject
    IOrderService orderService;
    @Inject
    IOrderDetailsService orderDetailsService;
    @Inject
    IDiscountService discountService;
    @Inject
    IEmailService iEmailService;
    private final ExecutorService excutor = Executors.newFixedThreadPool(5);

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action") != null ? request.getParameter("action") : "get";
        switch (action) {
            case "get" -> get(request, response);
            case "getFilter" -> getFilter(request, response);
            case "detail" -> detail(request, response);
            case "put" -> put(request, response);

            default -> throw new IllegalArgumentException("Unexpected value: " + action);
        }

    }

    protected void getFilter(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Orders> orders = orderService.findAll();
        String statusCodeParameter = request.getParameter("status");
        System.out.println(statusCodeParameter);
        int statusCode = Integer.parseInt(statusCodeParameter);
        var filterOrders = orders.stream()
                .filter(o -> o.getStatus().getId() == statusCode)
                .toList();
        request.setAttribute("orders", filterOrders);
        request.setAttribute("statusCode", statusCodeParameter);
        request.getRequestDispatcher("/admin/orders-data-table.jsp").forward(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void get(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Orders> orders = orderService.findAll();
        request.setAttribute("orders", orders);
        request.getRequestDispatcher("/admin/orders-data-table.jsp").forward(request, response);
    }

    protected void detail(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int orderId = request.getParameter("orderId") != null ? Integer.valueOf(request.getParameter("orderId")) : 0;
        Orders order = orderService.findById(orderId);
        List<Order_details> order_details = orderDetailsService.findAllOrderId(orderId);
        var discount = discountService.findById(order.getDiscountId());
        order.setDetails(order_details);
        request.setAttribute("discount", discount);
        request.setAttribute("order", order);
        request.getRequestDispatcher("/admin/order-detail.jsp").forward(request, response);

    }

    public void sendOrderUpdate(String to, Orders orders) {
        String newStatus = orderService.findById(orders.getId()).getStatus().getDescription();
        String logoUrl = "https://firebasestorage.googleapis.com/v0/b/i-love-truyen.appspot.com/o/ltv%2Flogo_large.png?alt=media&token=a0cf5e2a-a21e-46c4-b036-d38354736cfb";
        String link = "http://localhost:8080/UserOrderController?action=detail&orderId=" + orders.getId();
        String body = "<div style=\"font-family: Arial, sans-serif; max-width: 600px; margin: 0 auto; padding: 20px; background-color: #f5f5f5; border: 1px solid #ddd; border-radius: 8px;\">\r\n"
                + "<h2 style=\"text-align: center; color: #4CAF50;\"><img src=\"" + logoUrl + "\" alt=\"Logo\" style=\"height: 50px; width: auto; margin-bottom: 10px;\"><br>Thông tin đơn hàng</h2>\r\n"
                + "<div style=\"background-color: #fff; padding: 15px; border-radius: 4px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);\">\r\n"
                + "<p>Xin chào bạn," + to + "</p>\r\n"
                + "<p>Đơn hàng của bạn " + newStatus + ". Click vào đây để xem <a href='" + link + "'>thông tin chi tiết</a</p>\r\n";
        var subject = "Đơn hàng của bạn đã được cập nhập";
        excutor.submit(() -> iEmailService.send(to, subject, body));

    }

    protected void put(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int statusId = request.getParameter("statusId") != null ? Integer.parseInt(request.getParameter("statusId")) : 0;
        int orderId = (request.getParameter("orderId") != null) ? Integer.parseInt(request.getParameter("orderId")) : 0;
        Orders order = orderService.findById(orderId);
        order.setStatus(new Status(statusId, ""));
        boolean re = orderService.updateStatus(order);
        String result = re ? "Cập nhập trạng thái đơn hàng thành công" : "Cập nhập trạng thái đơn hàng thất bại";
        sendOrderUpdate(order.getUser().getEmail(), order);
        request.setAttribute("result", result);
        detail(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}

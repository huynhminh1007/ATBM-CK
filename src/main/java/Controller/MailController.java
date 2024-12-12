package Controller;

import java.io.IOException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import EmailService.IEmailService;
import Model.Discounts;
import Model.Order_details;
import Model.Orders;
import Services.IDiscountService;
import Services.IOrderService;

/**
 * Servlet implementation class MailController
 */
@WebServlet("/MailController")
public class MailController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Inject
    IEmailService emailService;
    @Inject
    IOrderService orderService;
    @Inject
    IDiscountService discountService;
    private final ExecutorService executorService = Executors.newFixedThreadPool(5);

    /**
     * @see HttpServlet#HttpServlet()
     */
    public MailController() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
        int orderId = 0;
        try {
            orderId = Integer.parseInt(request.getParameter("orderId"));
        } catch (NumberFormatException e) {
            response.getWriter().append("Invalid orderId parameter.");
            return;
        }
        String email = request.getParameter("email");
        Orders orders = orderService.findById(orderId);
        if (orders == null) {
            response.getWriter().append("Order not found.");
            return;
        }
        sendOrderConfirmationEmail(email, orderId, orders);
        response.getWriter().append("Order confirmation email sent successfully.");
    }

    public void sendOrderConfirmationEmail(String to, double amount, Orders orders) {
        double totalPrice = orders.getTotalPrice();
        String formattedTotalPrice = String.format("%,.0f", totalPrice);
        String voucherInfo = getVoucherInfo(orders, amount);
        String logoUrl = "https://firebasestorage.googleapis.com/v0/b/i-love-truyen.appspot.com/o/ltv%2Flogo_large.png?alt=media&token=a0cf5e2a-a21e-46c4-b036-d38354736cfb";

        String body = "<div style=\"font-family: Arial, sans-serif; max-width: 600px; margin: 0 auto; padding: 20px; background-color: #f5f5f5; border: 1px solid #ddd; border-radius: 8px;\">\r\n"
                + "<h2 style=\"text-align: center; color: #4CAF50;\"><img src=\"" + logoUrl + "\" alt=\"Logo\" style=\"height: 50px; width: auto; margin-bottom: 10px;\"><br>Thông tin đơn hàng</h2>\r\n"
                + "<div style=\"background-color: #fff; padding: 15px; border-radius: 4px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);\">\r\n"
                + "<p>Xin chào bạn," + to + "</p>\r\n"
                + "<p>Đơn hàng của bạn đã được xác nhận. Dưới đây là thông tin chi tiết:</p>\r\n"
                + "<div style=\"margin-bottom: 20px;\">\r\n"
                + generateOrderDetailsHtml(orders)
                + "</div>\r\n"
                + "<p style=\"margin-bottom: 10px;\"><strong>Tổng tiền hàng:</strong> " + String.format("%,.0f", (totalPrice - orders.getShippingFee()) + amount) + " VNĐ</p>\r\n"
                + "<p style=\"margin-bottom: 10px;\">" + voucherInfo + "</p>\r\n"
                + "<p style=\"margin-bottom: 10px;\"><strong>Phí vận chuyển:</strong> " + String.format("%,.0f", orders.getShippingFee()) + " VNĐ</p>\r\n"
                + "<p style=\"margin-bottom: 10px;\"><strong>Tổng tiền thanh toán:</strong> " + formattedTotalPrice + " VNĐ</p>\r\n"
                + "</div>\r\n"
                + "<p style=\"text-align: center; margin-top: 20px; color: #777;\">Trân trọng,<br> Website Lương Thực Việt</p>\r\n"
                + "</div>";

        String subject = "Xác nhận đơn hàng #" + orders.getId() + " từ Lương Thực Việt";
        executorService.submit(() -> emailService.send(to, subject, body));

    }

    private String getVoucherInfo(Orders orders, double amount) {
        String voucherInfo = "";
        if (orders.getDiscountId() != 0) {
            Discounts discounts = discountService.findById(orders.getDiscountId());
            if (discounts.getType().equals("percentage")) {
                voucherInfo = "Ưu đãi: Giảm " + amount + " VNĐ từ voucher " + discounts.getCode();
            } else {
                voucherInfo = "Ưu đãi: Giảm " + discounts.getAmount() + " VNĐ từ voucher " + discounts.getCode();
            }
        }
        return voucherInfo;
    }

    private String generateOrderDetailsHtml(Orders orders) {
        StringBuilder sb = new StringBuilder();
        sb.append("<table style=\"width: 100%; border: 1px solid #ddd; border-collapse: collapse;\">");
        sb.append("<thead style=\"background-color: #f2f2f2;\">");
        sb.append("<tr>");
        sb.append("<th style=\"padding: 8px; text-align: left; border: 1px solid #ddd;\">Sản phẩm</th>");
        sb.append("<th style=\"padding: 8px; text-align: center; border: 1px solid #ddd;\">Số lượng</th>");
        sb.append("<th style=\"padding: 8px; text-align: center; border: 1px solid #ddd;\">Giá</th>");
        sb.append("</tr>");
        sb.append("</thead>");
        sb.append("<tbody>");

        // Loop through order items
        for (Order_details item : orders.getDetails()) {
            sb.append("<tr>");
            sb.append("<td style=\"padding: 8px; text-align: left; border: 1px solid #ddd;\">").append(item.getProduct().getName()).append("</td>");
            sb.append("<td style=\"padding: 8px; text-align: center; border: 1px solid #ddd;\">").append(item.getQuantity()).append("</td>");
            sb.append("<td style=\"padding: 8px; text-align: center; border: 1px solid #ddd;\">").append(String.format("%,.0f", item.getPrice())).append("</td>");
            sb.append("</tr>");
        }

        sb.append("</tbody>");
        sb.append("</table>");

        return sb.toString();
    }

}

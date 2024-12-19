package Controller;

import EmailService.IEmailService;
import Model.Discounts;
import Model.Order_details;
import Model.Orders;
import Services.IDiscountService;
import Services.IOrderService;
import Utils.pdf.PdfHelper;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

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

    public void sendVerifyOrderEmail(String to, double amount, Orders orders, String digitalSignature) {
        String body = generateOrderHtml(to, amount, orders, digitalSignature);

        byte[] pdfAttachment = new PdfHelper().generatePdfFromHtml(body, String.valueOf(orders.getUser().getId()), String.valueOf(orders.getId()), digitalSignature);
        String pdfFilename = "Order_ODR" + orders.getId() + ".pdf";

        String subject = "Hóa đơn đơn hàng #" + orders.getId() + " từ Lương Thực Việt";
        executorService.submit(() -> emailService.send(to, subject, body, pdfAttachment, pdfFilename));
    }

    private String generateOrderHtml(String to, double amount, Orders orders, String digitalSignature) {
        double totalPrice = orders.getTotalPrice();
        String formattedTotalPrice = String.format("%,.0f", totalPrice);
        String voucherInfo = getVoucherInfo(orders, amount);
        String username = orders.getUser().getUsername();
        String userId = String.valueOf(orders.getUser().getId());
        String logoUrl = "https://firebasestorage.googleapis.com/v0/b/i-love-truyen.appspot.com/o/ltv%2Flogo_large.png?alt=media&token=a0cf5e2a-a21e-46c4-b036-d38354736cfb";
        String logoSignature = "https://firebasestorage.googleapis.com/v0/b/i-love-truyen.appspot.com/o/ltv%2Fklipartz.com.png?alt=media&token=cfde9d34-9888-4dd0-ab97-5aaeb43c4928";

        String body = "<div style=\"font-family: Arial, sans-serif; max-width: 600px; margin: 0 auto; padding: 20px; background-color: #f5f5f5; border: 1px solid #ddd; border-radius: 8px;\">\r\n"
                + "<h2 style=\"text-align: center; color: #4CAF50;\"><img src=\"" + logoUrl + "\" alt=\"Logo\" style=\"height: 70px; width: auto; margin-bottom: 10px;\"><br>Thông tin đơn hàng</h2>\r\n"
                + "<div style=\"background-color: #fff; padding: 15px; border-radius: 4px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);\">\r\n"
                + "<p>Xin chào bạn, " + to + "</p>\r\n"
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
                + "<div style=\"text-align: center; margin-top: 20px; color: #333; font-size: 12px;\">\r\n"
                + "<img src=\"" + logoSignature + "\" alt=\"Logo Signature\" style=\"height: 50px; width: auto;\">\r\n"
                + "</div>\r\n"
                + "</div>";
        return body;
    }

    public void sendOrderConfirmationEmail(String to, double amount, Orders orders) {
        double totalPrice = orders.getTotalPrice();
        String formattedTotalPrice = String.format("%,.0f", totalPrice);
        String voucherInfo = getVoucherInfo(orders, amount);
        String username = orders.getUser().getUsername();
        String userId = String.valueOf(orders.getUser().getId());
        String logoUrl = "https://firebasestorage.googleapis.com/v0/b/i-love-truyen.appspot.com/o/ltv%2Flogo_large.png?alt=media&token=a0cf5e2a-a21e-46c4-b036-d38354736cfb";
        String activationUrl = "http://localhost:8080/kich-hoat.jsp?orderId=" + orders.getId();

        // Generate email body (HTML content)
        String body = generateEmailBody(to, username, userId, voucherInfo, formattedTotalPrice, orders, logoUrl, activationUrl, amount);

        // Generate PDF attachment
        byte[] pdfAttachment = new PdfHelper().generatePdfFromHtml(body);
        String pdfFilename = "Confirm_Order_ODR" + orders.getId() + ".pdf";

        String subject = "Xác nhận đơn hàng #" + orders.getId() + " từ Lương Thực Việt";

        // Send email asynchronously
        executorService.submit(() -> emailService.send(to, subject, body, pdfAttachment, pdfFilename));
    }

    private String generateEmailBody(String to, String username, String userId, String voucherInfo, String formattedTotalPrice, Orders orders, String logoUrl, String activationUrl, double amount) {
        double totalPrice = orders.getTotalPrice();
        StringBuilder bodyBuilder = new StringBuilder();
        bodyBuilder.append("""
                    <div style="font-family: Arial, sans-serif; max-width: 600px; margin: 0 auto; padding: 20px; background-color: #f5f5f5; border: 1px solid #ddd; border-radius: 8px;">
                        <h2 style="text-align: center; color: #4CAF50;">
                            <img src="%s" alt="Logo" style="height: 70px; width: auto; margin-bottom: 5px;"><br>Thông tin đơn hàng
                        </h2>
                        <div style="background-color: #fff; padding: 15px; border-radius: 4px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);">
                            <p>Xin chào, %s</p>
                            <p><strong>QUAN TRỌNG:</strong> Đây là chứng nhận quyền sử dụng các tiện ích cho phần mềm của Lương Thực Việt. Vui lòng lưu một bản sao tài liệu này để tham khảo sau.</p>
                            <p><strong>CHI TIẾT GIẤY PHÉP:</strong></p>
                            <ul>
                                <li>Loại: Giấy phép cá nhân</li>
                                <li>Mã tham chiếu*: R21106426</li>
                                <li>Ngày cấp: 21 Tháng 5, 2024</li>
                                <li>Hiệu lực đến: 20 Tháng 6, 2024</li>
                                <li>Số người dùng được phép: 1</li>
                            </ul>
                            <p>Kích hoạt phần mềm: <a href="%s">Kích hoạt ngay</a></p>
                """.formatted(logoUrl, to, activationUrl));

        // Thêm thông tin người dùng
        bodyBuilder.append("<p><strong>Người sử dụng:</strong>");
        if (username != null && !username.isBlank()) {
            bodyBuilder.append(" Tên: ").append(username).append(",");
        }
        bodyBuilder.append(" Mã khách hàng: ").append(userId).append("</p>");

        bodyBuilder.append("""
                    <p>ID Giấy phép: LYQ7H1BSK3</p>
                    <p><strong>Dưới đây là danh sách thông tin chi tiết đơn hàng của bạn:</strong></p>
                    <div style="margin-bottom: 20px;">
                        %s
                    </div>
                    <p style="margin-bottom: 10px;"><strong>Tổng tiền hàng:</strong> %,.0f VNĐ</p>
                    <p style="margin-bottom: 10px;">%s</p>
                    <p style="margin-bottom: 10px;"><strong>Phí vận chuyển:</strong> %,.0f VNĐ</p>
                    <p style="margin-bottom: 10px;"><strong>Tổng tiền thanh toán:</strong> %s VNĐ</p>
                        </div>
                    <p style="text-align: center; margin-top: 20px; color: #777;">Trân trọng,<br> Website Lương Thực Việt</p>
                    </div>
                """.formatted(
                generateOrderDetailsHtml(orders),
                (totalPrice - orders.getShippingFee()) + amount,
                voucherInfo,
                orders.getShippingFee(),
                formattedTotalPrice
        ));
        return bodyBuilder.toString();
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

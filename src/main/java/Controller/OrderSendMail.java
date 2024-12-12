package Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Controller.cart.Cart;
import Database.IUserDAO;
import Model.*;
import Services.IAddressService;
import Services.ICartService;
import Services.IDiscountService;
import Services.IOrderService;
import org.checkerframework.checker.units.qual.s;

/**
 * Servlet implementation class OrderSendMail
 */
@WebServlet("/OrderSendMail")
public class OrderSendMail extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Inject
    IOrderService orderService;
    @Inject
    IUserDAO userdao;
    @Inject
    ICartService cartService;
    @Inject
    IDiscountService discountService;
    @Inject
    IAddressService addressService;
    @Inject
    MailController mailController;
    private final ExecutorService executor = Executors.newFixedThreadPool(5);

    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderSendMail() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User user = (User) request.getSession().getAttribute("user");
        Cart cart = (Cart) request.getSession().getAttribute("cart");
        Discounts discounts = (Discounts) request.getSession().getAttribute("discount");
        List<CartItem> cartItems = cart.getCartItems();
        List<Order_details> order_details = new ArrayList<Order_details>();
        Orders orders = new Orders();
        orders.setStatus(new Status(4, ""));
        orders.setUser(user);
        double amount;
        double shipping = 40000;
        int discountId;
        String totalPrice;
        Discounts dis = new Discounts();
        if (discounts == null) {
            amount = 0;
            totalPrice = String.valueOf(cart.getTotalPrice() + shipping);
            discountId = 0;
        } else {
            discountId = discounts.getId();
            dis.setId(discountId);
            dis.setQuantity(discounts.getQuantity() - 1);
            totalPrice = request.getParameter("totalPrice");
            if (discounts.getType().equals("percentage")) {
                amount = cart.getTotalPrice() * ((double) discounts.getAmount() / 100);
            } else {
                amount = discounts.getAmount();
            }
        }
        orders.setTotalPrice(Double.parseDouble(totalPrice));
        orders.setDiscountId(discountId);
        orders.setPaymentMethod("COD");
        orders.setShippingFee(shipping);
        String selectedAddress = request.getParameter("selectedAddress");

        String province = request.getParameter("Province");
        String district = request.getParameter("District");
        String ward = request.getParameter("Ward");
        String note = request.getParameter("note");

        if ("other".equals(selectedAddress)) {
            System.out.println("khác");
            String customAddress = province + ", " + district + ", " + ward + ", Người nhận: " + user.getFullName() + ", Số điện thoại: " + user.getPhone();
            orders.setAddress(customAddress);
        } else {
            Address selectedAddr = addressService.findAddressId(Integer.parseInt(selectedAddress));
            String existingAddress = selectedAddr.getDescription() + ", " + selectedAddr.getWards() + ", " + selectedAddr.getDistricts() + ", " + selectedAddr.getProvince() + ", Người nhận: " + selectedAddr.getNameUser() + ", Số điện thoại: " + selectedAddr.getPhoneUser();
            orders.setAddress(existingAddress);
        }
        orders.setNote(note);
        discountService.updateQuantity(dis);
        int orderId = orderService.save(orders);
        orders.setId(orderId);
        for (CartItem cartItem : cartItems) {
            Order_details order_detail = new Order_details(orderId, cartItem.getProduct(), cartItem.getProductPrice(),
                    cartItem.getQuantity());
            order_details.add(order_detail);
        }
        orders.setDetails(order_details);
        orderService.save(order_details);
        session.removeAttribute("cart");
        cartService.delete(user.getId());
        user = userdao.findUserById(user.getId());
        String email = user.getEmail();
        request.getSession().setAttribute("user", user);
        request.setAttribute("orders", orders);
        request.setAttribute("amount", amount);
        executor.submit(() -> {
                    mailController.sendOrderConfirmationEmail(email, amount, orders);
                }
        );
        request.getRequestDispatcher("hoa-don.jsp").forward(request, response);
    }

}

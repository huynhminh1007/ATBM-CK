package Controller;

import Controller.cart.Cart;
import Model.CartItem;
import Model.Discounts;
import Model.Product;
import Model.User;
import Services.ICartService;
import Services.IDiscountService;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@WebServlet("/VoucherController")
public class VoucherController extends HttpServlet {

    private static final String PERCENTAGE = "percentage";
    private static final String FIXED = "fixed";
    private static final String FREESHIP = "FREESHIP";
    @Inject
    IDiscountService discountService;


    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String discountCode = request.getParameter("discountCode");
        String orderTotal = request.getParameter("totalPrice");

        if (session == null || discountCode == null || orderTotal == null) {
            response.getWriter().write("Invalid request parameters");
            return;
        }

        Cart cart = (Cart) session.getAttribute("cart");
        Discounts discount = discountService.findByCode(discountCode);

        if (discount != null) {
            if (discount.getCategoryId() > 0) {
                boolean isDiscountValidated = validateDiscount(cart, discount);
                if (!isDiscountValidated) {
                    response.getWriter().write("Discount code not supported for this category");
                    return;
                }
            }

            if (!discount.getExpDate().after(new Date())) {
                response.getWriter().write("Discount code has expired");
                return;
            }
            double orderTotalValue = Double.parseDouble(orderTotal);
            System.out.println(orderTotalValue + "===============");
            switch (discount.getType()) {
                case PERCENTAGE:
                    if (discount.getCondition() < orderTotalValue) {
                        System.out.println(discount.getCondition() + "*****************");
                        if (discountService.isApplicable(discount, Double.parseDouble(orderTotal))) {
                            double percentageAmount = Double.parseDouble(orderTotal) * (discount.getAmount() / 100.0);
                            session.setAttribute("discount", discount);
                            System.out.println(percentageAmount + "----------------");
                            response.getWriter().write(String.valueOf(percentageAmount));
                        } else {
                            response.getWriter().write("Discount is not applicable");
                        }
                    } else {
                        response.getWriter().write("Order total does not meet the minimum condition for this discount");
                    }
                    break;
                case FIXED:
                    if (discount.getCondition() < orderTotalValue) {
                        if (discountService.isApplicable(discount, Double.parseDouble(orderTotal))) {
                            double fixedAmount = discount.getAmount();
//                            System.out.println(fixedAmount + "----------------");
                            session.setAttribute("discount", discount);
                            response.getWriter().write(String.valueOf(fixedAmount));
                        } else {
                            response.getWriter().write("Discount is not applicable");
                        }
                    } else {
                        response.getWriter().write("Order total does not meet the minimum condition for this discount");
                    }
                    break;
                case FREESHIP:
                    // Handle free shipping discount
                    if (discount.getCondition() < orderTotalValue) {
                        if (discountService.isApplicable(discount, Double.parseDouble(orderTotal))) {
                            session.setAttribute("discount", discount);
                            response.getWriter().write(String.valueOf(discount.getAmount()));
                            break;
                        } else {
                            response.getWriter().write("Discount is not applicable");
                        }
                    } else {
                        response.getWriter().write("Order total does not meet the minimum condition for this discount");
                    }
                default:
                    response.getWriter().write("Unknown discount type");
                    break;
            }


        } else {
            // Discount code is invalid
            response.getWriter().write("Discount code is invalid");
        }
    }

    private boolean validateDiscount(Cart cart, Discounts discount) {
        var categoryId = discount.getCategoryId();
        System.out.println(categoryId);
        System.out.println();
        cart.getCartItems()
                .stream()
                .map(CartItem::getProduct)
                .map(Product::getCategories)
                .forEach(System.out::println);
        return cart.getCartItems().stream()
                .allMatch(c -> c.getProduct().getCategories().getId() == categoryId);

    }
}

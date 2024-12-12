package Controller;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Discounts;
import Model.Order_details;
import Model.Orders;
import Services.IDiscountService;
import Services.IOrderDetailsService;
import Services.IOrderService;

/**
 * Servlet implementation class UserOrderController
 */
@WebServlet("/UserOrderController")
public class UserOrderController extends HttpServlet {
	@Inject
	IOrderService orderService;
	@Inject
	IOrderDetailsService orderDetailsService;
	@Inject
	IDiscountService discountService;
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserOrderController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action") != null ? request.getParameter("action") : "get";
		switch (action) {
		case "detail" -> detail(request, response);
		default -> throw new IllegalArgumentException("Unexpected value: " + action);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected void detail(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int orderId = request.getParameter("orderId") != null ? Integer.valueOf(request.getParameter("orderId")) : 0;
		Orders order = orderService.findById(orderId);
		Discounts discounts = discountService.findById(order.getDiscountId());
		List<Order_details> order_details = orderDetailsService.findAllOrderId(orderId);
		order.setDetails(order_details);
		request.setAttribute("order", order);
		request.setAttribute("discounts", discounts);
		System.out.println(order);
		request.getRequestDispatcher("/order-detail.jsp").forward(request, response);

	}

}

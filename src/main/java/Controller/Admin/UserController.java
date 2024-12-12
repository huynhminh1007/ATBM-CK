package Controller.Admin;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Status;
import Model.User;
import Services.IAddressService;
import Services.IOrderDetailsService;
import Services.IUserService;

/**
 * Servlet implementation class UserController
 */
@WebServlet("/admin/UserController")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Inject
	IUserService userService;
	@Inject
    IAddressService addressService;
	@Inject
	IOrderDetailsService orderDetailsService;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action") != null ? request.getParameter("action") : "get";
		switch (action) {
		case "get" -> get(request, response);
		case "detail" -> detail(request, response);
		case "put" -> put(request, response);

		default -> throw new IllegalArgumentException("Unexpected value: " + action);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void get(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<User> users = userService.findAll();
		request.setAttribute("users", users);
		request.getRequestDispatcher("/admin/customers-data-table.jsp").forward(request, response);
	}

	protected void detail(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int userId = request.getParameter("userId") != null ? Integer.valueOf(request.getParameter("userId")) : 0;
		User user = userService.findUserById(userId);
		user = userService.findUserByEmail(user.getEmail());
		request.setAttribute("user", user);
		request.getRequestDispatcher("/admin/user-detail.jsp").forward(request, response);

	}

	protected void put(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int statusId = request.getParameter("statusId") != null ? Integer.valueOf(request.getParameter("statusId")) : 0;
		int userId = request.getParameter("userId") != null ? Integer.valueOf(request.getParameter("userId")) : 0;
		User user = userService.findUserById(userId);
		user.setStatus(new Status(statusId, ""));
		boolean re = userService.updateStatus(user);
		String result = re ? "Cập nhập trạng thái khách hàng thành công" : "Cập nhập trạng thái khách hàng thất bại";
		request.setAttribute("result", result);
		detail(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}

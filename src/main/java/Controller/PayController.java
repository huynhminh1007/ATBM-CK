package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.User;

@WebServlet("/thanh-toan")
public class PayController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = "thanh-toan.jsp";
		String error = "";
		User user = (User) req.getSession().getAttribute("user");
		if(user == null) {
			error = "Vui lòng đăng nhập trước  khi đặt hàng";
		}
		if (error.length() > 0) {
			req.setAttribute("error", error);
			url = "/login.jsp";
		}
		else {
			
		}
		req.setAttribute("user", user);
		req.getRequestDispatcher(url).forward(req, resp);
	}
}

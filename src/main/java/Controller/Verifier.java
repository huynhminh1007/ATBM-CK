package Controller;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import EmailService.EmailService;
import EmailService.IEmailService;
import Model.Verification;
import Services.IUserService;
import Services.IVerificationService;
import Services.UserServices;
import Services.VerificationService;

/**
 * Servlet implementation class Verifier
 */
@WebServlet("/Verifier")
public class Verifier extends HttpServlet {
	@Inject
	IVerificationService verificationService;
	
	@Inject
	IUserService userServices;
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Verifier() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action")==null?"":request.getParameter("action");
		if (action.equals("resend"))
			resend(request, response);
		else {
			verify(request, response);
		}

	}

	private void verify(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userId = 0;
		try {
			userId = Integer.valueOf(request.getParameter("userId"));
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		String token = request.getParameter("otp");
		request.setAttribute("userId", userId);
		int second = Integer.valueOf(request.getParameter("second"));
		String url = "/Verification.jsp";
		int verifyStatus = verificationService.verify(userId, token);
		switch (verifyStatus) {
		case 0:
			request.setAttribute("re", "Mã OTP không hợp lệ. Vui lòng nhập lại mã xác nhận!");
			break;
		case 1:
			request.setAttribute("re", "Chúc mừng bạn đã xác thực thành công. Vui lòng đăng nhập!");
			url = "login.jsp";
			break;
		case 2:
			request.setAttribute("re", "Đã hết thời gian nhập mã OTP. Vui lòng gửi lại mã xác nhận!");
			break;
		default:
			break;
		}
		request.setAttribute("second", second);
		request.getRequestDispatcher(url).forward(request, response);
	}

	private void resend(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int userId = Integer.valueOf(request.getParameter("userId"));
		String email = userServices.findUserById(userId).getEmail();
		Verification verification = verificationService.create(userId);
		verificationService.save(verification);
		verificationService.sendVerificationEmail(email, verification);
		response.getWriter().write("Gửi lại mã xác nhận thành công");
		destroy();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);

	}

}

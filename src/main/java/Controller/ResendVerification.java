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

import Model.Verification;
import Services.IUserService;
import Services.IVerificationService;
import Services.UserServices;
import Services.VerificationService;
import Utils.TokenGenerator;

/**
 * Servlet implementation class ResendVerification
 */
@WebServlet("/ResendVerification")
public class ResendVerification extends HttpServlet {
	@Inject
	IUserService userService;
	@Inject
	IVerificationService verificationService;
	private final ExecutorService excutor = Executors.newFixedThreadPool(5);

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ResendVerification() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		resend(request, response);
		request.setAttribute("second", 60);
		request.getRequestDispatcher("/Verification.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	private void resend(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int userId = Integer.valueOf(request.getParameter("userId"));
		String email = userService.findUserById(userId).getEmail();
		Verification verification = verificationService.create(userId);
		verificationService.save(verification);
		excutor.execute(() -> {
			verificationService.sendVerificationEmail(email, verification);
		});
		response.getWriter().write("Gửi lại mã xác nhận thành công");
		destroy();
	}

	@Override
	public void destroy() {
		excutor.shutdown();
	}
}

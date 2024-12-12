package Controller;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Services.ICategoryService;

/**
 * Servlet implementation class CategoryController
 */
@WebServlet("/Category")
public class CategoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Inject
	ICategoryService categoryService;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CategoryController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int CategoryId = request.getParameter("categoryId") != null
				? Integer.valueOf(request.getParameter("categoryId"))
				: 1;
		boolean isActive = categoryService.findById(CategoryId).getActive() == 1 ? true : false;
		String url = "Home";
		String error = "Danh mục này đã ngưng hoạt động";
		if (isActive) {
			url = "san-pham?action=filter&page=1&category=" + CategoryId;
		}
		request.setAttribute("error", error);
		request.getRequestDispatcher(url).forward(request, response);
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

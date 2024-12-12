package Controller.Admin;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.Collection;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import Model.Carousel;
import Services.ICarouselServices;

/**
 * Servlet implementation class UpdateCarousel
 */
@WebServlet("/admin/Carousel")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2 MB
		maxFileSize = 1024 * 1024 * 10, // 10 MB
		maxRequestSize = 1024 * 1024 * 50 // 50 MB
)
public class CarouselController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Inject
	ICarouselServices carouselServices;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CarouselController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Carousel> carouselControllers = carouselServices.findAll();
		request.setAttribute("carousels", carouselControllers);
		request.getRequestDispatcher("/admin/carousel-manager.jsp").forward(request, response);
		;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String newThumb = request.getParameter("thumb");
		for (Part part : request.getParts()) {
			String submitedFileName = part.getSubmittedFileName();
			String root = request.getServletContext().getRealPath("");
			if (part.getSubmittedFileName() != null && !part.getSubmittedFileName().isEmpty()) {
				newThumb = "images" + File.separator + "slider" + File.separator + submitedFileName;
				String fileName = root + File.separator + newThumb;
				part.write(fileName);
			}
		}
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int id = Integer.valueOf(request.getParameter("pos"));
		Carousel carousel = new Carousel();
		carousel.setId(id);
		carousel.setTitle(title);
		carousel.setThumb(newThumb);
		carousel.setContent(content);
		carouselServices.update(carousel);
		doGet(request, response);
	}

}

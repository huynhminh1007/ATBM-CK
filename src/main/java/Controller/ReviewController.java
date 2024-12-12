package Controller;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Log;
import Services.LogServiceManager;
import Services.MLogFactory;
import com.google.gson.Gson;

import Database.IReviewDAO;
import Model.Review;
import Model.User;
import Services.IReviewService;

/**
 * Servlet implementation class ReviewController
 */
@WebServlet("/ReviewController")
public class ReviewController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Inject
    IReviewService reviewService;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewController() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "post" -> add(request, response);
            case "put" -> update(request, response);

            default -> throw new IllegalArgumentException("Unexpected value: " + action);
        }
    }

    private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        int userId = user.getId();
        int rating = Integer.parseInt(request.getParameter("rating"));
        String contents = request.getParameter("contents");
        int productId = Integer.parseInt(request.getParameter("productId"));
        Review review = new Review(productId, userId, rating, contents);
        review.setUserName(user.getFullName());
        boolean status = reviewService.update(review);
        if (status) {
            Gson gson = new Gson();
            String jsonReview = gson.toJson(review);
            Log log = MLogFactory.getLog(request, this, 2, review);
            LogServiceManager.getLogService().saveLog(log);
            response.setContentType("application/json");
            response.getWriter().write(jsonReview);
        } else {
            response.setContentType("text/plain");
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("Đã xảy ra lỗi");
        }
    }

    private void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        int userId = user.getId();
        int rating = Integer.parseInt(request.getParameter("rating"));
        String contents = request.getParameter("contents");
        int productId = Integer.parseInt(request.getParameter("productId"));
        Review review = new Review(productId, userId, rating, contents);
        review.setUserName(user.getFullName());
        int status = reviewService.save(review);
        if (status > 0) {
            Gson gson = new Gson();
            String jsonReview = gson.toJson(review);
            Log log = MLogFactory.getLog(request, this, 2, review);
            LogServiceManager.getLogService().saveLog(log);
            response.setContentType("application/json");
            response.getWriter().write(jsonReview);
        } else {
            response.setContentType("text/plain");
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("Mỗi khách hàng chỉ nhận xét được 1 lần");
        }
    }

}

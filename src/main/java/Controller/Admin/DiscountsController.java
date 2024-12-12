package Controller.Admin;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Categories;
import Model.Discounts;
import Services.ICategoryService;
import Services.IDiscountService;

/**
 * Servlet implementation class DiscountsController
 */
@WebServlet("/admin/DiscountsController")
public class DiscountsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
     @Inject
     IDiscountService discountService;
	 @Inject
	 ICategoryService categoryService;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DiscountsController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Discounts> discounts = discountService.findAll();
		List<Categories> categories = categoryService.findAll();
		request.setAttribute("categories", categories);
		request.setAttribute("discounts", discounts);
		request.getRequestDispatcher("/admin/vouchers-data-table.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action") == null ? "" : request.getParameter("action").trim();
		if (action.equals("changeVoucher")) {
			changeVoucher(request, response);
		}
		else if(action.equals("deleteVoucher")) {
			deleteVoucher(request, response);
		}
		else {
			addVoucher(request, response);
		}
	}

	private void deleteVoucher(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int index = Integer.parseInt(request.getParameter("pos"));
		Discounts discounts = new Discounts();
		discounts.setId(index);
		discountService.delete(discounts);
		
		doGet(request, response);
	}

	private void changeVoucher(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int index = Integer.parseInt(request.getParameter("position"));
		System.out.println(index);
		int amount = Integer.parseInt(request.getParameter("amount"));
		String voucherCode = request.getParameter("voucherCode");
		String discountType = request.getParameter("discountType");
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		String description = request.getParameter("description");
		int voucherCategory = Integer.parseInt(request.getParameter("voucherCategory"));
		double condition = Double.parseDouble(request.getParameter("condition"));
		String expiryDateString  =request.getParameter("expiryDate");
		Date expiryDate = java.sql.Date.valueOf(expiryDateString);
		Discounts discounts = new Discounts();
		discounts.setId(index);;
		discounts.setAmount(amount);
		discounts.setCode(voucherCode);
		discounts.setType(discountType);
		discounts.setQuantity(quantity);
		discounts.setCategoryId(voucherCategory);
		discounts.setDescription(description);
		discounts.setCondition(condition);
		discounts.setExpDate(expiryDate);
		discountService.update(discounts);
		doGet(request, response);
		
		
	}

	private void addVoucher(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int amount = Integer.parseInt(request.getParameter("amount"));
		String voucherCode = request.getParameter("voucherCode");
		String discountType = request.getParameter("discountType");
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		String description = request.getParameter("description");
		int voucherCategory = Integer.parseInt(request.getParameter("voucherCategory"));
		double condition = Double.parseDouble(request.getParameter("condition"));
		String expiryDateString  =request.getParameter("expiryDate");
			Date expiryDate = java.sql.Date.valueOf(expiryDateString);
			Discounts discounts = new Discounts();
			discounts.setAmount(amount);
			discounts.setCode(voucherCode);
			discounts.setType(discountType);
			discounts.setQuantity(quantity);
			discounts.setCategoryId(voucherCategory);
			discounts.setDescription(description);
			discounts.setCondition(condition);
			discounts.setExpDate(expiryDate);
			discountService.save(discounts);
			
		doGet(request, response);
		
	}


}

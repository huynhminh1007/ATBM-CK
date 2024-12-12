package Controller.Admin;

import Model.*;
import Services.ICategoryService;
import Services.IProductService;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.util.*;

/**
 * Servlet implementation class AdminProductControllẻ
 */
@WebServlet("/admin/AdminProductController")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
		maxFileSize = 1024 * 1024 * 50, // 50MB
		maxRequestSize = 1024 * 1024 * 50) // 50MB
public class AdminProductController extends HttpServlet {
	@Inject
	IProductService productService;
	@Inject
	ICategoryService categoryService;
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminProductController() {
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action") != null ? request.getParameter("action") : "get";
		switch (action) {
		case "post" -> add(request, response);
		case "get" -> get(request, response);
		case "forward" -> forward(request, response);
		case "detail" -> detail(request, response);
		case "put" -> put(request, response);
		case "search" -> search(request, response);
		default -> throw new IllegalArgumentException("Unexpected value: " + action);
		}
	}

	private void search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		Map<String, Object> filter = new HashMap<String, Object>();
		filter.put("name", name);
		List<Product> products = productService.findProductByFilter(filter, 40, 0);
		request.setAttribute("products", products);
		request.setAttribute("page", 1);
		request.setAttribute("totalPage", products.size());
		String url = "/admin/products-data-table.jsp";
		request.getRequestDispatcher(url).forward(request, response);
	}

	private void put(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String productName = request.getParameter("product_name");
		double costPrice = request.getParameter("product_buy_price") != null
				? Double.valueOf(request.getParameter("product_buy_price"))
				: 0;
		double unitPrice = request.getParameter("product_sell_price") != null
				? Double.valueOf(request.getParameter("product_sell_price"))
				: 0;
		double weight = request.getParameter("product_weight") != null
				? Double.valueOf(request.getParameter("product_weight"))
				: 0;
		int quantity = request.getParameter("product_quantity") != null
				? Integer.valueOf(request.getParameter("product_quantity"))
				: 0;
		int danhMuc = request.getParameter("danhMuc") != null ? Integer.valueOf(request.getParameter("danhMuc")) : 0;
		int id = request.getParameter("product_id") != null ? Integer.valueOf(request.getParameter("product_id")) : 0;
		int blogId = request.getParameter("blogId") != null ? Integer.valueOf(request.getParameter("blogId")) : 0;
		List<Image> images = new ArrayList<>();
		String root = request.getServletContext().getRealPath("");
		Collection<Part> parts = request.getParts();
		for (Part part : parts) {
			String fileName = part.getSubmittedFileName();
			if (fileName != null && part.getSize() > 0) {
				String thumb = "images" + File.separator + "product-images" + File.separator + fileName;
				String destination = root + File.separator + thumb;
				part.write(destination);
				Image image = new Image();
				image.setPath(thumb);
				images.add(image);
			}
		}
		String blogContent = request.getParameter("blog");
		Blog blog = new Blog();
		blog.setId(blogId);
		blog.setContent(blogContent);
		productService.update(blog);
		Product product = new Product();
		product.setId(id);
		product.setName(productName);
		product.setUnitPrice(unitPrice);
		product.setWeight(weight);
		product.setCostPrice(costPrice);
		product.setUnitsInStock(quantity);
//		product.setBlogId(blogInt);
		Categories categories = new Categories();
		categories.setId(danhMuc);
		product.setCategories(categories);
		System.out.println(product);
		boolean saved = productService.update(product);
		for (Image i : images) {
			i.setProductId(id);
		}
		productService.save(images);
		get(request, response);
	}

	private void detail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int productId = request.getParameter("productId") != null ? Integer.valueOf(request.getParameter("productId"))
				: 0;
		ProductDetail productDetail = productService.findProductDetailById(productId);
		request.setAttribute("product", productDetail);
		request.setAttribute("product", productDetail);
		List<Categories> categories = categoryService.findAll();
		request.setAttribute("categories", categories);
		request.setAttribute("action", "put");
		request.getRequestDispatcher("/admin/new-product.jsp").forward(request, response);
	}

	private void get(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int page = 1;
		page = request.getParameter("page") != null ? Integer.valueOf(request.getParameter("page")) : page;
		List<Product> products = productService.findAll(10, (page - 1) * 10);
		int totalPage = productService.getCount();
		System.out.println(totalPage);
		request.setAttribute("products", products);
		request.setAttribute("page", page);
		request.setAttribute("totalPage", totalPage);
		String url = "/admin/products-data-table.jsp";
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

	private void forward(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Categories> categories = categoryService.findAll();
		request.setAttribute("categories", categories);
		request.setAttribute("action", "post");
		request.getRequestDispatcher("new-product.jsp").forward(request, response);
	}

	private void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String productName = request.getParameter("product_name");
		double costPrice = request.getParameter("product_buy_price") != null
				? Double.valueOf(request.getParameter("product_buy_price"))
				: 0;
		double unitPrice = request.getParameter("product_sell_price") != null
				? Double.valueOf(request.getParameter("product_sell_price"))
				: 0;
		double weight = request.getParameter("product_weight") != null
				? Double.valueOf(request.getParameter("product_weight"))
				: 0;
		int quantity = request.getParameter("product_quantity") != null
				? Integer.valueOf(request.getParameter("product_quantity"))
				: 0;
		int danhMuc = request.getParameter("danhMuc") != null ? Integer.valueOf(request.getParameter("danhMuc")) : 0;
		List<Image> images = new ArrayList<>();
		Collection<Part> parts = request.getParts();
		String root = request.getServletContext().getRealPath("");
		System.out.println(root);
		for (Part part : parts) {
			String fileName = part.getSubmittedFileName();
			if (fileName != null) {
				String thumb = "images" + File.separator + "product-images" + File.separator + fileName;
				String destination = root + File.separator + thumb;
				part.write(destination);
				Image image = new Image();
				image.setPath(thumb);
				images.add(image);
			}
		}
		String blogContent = request.getParameter("blog");
		Blog blog = new Blog();
		blog.setContent(blogContent);
		int blogInt = productService.save(blog);
		Product product = new Product();
		product.setName(productName);
		product.setUnitPrice(unitPrice);
		product.setWeight(weight);
		product.setCostPrice(costPrice);
		product.setUnitsInStock(quantity);
		product.setBlogId(blogInt);
		Categories categories = new Categories();
		categories.setId(danhMuc);
		product.setCategories(categories);
		product.setThumb(images.get(0).getPath());
		int productId = productService.save(product);
		for (Image i : images) {
			i.setProductId(productId);
		}
		productService.save(images);
		get(request, response);
	}

}

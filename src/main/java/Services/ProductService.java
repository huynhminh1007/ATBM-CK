package Services;

import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.inject.Inject;

import Model.*;
import Database.IProductDAO;
import Database.ProductDAO;

public class ProductService implements IProductService {
	@Inject
	IProductDAO productDAO;
	
	@Override
	public List<Product> findAll() {
		return null;
	}

	@Override
	public int save(Product t) {
		return productDAO.save(t);
	}

	@Override
	public boolean update(Product t) {
		return productDAO.update(t);
	}

	@Override
	public Product findProductById(int id) {
		return productDAO.findProductById(id);
	}

	@Override
	public List<Product> findProductByCategoryId(int id, int limit, int offSet) {
		return productDAO.findProductByCategoryId(id, limit, offSet);
	}

	@Override
	public ProductDetail findProductDetailById(int id) {
		return productDAO.findProductDetailById(id);
	}

	@Override
	public List<Product> findProductSales(int limit, int offSet) {
		return productDAO.findProductSales(limit, offSet);
	}

	@Override
	public List<Product> findProductByFilter(Map<String, Object> filters, int limit, int offSet) {
		return productDAO.findProductByFilter(filters, limit, offSet);
	}

	@Override
	public List<Product> findProductSaleByFilter(Map<String, Object> filters, int limit, int offSet) {
		return productDAO.findProductSaleByFilter(filters, limit, offSet);
	}

	@Override
	public int getCount(Map<String, Object> filters) {
		return productDAO.getCount(filters);
	}

	@Override
	public int getCount() {
		return productDAO.getCount();
	}

	@Override
	public List<Product> findAll(int limit, int offSet) {
		return productDAO.findAll(limit, offSet);
	}

	@Override
	public int getCountProductSale() {
		return productDAO.getCountProductSale();
	}

	@Override
	public int getCountProductSale(Map<String, Object> filters) {
		return productDAO.getCountProductSale(filters);
	}

	@Override
	public List<Product> findProductByCategoryId(int id) {
		return null;
	}

	@Override
	public List<Product> findProductSaleByFilter(Map<String, Object> filters, int limit, int offSet, String order,
			String sort) {
		return productDAO.findProductSaleByFilter(filters, limit, offSet, order, sort);
	}

	@Override
	public List<Product> findProductByFilter(Map<String, Object> filters, int limit, int offSet, String order,
			String sort) {
		return productDAO.findProductByFilter(filters, limit, offSet, order, sort);
	}

	@Override
	public List<Product> findAll(int limit, int offSet, String order, String sort) {
		return productDAO.findAll(limit, offSet, order, sort);
	}

	@Override
	public List<Product> findProductSales(int limit, int offSet, String order, String sort) {
		return productDAO.findProductSales(limit, offSet, order, sort);
	}

	@Override
	public List<Product> find10Product() {
		Random r = new Random();
		int offset = r.nextInt(10);
		return findAll(10, offset);
	}

	@Override
	public int save(Blog blog) {
		return productDAO.save(blog);
	}

	@Override
	public int save(List<Image> images) {
		return productDAO.save(images);
	}

	@Override
	public int save(Image image) {
		return productDAO.save(image);
	}

	@Override
	public boolean update(Blog blog) {
		return productDAO.update(blog);
	}

	@Override
	public boolean updateStatus(Product product) {
		return productDAO.updateStatus(product);
	}

	@Override
	public void sell(int id, int quantity) {
		Product product = findProductById(id);

		if(product instanceof ProductSale) {

		}

		if(product.getUnitsInStock() < quantity)
			//Không đủ hàng
			return;
		int amount = product.getUnitsInStock()-quantity;
		if(amount == 0){
			product.setStatus(new Status(9, "hết hàng"));
			updateStatus(product);
		}
		// Cập nhật lại số lượng tồn kho của sản phẩm
		product.setUnitsInStock(amount);
		update(product);
	}

	@Override
	public List<Integer> findId(String id) {
		return productDAO.findId(id);
	}
}

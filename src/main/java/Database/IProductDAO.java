package Database;

import java.util.List;
import java.util.Map;

import Model.ProductDetail;
import Model.ProductSale;
import Model.Blog;
import Model.Image;
import Model.Product;

public interface IProductDAO extends GenericDAO<Product> {
	List<Product> findAll(int limit, int offSet);

	Product findProductById(int id);

	List<Product> findProductByCategoryId(int id, int limit, int offSet);

	int save(Product p);

	boolean update(Product p);
	boolean updateStatus(Product product);

	ProductDetail findProductDetailById(int id);

	List<Product> findProductSales(int limit, int offSet);

	List<Product> findProductByFilter(Map<String, Object> filters, int limit, int offSet);

	List<Product> findProductSaleByFilter(Map<String, Object> filters, int limit, int offSet);

	int getCount(Map<String, Object> filters);

	int getCount();

	int getCountProductSale();

	int getCountProductSale(Map<String, Object> filters);

	List<Product> findAll(int limit, int offSet, String order, String sort);

	List<Product> findProductSales(int limit, int offSet, String order, String sort);

	List<Product> findProductSaleByFilter(Map<String, Object> filters, int limit, int offSet, String order,
			String sort);

	List<Product> findProductByFilter(Map<String, Object> filters, int limit, int offSet, String order, String sort);

	int save(Blog blog);

	int save(Image image);

	int save(List<Image> images);

	boolean update(Blog blog);
	List<Integer> findId(String id);
}

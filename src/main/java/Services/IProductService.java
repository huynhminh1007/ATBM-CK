package Services;

import java.util.List;
import java.util.Map;

import Model.ProductDetail;
import Model.Blog;
import Model.Image;
import Model.Product;

public interface IProductService extends IGenericService<Product> {
	List<Product> findProductByCategoryId(int id, int limit, int offSet);

	List<Product> findProductByCategoryId(int id);

	int save(Blog blog);
	boolean update(Blog blog);
	boolean updateStatus(Product product);
	int save(List<Image> images);
	int save(Image image);

	List<Product> find10Product();

	Product findProductById(int id);

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

	int save(Product product);

	void sell(int id, int quantity);
	List<Integer> findId(String id);
}

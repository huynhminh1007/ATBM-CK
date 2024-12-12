package RowMaper;

import java.sql.ResultSet;

import Model.Blog;
import Model.Product;
import Model.ProductDetail;
import Model.ProductSale;

public class ProductDetailMapper implements RowMapper<ProductDetail> {

	@Override
	public ProductDetail map(ResultSet r) {
		Product product = new ProductMapper().map(r);
		ProductDetail productDetail = new ProductDetail(product);
		if (product instanceof ProductSale) {
			ProductSale productSale = (ProductSale) product;
			productDetail.setNewPrice(productSale.getNewPrice());
			productDetail.setSale(productSale.getSale());
		}

		Blog blog = new BlogMapper().map(r);
		productDetail.setBlog(blog);
		return productDetail;
	}

}

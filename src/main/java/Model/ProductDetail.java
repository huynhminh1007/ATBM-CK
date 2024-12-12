package Model;

import java.util.List;

public class ProductDetail extends Product {
	Blog blog;
	List<Image> images;
	List<Review> reviews;
	String sale;
	double newPrice;

	int unitsInStock = getUnitsInStock();

	public ProductDetail(Product product) {
		super(product.getDateCreated(), product.getLastUpdated(), product.getId(), product.getName(),
				product.getCategories(), product.getCostPrice(), product.getUnitPrice(), product.getWeight(),
				product.getThumb(), product.getStatus(), product.getUnitsInStock());
	}

	public ProductDetail() {
	}
	public Blog getBlog() {
		return blog;
	}

	public void setBlog(Blog blog) {
		this.blog = blog;
	}

	public List<Image> getImages() {
		return images;
	}

	public void setImages(List<Image> images) {
		this.images = images;
	}

	public List<Review> getReviews() {
		return reviews;
	}

	public void setReviews(List<Review> reviews) {
		this.reviews = reviews;
	}

	public String getSale() {
		return sale;
	}

	public void setSale(String sale) {
		this.sale = sale;
	}

	public double getNewPrice() {
		return newPrice;
	}

	public void setNewPrice(double newPrice) {
		this.newPrice = newPrice;
	}
	

}

package Model;

import java.io.Serializable;
import java.sql.Date;
import Model.Categories;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.logging.SimpleFormatter;

public class Product extends Model implements Serializable {
	private int id;
	private String name;
	private int blogId;
	private Categories categories;
	private double costPrice;
	private double unitPrice;
	private double weight;
	private String thumb;
	private Status status;
	private int unitsInStock;

	public Product(Timestamp dateCreated, Timestamp lastUpdated, int id, String name, Categories categories,
			double costPrice, double unitPrice, double weight, String thumb, Status status, int unitsInStock) {
		super(dateCreated, lastUpdated);
		this.id = id;
		this.name = name;
		this.categories = categories;
		this.costPrice = costPrice;
		this.unitPrice = unitPrice;
		this.weight = weight;
		this.thumb = thumb;
		this.status = status;
		this.unitsInStock = unitsInStock;
	}

	public Product() {

	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Categories getCategories() {
		return categories;
	}

	public void setCategories(Categories categories) {
		this.categories = categories;
	}

	public double getCostPrice() {
		return costPrice;
	}

	public void setCostPrice(double costPrice) {
		this.costPrice = costPrice;
	}

	public double getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(double unitPrice) {
		this.unitPrice = unitPrice;
	}

	public double getWeight() {
		return weight;
	}

	public void setWeight(double weight) {
		this.weight = weight;
	}

	public String getThumb() {
		return thumb;
	}

	public void setThumb(String thumb) {
		this.thumb = thumb;
	}

	public Status getStatus() {
		return status;
	}

	public void setStatus(Status status) {
		this.status = status;
	}

	public int getUnitsInStock() {
		return unitsInStock;
	}

	public void setUnitsInStock(int unitsInStock) {
		this.unitsInStock = unitsInStock;
	}
	

	public int getBlogId() {
		return blogId;
	}

	public void setBlogId(int blogId) {
		this.blogId = blogId;
	}

	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", categories=" + categories + ", costPrice=" + costPrice
				+ ", unitPrice=" + unitPrice + ", weight=" + weight + ", thumb=" + thumb + ", status=" + status
				+ ", unitsInStock=" + unitsInStock + "]";
	}
}

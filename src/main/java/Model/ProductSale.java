package Model;

import java.sql.Timestamp;

public class ProductSale extends Product {
	private String sale;
	private double newPrice;
	private int quantity;
	private int quantitySold;
	private Timestamp startDateDiscount;
	private Timestamp endDateDiscount;	
	
	public ProductSale(Timestamp dateCreated, Timestamp lastUpdated, int id, String name, Categories categories,
			double costPrice, double unitPrice, double weight, String thumb, Status status, int unitsInStock,
			String sale, double newPrice, int quantity, int quantitySold, Timestamp startDateDiscount,
			Timestamp endDateDiscount) {
		super(dateCreated, lastUpdated, id, name, categories, costPrice, unitPrice, weight, thumb, status,
				unitsInStock);
		this.sale = sale;
		this.newPrice = newPrice;
		this.quantity = quantity;
		this.quantitySold = quantitySold;
		this.startDateDiscount = startDateDiscount;
		this.endDateDiscount = endDateDiscount;
	}

	public ProductSale(int id, String sale, double newPrice, int quantity, Timestamp startDateDiscount, Timestamp endDateDiscount) {
		setId(id);
		this.sale = sale;
		this.newPrice = newPrice;
		this.quantity = quantity;
		this.startDateDiscount = startDateDiscount;
		this.endDateDiscount = endDateDiscount;
	}

	public ProductSale(Product product) {
		super(product.getDateCreated(), product.getLastUpdated(), product.getId(), 
				product.getName(), product.getCategories(), product.getCostPrice(), 
				product.getUnitPrice(), product.getWeight(), product.getThumb(), product.getStatus(),
				product.getUnitsInStock());
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

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getQuantitySold() {
		return quantitySold;
	}

	public void setQuantitySold(int quantitySold) {
		this.quantitySold = quantitySold;
	}

	public Timestamp getStartDateDiscount() {
		return startDateDiscount;
	}

	public void setStartDateDiscount(Timestamp startDateDiscount) {
		this.startDateDiscount = startDateDiscount;
	}

	public Timestamp getEndDateDiscount() {
		return endDateDiscount;
	}

	public void setEndDateDiscount(Timestamp endDateDiscount) {
		this.endDateDiscount = endDateDiscount;
	}
	
	public double calculatePercentageSold() {
		return (double) quantitySold / quantity * 100;
	}

	@Override
	public String toString() {
		return "ProductSale [sale=" + sale + ", newPrice=" + newPrice + ", quantity=" + quantity + ", quantitySold="
				+ quantitySold + ", startDateDiscount=" + startDateDiscount + ", endDateDiscount=" + endDateDiscount
				+ "]";
	}
}

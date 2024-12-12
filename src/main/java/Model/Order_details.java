package Model;

public class Order_details {
	private int orderId;
	private Product product;
	private double price;
	private int quantity;

	/**
	 * Constructor khởi tạo một đối tượng Order_details với các thuộc tính được cung
	 * cấp.
	 *
	 * @param order_id   Mã định danh của đơn hàng
	 * @param product_id Mã định danh của sản phẩm
	 * @param price      Giá sản phẩm
	 * @param quantity   Số lượng sản phẩm
	 */

	// Getter và Setter cho các thuộc tính

	public Order_details() {
		super();
	}

	public Order_details(int orderId, Product product, double price, int quantity) {
		super();
		this.orderId = orderId;
		this.product = product;
		this.price = price;
		this.quantity = quantity;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public double calculatePrice() {
		double price = product instanceof ProductSale ? ((ProductSale) product).getNewPrice() : product.getUnitPrice();
		return price * this.quantity;
	}

	public double getProductPrice() {
		double price = product instanceof ProductSale ? ((ProductSale) product).getNewPrice() : product.getUnitPrice();
		return price;
	}

	@Override
	public String toString() {
		return "Order_details [orderId=" + orderId + ", product=" + product + ", price=" + price + ", quantity="
				+ quantity + "]";
	}

}

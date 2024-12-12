package Model;

public class CartItem {
	private Product product;
	private int quantity;

	public CartItem() {

	}

	public CartItem(Product product, int quantity) {
		this.product = product;
		this.quantity = quantity;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public void increase(int quantity) {
		int newQuantity = this.quantity + quantity;
		if(newQuantity>product.getUnitsInStock())
			throw new IllegalStateException("out of stock");
		this.quantity = newQuantity;
	}
	
	public void decrease(int quantity) {
		this.quantity -= quantity;
	}

	public double calculatePrice() {
		double price = product instanceof ProductSale? ((ProductSale) product).getNewPrice() : product.getUnitPrice();
		return price * this.quantity;
	}
	
	public double getProductPrice() {
		double price = product instanceof ProductSale? ((ProductSale) product).getNewPrice() : product.getUnitPrice();
		return price;
	}

	@Override
	public String toString() {
		return "CartItem [product=" + product + ", quantity=" + quantity + "]";
	}
}
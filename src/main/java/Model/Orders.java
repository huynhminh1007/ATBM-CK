package Model;

import java.sql.Timestamp;
import java.util.List;

public class Orders extends Model {
	private int id;
	private User user;
	private double totalPrice;
	private int discountId;
	private Status status;
	private String paymentMethod;
	private double shippingFee;
	private String address;
	private List<Order_details> details;
	private String note;
	public Orders() {
	}

	public Orders(Timestamp dateCreated, Timestamp lastUpdated, int id, User user, double totalPrice, int discountId,
			Status status, String paymentMethod, double shippingFee, String address, List<Order_details> details, String note) {
		super(dateCreated, lastUpdated);
		this.id = id;
		this.user = user;
		this.totalPrice = totalPrice;
		this.discountId = discountId;
		this.status = status;
		this.paymentMethod = paymentMethod;
		this.shippingFee = shippingFee;
		this.address = address;
		this.details = details;
		this.note = note;
	}

	public String getAddress() {
		return address;
	}

	public int getDiscountId() {
		return discountId;
	}

	/**
	 * Constructor khởi tạo một đối tượng Orders với các thuộc tính được cung cấp.
	 *
	 * @param id            Mã định danh của đơn hàng
	 * @param statusId      Mã định danh trạng thái đơn hàng
	 * @param userId        Mã định danh người dùng
	 * @param totalPrice    Tổng giá trị đơn hàng
	 * @param discountId    Mã định danh giảm giá
	 * @param paymentMethod Phương thức thanh toán
	 * @param shippingFee   Phí vận chuyển
	 * @param address       Địa chỉ giao hàng
	 * @param dateCreated   Ngày tạo đơn hàng
	 * @param lastUpdated   Ngày cập nhật đơn hàng
	 */

	// Getter và Setter cho các thuộc tính

	public int getId() {
		return id;
	}

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public double getShippingFee() {
		return shippingFee;
	}

	public Status getStatus() {
		return status;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public void setDiscountId(int discountId) {
		this.discountId = discountId;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public void setShippingFee(double shippingFee) {
		this.shippingFee = shippingFee;
	}

	public void setStatus(Status status) {
		this.status = status;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<Order_details> getDetails() {
		return details;
	}

	public void setDetails(List<Order_details> details) {
		this.details = details;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	@Override
	public String toString() {
		return "Orders{" +
				"id=" + id +
				", user=" + user +
				", totalPrice=" + totalPrice +
				", discountId=" + discountId +
				", status=" + status +
				", paymentMethod='" + paymentMethod + '\'' +
				", shippingFee=" + shippingFee +
				", address='" + address + '\'' +
				", details=" + details +
				", note='" + note + '\'' +
				'}';
	}
}

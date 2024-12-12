package Model;

import java.sql.Timestamp;
import java.util.Date;

public class Discounts {
	private int id;
	private int amount;
	private String code;
	private String type;
	private String description;
	private double condition;
	private Date expDate;
	private int categoryId;
	private int quantity;

	public Discounts(int id, int amount, String code, String type, String description, double condition, Date expDate, int categoryId, int quantity) {
		this.id = id;
		this.amount = amount;
		this.code = code;
		this.type = type;
		this.description = description;
		this.condition = condition;
		this.expDate = expDate;
		this.categoryId = categoryId;
		this.quantity = quantity;
	}

	/**
	 * Constructor khởi tạo một đối tượng Discounts với các thuộc tính được cung
	 * cấp.
	 *
	 * @param id          Mã định danh của mã giảm giá
	 * @param amount      Giá trị giảm giá
	 * @param code        Mã giảm giá
	 * @param type        Loại giảm giá
	 * @param description Mô tả giảm giá
	 * @param condition   Điều kiện áp dụng giảm giá
	 * @param expDate    Ngày hết hạn giảm giá
	 */

	// Getter và Setter cho các thuộc tính

	public Discounts(int amount, String code, String type, double condition,Date date, int categoryId, int quantity) {
		super();
		this.amount = amount;
		this.code = code;
		this.type = type;
		this.condition = condition;
		this.expDate = date;
		this.categoryId = categoryId;
		this.quantity =quantity;
	}

	public Discounts(int id, int amount, String code, String type, String description, double condition, Date expDate) {
		this.id = id;
		this.amount = amount;
		this.code = code;
		this.type = type;
		this.description = description;
		this.condition = condition;
		this.expDate = expDate;
	}

	public Discounts(int id, int quantity ) {
		this.id = id;
		this.quantity = quantity;
	}

	public Discounts() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public double getCondition() {
		return condition;
	}

	public void setCondition(double condition) {
		this.condition = condition;
	}

	public Date getExpDate() {
		return expDate;
	}

	public void setExpDate(Date date) {
		this.expDate = date;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	@Override
	public String toString() {
		return "Discounts{" +
				"id=" + id +
				", amount=" + amount +
				", code='" + code + '\'' +
				", type='" + type + '\'' +
				", description='" + description + '\'' +
				", condition=" + condition +
				", expDate=" + expDate +
				", categoryId=" + categoryId +
				", quantity=" + quantity +
				'}';
	}
}

package Model;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class User {
	private int id;
	private String username;
	private String passwordHash;
	private String fullName;
	private String email;
	private String phone;
	private int roleId;
	private Status status;
	private Date createdAt;
	private Date lastUpdated;
	private List<Address> addresses;
	private List<Orders> orders;

	/**
	 * Constructor khởi tạo một đối tượng User với các thuộc tính được cung cấp.
	 *
	 * @param id           Mã định danh của người dùng
	 * @param username     Tên đăng nhập
	 * @param email        Địa chỉ email
	 * @param fullName     Họ tên đầy đủ
	 * @param status       Trạng thái người dùng
	 * @param passwordHash Mật khẩu đã được băm
	 * @param phone        Số điện thoại
	 * @param roleId       Mã định danh của vai trò
	 * @param createdAt    Ngày tạo tài khoản
	 * @param lastUpdated  Ngày cập nhật tài khoản gần nhất
	 */


	public User(String passwordHash, String fullName, String email, Status status) {
		super();
		this.passwordHash = passwordHash;
		this.fullName = fullName;
		this.email = email;
		this.status = status;
	}

	public User(int id, String username, String passwordHash, String fullName, String email, String phone, int roleId,
			Status status, Date createdAt, Date lastUpdated, List<Address> addresses, List<Orders> orders) {
		super();
		this.id = id;
		this.username = username;
		this.passwordHash = passwordHash;
		this.fullName = fullName;
		this.email = email;
		this.phone = phone;
		this.roleId = roleId;
		this.status = status;
		this.createdAt = createdAt;
		this.lastUpdated = lastUpdated;
		this.addresses = addresses;
		this.orders = orders;
	}

	public User(String passwordHash, String fullName, String email, String phone, Status status) {
		super();
		this.passwordHash = passwordHash;
		this.fullName = fullName;
		this.email = email;
		this.phone = phone;
		this.status = status;
	}

	public User() {
		this.addresses = new ArrayList<Address>();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public Status getStatus() {
		return status;
	}

	public void setStatus(Status status) {
		this.status = status;
	}

	public String getPasswordHash() {
		return passwordHash;
	}

	public void setPasswordHash(String passwordHash) {
		this.passwordHash = passwordHash;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getRoleId() {
		return roleId;
	}

	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getLastUpdated() {
		return lastUpdated;
	}

	public void setLastUpdated(Date lastUpdated) {
		this.lastUpdated = lastUpdated;
	}

	public List<Address> getAddresses() {
		return addresses;
	}

	public void setAddresses(List<Address> addresses) {
		this.addresses = addresses;
	}

	public List<Orders> getOrders() {
		return orders;
	}

	public void setOrders(List<Orders> orders) {
		this.orders = orders;
	}
	public boolean addAdress(Address address) {
		return this.addresses.add(address);
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", passwordHash=" + passwordHash + ", fullName=" + fullName
				+ ", email=" + email + ", phone=" + phone + ", roleId=" + roleId + ", status=" + status + ", createdAt="
				+ createdAt + ", lastUpdated=" + lastUpdated + ", addresses=" + addresses + ", orders=" + orders + "]";
	}

	public void updateAdress(int index, Address address) {
		this.addresses.set(index, address);
		
	}

	public void deleteAdress(int index) {
		this.addresses.remove(index);		
	}

}

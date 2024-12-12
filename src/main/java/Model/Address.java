package Model;

public class Address {
	private int id;
	private int userId;
	private String nameUser;
	private String phoneUser;
	private String province;
	private String districts;
	private String wards;
	private String description;
	private boolean isDefault;
	

	/**
	 * Constructor khởi tạo một đối tượng Addresses với các thuộc tính được cung
	 * cấp.
	 *
	 * @param id          Mã định danh của địa chỉ
	 * @param province    Tỉnh/Thành phố
	 * @param districts   Quận/Huyện
	 * @param wards       Phường/Xã
	 * @param description Mô tả địa chỉ
	 */

	public Address() {
	}

	
	public Address( int userId, String nameUser, String phoneUser, String province, String districts,
			String wards, String description) {
		super();
		this.userId = userId;
		this.nameUser = nameUser;
		this.phoneUser = phoneUser;
		this.province = province;
		this.districts = districts;
		this.wards = wards;
		this.description = description;
	}


	public int getId() {
		return id;
	}

	public int getUserId() {
		return userId;
	}


	public void setUserId(int userId) {
		this.userId = userId;
	}


	public void setId(int id) {
		this.id = id;
	}

	public String getNameUser() {
		return nameUser;
	}

	public void setNameUser(String nameUser) {
		this.nameUser = nameUser;
	}

	public String getPhoneUser() {
		return phoneUser;
	}

	public void setPhoneUser(String phoneUser) {
		this.phoneUser = phoneUser;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getDistricts() {
		return districts;
	}

	public void setDistricts(String districts) {
		this.districts = districts;
	}

	public String getWards() {
		return wards;
	}

	public void setWards(String wards) {
		this.wards = wards;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	 
	
	public boolean isDefault() {
		return isDefault;
	}

	public void setDefault(boolean isDefault) {
		this.isDefault = isDefault;
	}


	@Override
	public String toString() {
		return "Address [id=" + id + ", userId=" + userId + ", nameUser=" + nameUser + ", phoneUser=" + phoneUser
				+ ", province=" + province + ", districts=" + districts + ", wards=" + wards + ", description="
				+ description + ", isDefault=" + isDefault + "]";
	}

	
	
	
}

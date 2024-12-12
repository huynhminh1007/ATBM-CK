package Database;

import java.util.List;

import Model.Address;
import Model.User;
import RowMaper.AddressMapper;

public class AddressDAO extends AbtractDAO<Address> implements IAddressDAO{

	@Override
	public List<Address> findAddressesById(int id) {
		String sql = "SELECT * FROM addresses where userId = ?";
		return querry(sql, new AddressMapper(), id);
	}

	@Override
	public Address findAddressId(int addressId) {
		String sql = "SELECT * FROM addresses WHERE addressId = ?";
		List<Address> addresses = querry(sql, new AddressMapper(), addressId);
		if (!addresses.isEmpty()) {
			return addresses.get(0);
		}
		return null;
	}

	@Override
	public List<Address> findAll() {
		String sql = "SELECT * FROM addresses";
		return querry(sql,new AddressMapper());
	}

	@Override
	public boolean update(Address address) {
		String sql =  "UPDATE addresses SET  userName = ?, userPhone=?, province =? , districts = ?, wards=?, description =?,  isDefault = ?  WHERE addressId = ?";
		int de = address.isDefault()?1:0;
		return update(sql, address.getNameUser(), address.getPhoneUser(), address.getProvince(), address.getDistricts(),address.getWards(), address.getDescription(), de , address.getId());
	}

	@Override
	public int save(Address address) {
		int de = address.isDefault()?1:0;
		String sql = "INSERT INTO addresses(userId,userName,userPhone,province,districts,wards,description, isDefault) VALUES (?,?,?,?,?,?,?,?)";
		return save(sql, address.getUserId(), address.getNameUser(), address.getPhoneUser(), address.getProvince(), address.getDistricts(),address.getWards(), address.getDescription(),de);
	}

	@Override
	public boolean delete(Address Addresses) {
		String sql = "DELETE FROM addresses WHERE addressId = ?";
		return update(sql, Addresses.getId());
	}
	public boolean updateDefaultAddress(int userId) {
		Address currentDefaultAddress = getDefaultAddressByUserId(userId);

		if (currentDefaultAddress != null) {
			currentDefaultAddress.setDefault(false);
			update(currentDefaultAddress);
			return true;
		}

		return false;
	}
	public Address getDefaultAddressByUserId(int userId) {
		String sql = "SELECT * FROM addresses WHERE userId = ? AND isDefault = 1";
		List<Address> addresses = querry(sql, new AddressMapper(), userId);
		if (!addresses.isEmpty()) {
			return addresses.get(0);
		}
		return null;
	}
	public static void main(String[] args) {
		AddressDAO dao = new AddressDAO();
		System.out.println(dao.save(new Address( 4, "minh","0343521","BR-VT", "dat do", "phuoc hai","gan khu van hoa")));
	}
}

package Database;

import java.util.List;

import Model.Address;


public interface IAddressDAO {
	List<Address> findAddressesById(int id);
	Address findAddressId(int addressId);
	List<Address> findAll();

	boolean update(Address Addresses);

	int save(Address address);

	boolean delete(Address Addresses);
	boolean updateDefaultAddress(int userId);
	Address getDefaultAddressByUserId(int userId);

}

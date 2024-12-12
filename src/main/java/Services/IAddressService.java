package Services;

import Model.Address;

public interface IAddressService extends IGenericService<Address>{
	boolean delete(Address address);
	Address findAddressById(int id);
	Address findAddressId(int addressId);
	boolean updateDefaultAddress(int userId);
	Address getDefaultAddressByUserId(int userId);

}

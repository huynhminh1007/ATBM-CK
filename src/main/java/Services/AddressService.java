package Services;

import java.util.List;

import Database.AddressDAO;
import Database.IAddressDAO;
import Model.Address;

public class AddressService implements IAddressService {

	private IAddressDAO addressDAO = new AddressDAO();

	@Override
	public List<Address> findAll() {
		// TODO Auto-generated method stub
		return addressDAO.findAll();
	}

	@Override
	public int save(Address t) {
		// TODO Auto-generated method stub
		return addressDAO.save(t);
	}

	@Override
	public boolean update(Address t) {
		return addressDAO.update(t);
	}

	@Override
	public boolean delete(Address address) {
		// TODO Auto-generated method stub
		return addressDAO.delete(address);
	}

	@Override
	public Address findAddressById(int id) {
		List<Address> address = addressDAO.findAddressesById(id);
		if (address.size() > 0) {
			return address.get(0);
		}
		return null;
	}

	@Override
	public Address findAddressId(int addressId) {
		return addressDAO.findAddressId(addressId);
	}

	@Override
	public boolean updateDefaultAddress(int userId) {
		return addressDAO.updateDefaultAddress(userId);
	}

	@Override
	public Address getDefaultAddressByUserId(int userId) {
		return addressDAO.getDefaultAddressByUserId(userId);
	}


	@Override
	public List<Address> findAll(int limit, int offSet) {
		// TODO Auto-generated method stub
		return null;
	}
	
}

package RowMaper;

import java.sql.ResultSet;
import java.sql.SQLException;

import Model.Address;
import RowMaper.column.AddressesColumn;

public class AddressMapper implements RowMapper<Address>{

	@Override
	public Address map(ResultSet r) {
		Address address = new Address();
		try {
			address.setId(r.getInt(AddressesColumn.AddressId.name()));
			address.setUserId(r.getInt(AddressesColumn.UserId.name()));
			address.setPhoneUser(r.getString(AddressesColumn.UserPhone.name()));
			address.setProvince(r.getString(AddressesColumn.Province.name()));
			address.setDistricts(r.getString(AddressesColumn.Districts.name()));
			address.setNameUser(r.getString(AddressesColumn.UserName.name()));
			address.setWards(r.getString(AddressesColumn.Wards.name()));
			address.setDescription(r.getString(AddressesColumn.Description.name()));
			address.setDefault(r.getBoolean(AddressesColumn.IsDefault.name()));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return address;
	}

}

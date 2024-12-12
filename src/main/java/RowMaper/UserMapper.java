package RowMaper;

import java.sql.ResultSet;
import java.sql.SQLException;

import Model.Status;
import Model.User;
import RowMaper.column.StatusColumn;
import RowMaper.column.UsersColumn;

public class UserMapper implements RowMapper<User> {

	@Override
	public User map(ResultSet r) {
		User user = new User();
		try {
			user.setId(r.getInt(UsersColumn.UserId.name()));
			user.setEmail(r.getString(UsersColumn.Email.name()));
			user.setPasswordHash(r.getString(UsersColumn.PasswordHash.name()));
			user.setFullName(r.getString(UsersColumn.FullName.name()));
			user.setPhone(r.getString(UsersColumn.Phone.name()));
			user.setStatus(new Status(r.getInt(StatusColumn.StatusId.name()), r.getString(StatusColumn.Description.name())));
			user.setRoleId(r.getInt(UsersColumn.RoleId.name()));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}

}

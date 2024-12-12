package RowMaper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Database.UserDAO;
import Model.Order_details;
import Model.Orders;
import Model.Product;
import Model.Status;
import Model.User;
import RowMaper.column.OrdersColumn;
import RowMaper.column.StatusColumn;

public class OrderMapper implements RowMapper<Orders> {

	@Override
	public Orders map(ResultSet r) {
		Orders orders = new Orders();

		try {
			orders.setId(r.getInt(OrdersColumn.OrderId.name()));
			orders.setStatus(
					new Status(r.getInt(StatusColumn.StatusId.name()), r.getString(StatusColumn.Description.name())));
			RowMapper<User> userMapper = new UserMapper();
			User user = userMapper.map(r);
			orders.setUser(user);
			orders.setTotalPrice(r.getDouble(OrdersColumn.TotalPrice.name()));
			orders.setDiscountId(r.getInt(OrdersColumn.DiscountId.name()));
			orders.setPaymentMethod(r.getString(OrdersColumn.PaymentMethod.name()));
			orders.setShippingFee(r.getDouble(OrdersColumn.ShippingFee.name()));
			orders.setAddress(r.getString(OrdersColumn.Address.name()));
			orders.setDateCreated(r.getTimestamp(OrdersColumn.DateCreated.name()));
			orders.setNote(r.getString(OrdersColumn.Note.name()));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return orders;
	}

}

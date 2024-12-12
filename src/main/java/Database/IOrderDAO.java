package Database;

import java.util.List;

import Model.Order_details;
import Model.Orders;

public interface IOrderDAO {
	List<Orders> findOrderById(int id);

	List<Orders> findOrderByUserId(int userId);

	List<Orders> findAll();

	boolean update(Orders order);

	int save(Orders order);

	boolean delete(Orders order);

	int save(List<Order_details> order_details);

	int save(Order_details order_details);

	boolean updateStatus(Orders orders);
}

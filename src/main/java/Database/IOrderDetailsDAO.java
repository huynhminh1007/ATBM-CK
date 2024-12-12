package Database;

import java.util.List;

import Model.Order_details;

public interface IOrderDetailsDAO {
	List<Order_details> findOrderDetailById(int id);

	List<Order_details> findOrderDetailByOrderId(int orderId);

	List<Order_details> findAll();

	boolean update(Order_details details);

	int save(Order_details details);

	boolean delete(Order_details details);

}

package Services;

import java.util.List;

import Model.Order_details;
import Model.Orders;

public interface IOrderService extends IGenericService<Orders> {
	List<Orders> findAll();

	Orders findById(int id);

	int save(Orders orders);

	boolean update(Orders orders);

	boolean updateStatus(Orders orders);

	int save(List<Order_details> order_details);
}

package Services;

import java.util.List;

import Model.Order_details;

public interface IOrderDetailsService extends IGenericService<Order_details> {

	List<Order_details> findAll();

	List<Order_details> findAllOrderId(int orderId);

	Order_details findById(int id);

	int save(Order_details details);

	boolean update(Order_details details);
}

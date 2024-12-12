package Services;

import java.util.List;

import javax.inject.Inject;

import Database.IOrderDAO;
import Model.Order_details;
import Model.Orders;

public class OrderService implements IOrderService {
	@Inject
	IOrderDAO orderDao;

	@Override
	public List<Orders> findAll(int limit, int offSet) {
		return null;
	}

	@Override
	public List<Orders> findAll() {
		// TODO Auto-generated method stub
		return orderDao.findAll();
	}

	@Override
	public Orders findById(int id) {
		// TODO Auto-generated method stub
		return  orderDao.findOrderById(id).get(0);
	}

	@Override
	public int save(Orders orders) {
		// TODO Auto-generated method stub
		return orderDao.save(orders);
	}

	@Override
	public boolean update(Orders orders) {
		// TODO Auto-generated method stub
		return orderDao.update(orders);
	}

	@Override
	public int save(List<Order_details> order_details) {
		return orderDao.save(order_details);
	}

	@Override
	public boolean updateStatus(Orders orders) {
		return orderDao.updateStatus( orders);
	}

}

package Services;

import java.util.List;

import javax.inject.Inject;

import Database.IOrderDetailsDAO;
import Model.Order_details;

public class OrderDetailsService implements IOrderDetailsService{
	@Inject
	IOrderDetailsDAO orderDetailDao;
	@Override
	public List<Order_details> findAll(int limit, int offSet) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Order_details> findAll() {
		// TODO Auto-generated method stub
		return orderDetailDao.findAll();
	}

	@Override
	public Order_details findById(int id) {
		// TODO Auto-generated method stub
		return (Order_details) orderDetailDao.findOrderDetailById(id);
	}

	@Override
	public int save(Order_details details) {
		// TODO Auto-generated method stub
		return orderDetailDao.save(details);
	}

	@Override
	public boolean update(Order_details details) {
		// TODO Auto-generated method stub
		return orderDetailDao.update(details);
	}

	@Override
	public List<Order_details> findAllOrderId(int orderId) {
		return orderDetailDao.findOrderDetailByOrderId(orderId);
	}

}

package Database;

import java.util.List;

import Model.Order_details;
import RowMaper.MyOrderDetailsMapper;
import RowMaper.OrderDetailsMapper;

public class OrderDetailsDAO extends AbtractDAO<Order_details> implements IOrderDetailsDAO {

	@Override
	public List<Order_details> findOrderDetailById(int id) {
		String sql = """
								SELECT * FROM orderdetails
				JOIN products on products.productId = orderdetails.productId
				join orders on orderdetails.orderId = orders.orderId
				join categories on categories.categoryId = products.categoryId
				join status   on status.statusId = products.statusId
				INNER JOIN products_sale ON products.productId = products_sale.productId
				where orderdetails.orderId = ?
								""";
		return querry(sql, new OrderDetailsMapper(), id);
	}

	@Override
	public List<Order_details> findAll() {

		return null;
	}

	@Override
	public boolean update(Order_details details) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int save(Order_details details) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean delete(Order_details details) {
		// TODO Auto-generated method stub
		return false;
	}

	public static void main(String[] args) {
		IOrderDetailsDAO orderDetailsDAO = new OrderDetailsDAO();
		orderDetailsDAO.findOrderDetailById(29).forEach(System.out::println);

	}

	@Override
	public List<Order_details> findOrderDetailByOrderId(int orderId) {
		String sql = """
								SELECT * FROM orderdetails
				JOIN products on products.productId = orderdetails.productId
				where orderdetails.orderId = ?
								""";
		return querry(sql, new MyOrderDetailsMapper(), orderId);
	}

}

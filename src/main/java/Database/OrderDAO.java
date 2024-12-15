package Database;

import Model.Order_details;
import Model.Orders;
import Model.Status;
import RowMaper.OrderMapper;
import Services.IProductService;

import javax.inject.Inject;
import java.util.List;

public class OrderDAO extends AbtractDAO<Orders> implements IOrderDAO {
    @Inject
    IProductService productService;

    @Override
    public List<Orders> findOrderById(int id) {
        String sql = "SELECT * FROM orders join status on status.statusId = orders.statusId join users on users.userId = orders.userId where orders.orderId = ?";
        return querry(sql, new OrderMapper(), id);
    }

    public Orders findById(int id) {
        String sql = """
                SELECT * FROM orders 
                JOIN status on status.statusId = orders.statusId 
                JOIN users on users.userId = orders.userId
                where orders.orderId = ?
                """;

        List<Orders> orders = querry(sql, new OrderMapper(), id);
        if (orders == null || orders.isEmpty())
            return null;
        Orders order = orders.get(0);
        order.setDetails(new OrderDetailsDAO().findOrderDetailByOrderId(order.getId()));

        return order;
    }

    @Override
    public List<Orders> findAll() {
        String sql = """
                				SELECT * FROM orders
                join status on status.statusId = orders.statusId
                JOIN users on users.userId = orders.userId
                """;
        return querry(sql, new OrderMapper());
    }

    @Override
    public boolean update(Orders order) {
        String sql = "UPDATE orders SET statusId = ?, userId=?, totalPrice =? , discountId = ?, paymentMethod=?, shippingFee =?, address = ? WHERE orderId = ?";
        return update(sql, order.getStatus().getId(), order.getUser().getId(), order.getTotalPrice(),
                order.getDiscountId(), order.getPaymentMethod(), order.getShippingFee(),
                order.getAddress(), order.getId());
    }

    @Override
    public int save(Orders order) {
        String sql = "INSERT INTO orders(statusId, userId, totalPrice, discountId, paymentMethod, shippingFee, address, note) VALUES (?,?,?,?,?,?,?,?)";
        return save(sql, order.getStatus().getId(), order.getUser().getId(), order.getTotalPrice(),
                order.getDiscountId(), order.getPaymentMethod(), order.getShippingFee(), order.getAddress(), order.getNote());
    }

    @Override
    public boolean delete(Orders order) {
        String sql = "DELETE FROM orders WHERE orderId = ?";
        return update(sql, order.getId());
    }

    public static void main(String[] args) {
//		Order_details od1 = new Order_details(3, 17, 50000, 3);
//		Order_details od2 = new Order_details(3, 17, 50000, 3);
//		List<Order_details> order_details = new ArrayList<Order_details>();
//		order_details.add(od1);
//		order_details.add(od2);
//        OrderDAO dao = new OrderDAO();
//        Orders o1 = dao.findOrderById(19).get(0);
//        o1.setStatus(new Status(5, null));
//        System.out.println(dao.findOrderById(29));

        OrderDAO dao = new OrderDAO();
        Orders order = dao.findById(87);
        System.out.println(order);
        System.out.println(dao.update(order));
    }

    @Override
    public int save(List<Order_details> order_details) {
        int re = 0;
        for (Order_details od : order_details) {
            save(od);
            productService.sell(od.getProduct().getId(), od.getQuantity());
            re++;
        }
        return re;
    }

    @Override
    public int save(Order_details order_details) {
        String sql = "INSERT INTO orderdetails(orderId,productId,price,quantity) VALUES(?,?,?,?)";
        return save(sql, order_details.getOrderId(), order_details.getProduct().getId(), order_details.getPrice(),
                order_details.getQuantity());
    }

    @Override
    public boolean updateStatus(Orders orders) {
        String sql = "UPDATE orders SET statusId = ? WHERE orders.orderId = ?";
        return update(sql, orders.getStatus().getId(), orders.getId());
    }

    @Override
    public List<Orders> findOrderByUserId(int userId) {
        String sql = "SELECT * FROM orders join status on status.statusId = orders.statusId join users on users.userId = orders.userId where orders.userId = ?";
        return querry(sql, new OrderMapper(), userId);
    }
}

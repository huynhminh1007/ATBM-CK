package Database;

import java.util.List;

import Model.Address;
import Model.Orders;
import Model.Product;
import Model.User;
import RowMaper.ProductMapper;
import RowMaper.UserMapper;

public class UserDAO extends AbtractDAO<User> implements IUserDAO {
    IAddressDAO addressDAO = new AddressDAO();
    IOrderDAO orderDAO = new OrderDAO();

    @Override
    public User findUserByEmail(String email) {
        String sql = "SELECT * FROM users join status on status.statusId = users.statusId where users.email = ?";
        List<User> list = querry(sql, new UserMapper(), email);
        User user = !list.isEmpty() ? list.get(0) : null;
        if (user != null) {
            List<Address> address = addressDAO.findAddressesById(user.getId());
            List<Orders> orders = orderDAO.findOrderByUserId(user.getId());
            user.setAddresses(address);
            user.setOrders(orders);
        }
        return user;
    }

    @Override
    public User findUserById(int id) {
        String sql = "SELECT * FROM users join status on status.statusId = users.statusId where users.userId = ?";
        List<User> list = querry(sql, new UserMapper(), id);
        User user = !list.isEmpty() ? list.get(0) : null;
        if (user != null) {
            List<Address> address = addressDAO.findAddressesById(user.getId());
            List<Orders> orders = orderDAO.findOrderByUserId(user.getId());
            user.setAddresses(address);
            user.setOrders(orders);
        }
        return user;
    }

    @Override
    public int save(User user) {
        String sql = "INSERT INTO users(passwordHash,fullName,email,phone,statusId) VALUES (?,?,?,?,?)";
        return save(sql, user.getPasswordHash(), user.getFullName(), user.getEmail(), user.getPhone(),
                user.getStatus().getId());
    }

    @Override
    public List<User> findAll() {
        String sql = "SELECT * FROM users join status on status.statusId = users.statusId";
        return querry(sql, new UserMapper());
    }

    @Override
    public boolean update(User user) {
        String sql = "UPDATE users SET email = ?, phone = ?,  passwordHash = ?,fullName=?,statusId=? WHERE userId = ?";
        return update(sql, user.getEmail(), user.getPhone(), user.getPasswordHash(), user.getFullName(),
                user.getStatus().getId(), user.getId());
    }

    @Override
    public boolean delete(User user) {
        String sql = "DELETE FROM users WHERE userId = ?";
        return update(sql, user.getId());
    }

    @Override
    public List<Product> getWithlist(int id) {
        String sql = """
                SELECT * FROM wishlists
                INNER JOIN products ON products.productId = wishlists.productId
                INNER JOIN categories ON products.categoryId = categories.categoryId
                INNER JOIN status ON products.statusId = status.statusId
                LEFT JOIN products_sale ON products.productId = products_sale.productId AND products_sale.endDateDiscount >= NOW()
                WHERE wishlists.userId = ?
                ORDER BY products.productId
                """;
        return querry(sql, new ProductMapper(), id);
    }

    @Override
    public boolean addWishlist(int userId, int productId) {
        String sql = "INSERT INTO wishlists (userId, productId) VALUES (?, ?)";
        return query(sql, userId, productId) == 1;
    }

    @Override
    public boolean removeWishlist(int userId, int productId) {
        String sql = "DELETE FROM wishlists WHERE userId = ? AND productId = ?";
        return query(sql, userId, productId) == 1;
    }

    public static void main(String[] args) {
        UserDAO userDAO = new UserDAO();
        System.out.println(userDAO.findUserById(6));
    }

    @Override
    public boolean updateRole(User user) {
        String sql = "UPDATE users SET roleId=? WHERE userId = ?";
        return update(sql, user.getRoleId(), user.getId());
    }

    @Override
    public boolean updateStatus(User user) {
        String sql = "UPDATE users SET statusId=? WHERE userId = ?";
        return update(sql, user.getStatus().getId(), user.getId());
    }
}

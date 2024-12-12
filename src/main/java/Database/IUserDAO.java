package Database;

import java.util.List;

import Model.Product;
import Model.User;

public interface IUserDAO extends GenericDAO<User> {
	User findUserByEmail(String email);

	User findUserById(int id);

	List<User> findAll();

	boolean update(User user);

	int save(User user);

	boolean delete(User user);
	
	List<Product> getWithlist(int id);
	boolean addWishlist(int userId, int productId);
	boolean removeWishlist(int userId, int productId);

	boolean updateRole(User user);

	boolean updateStatus(User user);
}

package Services;

import java.util.List;

import Model.Product;
import Model.User;

public interface IUserService extends IGenericService<User>{
	boolean delete(User user);
	User findUserByEmail(String email);
	User findUserById(int id);
	int signUp(User user);

	boolean updateRole(User user);

	boolean verify(int userId);
	boolean changePassword(int userId, String newPassword);
	List<Product> getWishlist(int id);
	boolean addWishlist(int userId, int productId);
	boolean removeWishlist(int userId, int productId);
	boolean updateStatus(User user);
}

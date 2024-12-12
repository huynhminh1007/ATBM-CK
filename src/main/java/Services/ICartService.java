package Services;

import Model.CartItem;

import java.util.List;

public interface ICartService extends IGenericService<CartItem> {
    List<CartItem> findByUserId(int userId);
    int insert(int userId, List<CartItem> cartItems);
    boolean update(int userId, List<CartItem> cartItems);

    boolean delete(int userId);
}

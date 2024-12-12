package Database;

import Controller.cart.Cart;
import Model.CartItem;

import java.util.List;

public interface ICartItemDAO extends GenericDAO<CartItem> {
    List<CartItem> findByUserId(int userId);
    int insert(int userId, List<CartItem> cartItems);
    boolean update(int userId, List<CartItem> cartItems);
    boolean delete(int userId);
    int getCountCartItems(int userId);
}
package Services;

import Database.ICartItemDAO;
import Model.CartItem;

import javax.inject.Inject;
import java.util.List;

public class CartService implements ICartService {

    @Inject
    ICartItemDAO cartItemDAO;

    @Override
    public List<CartItem> findByUserId(int userId) {
        return cartItemDAO.findByUserId(userId);
    }

    @Override
    public int insert(int userId, List<CartItem> cartItems) {
        return cartItemDAO.insert(userId, cartItems);
    }

    @Override
    public boolean update(int userId, List<CartItem> cartItems) {
        return cartItemDAO.update(userId, cartItems);
    }

    @Override
    public boolean delete(int userId) {
        return cartItemDAO.delete(userId);
    }

    @Override
    public List<CartItem> findAll() {
        return List.of();
    }

    @Override
    public List<CartItem> findAll(int limit, int offSet) {
        return List.of();
    }

    @Override
    public int save(CartItem cartItem) {
        return 0;
    }

    @Override
    public boolean update(CartItem cartItem) {
        return false;
    }
}

package Controller.cart;

import Database.CartDAO;
import Database.ICartItemDAO;
import Database.IProductDAO;
import Database.ProductDAO;
import Model.CartItem;
import Model.Product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class Cart {

    IProductDAO productDAO = new ProductDAO();
    ICartItemDAO cartItemDAO = new CartDAO();

    private Map<Integer, CartItem> cart;

    public Cart() {
        cart = new HashMap<Integer, CartItem>();
    }

    public Cart(Map<Integer, CartItem> cart) {
        this.cart = cart;
    }

    public boolean add(int userId, int productId) {
        return add(userId, productId, 1);
    }

    public boolean add(int userId, int productId, int quantity) {
        Product product = productDAO.findProductById(productId);
        if (product == null)
            return false;
        if (product.getUnitsInStock() < quantity)
            return false;
        CartItem cartItem = cart.getOrDefault(productId, new CartItem(product, 0));
        try {
            cartItem.increase(quantity);
        }
        catch (Exception e){
            e.printStackTrace();
            return false;
        }
        if (userId != -1) {
            if (getTotalItems() == 0) {
                cart.put(productId, cartItem);
                cartItemDAO.insert(userId, getCartItems());
            } else {
                cart.put(productId, cartItem);
                cartItemDAO.update(userId, getCartItems());
            }
        } else {
            cart.put(productId, cartItem);
        }

        return true;
    }

    public boolean update(int userId, int productId, int quantity) {
        Product product = productDAO.findProductById(productId);
        if (product == null)
            return false;
        CartItem cartItem = cart.get(productId);
        cartItem.setQuantity(quantity);
        if (product.getUnitsInStock() < quantity)
            return false;
        if (cartItem.getQuantity() <= 0) {
            cart.remove(productId);
        } else
            cart.put(productId, cartItem);

        if (userId != -1) {
            if (getTotalItems() <= 0) {
                cartItemDAO.delete(userId);
            } else {
                cartItemDAO.update(userId, getCartItems());
            }
        }

        return true;
    }

    public int getTotalItems() {
        return cart.size();
    }

    public double getTotalPrice() {
        return cart.values().stream().mapToDouble(CartItem::calculatePrice).sum();
    }

    public List<CartItem> getCartItems() {
        return cart.values().stream().collect(Collectors.toList());
    }

    public CartItem getItem(int id) {
        return cart.get(id);
    }

    public void setCart(Map<Integer, CartItem> cart) {
        this.cart = cart;
    }

    public void addAll(int userId, Map<Integer, CartItem> cart) {
        this.cart.putAll(cart);

        if (cartItemDAO.getCountCartItems(userId) == 0) {
            if (getTotalItems() != 0) {
                cartItemDAO.insert(userId, getCartItems());
            }
        } else {
            cartItemDAO.update(userId, getCartItems());
        }
    }
}
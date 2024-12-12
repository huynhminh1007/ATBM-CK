package Database;

import Model.CartItem;
import RowMaper.CartItemMapper;
import adapter.CartItemTypeAdapter;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;

import java.util.ArrayList;
import java.util.List;

public class CartDAO extends AbtractDAO<CartItem> implements ICartItemDAO {

    @Override
    public List<CartItem> findByUserId(int userId) {
        String sql = """
                     SELECT p.*, categories.*, `status`.*, products_sale.*, JSON_UNQUOTE(JSON_EXTRACT(ci.cartItem, '$.quantity')) AS quantityItem
                             FROM products p
                             JOIN (
                                 SELECT JSON_UNQUOTE(JSON_EXTRACT(cartItem, '$')) AS cartItem
                                 FROM carts, JSON_TABLE(cartItems, '$[*]' COLUMNS (
                                         cartItem JSON PATH '$'
                             						)) AS ci
                                 WHERE userId = ?
                             ) AS ci ON p.productId = JSON_UNQUOTE(JSON_EXTRACT(ci.cartItem, '$.productId'))
                             INNER JOIN categories ON p.categoryId = categories.categoryId
                             INNER JOIN status ON p.statusId = status.statusId
                             LEFT JOIN products_sale ON p.productId = products_sale.productId AND products_sale.endDateDiscount >= NOW()
                """;
        return querry(sql, new CartItemMapper(), userId);
    }

    @Override
    public int insert(int userId, List<CartItem> cartItems) {
        String sql = "INSERT INTO carts (userId, cartItems) VALUES (?, ?)";
        return save(sql, userId, toJson(cartItems));
    }

    @Override
    public boolean update(int userId, List<CartItem> cartItems) {
        String sql = "UPDATE carts SET cartItems = ? WHERE userId = ?";
        return update(sql, toJson(cartItems), userId);
    }

    @Override
    public boolean delete(int userId) {
        String sql = "DELETE FROM carts WHERE userId = ?";
        return update(sql, userId);
    }

    @Override
    public int getCountCartItems(int userId) {
        String sql = """
                SELECT count(*) AS cartItem
                FROM carts, JSON_TABLE(cartItems, '$[*]' COLUMNS (cartItem JSON PATH '$')) AS ci\s
                WHERE userId = ?
                """;
        return count(sql, userId);
    }


    private String toJson(List<CartItem> cartItems) {
        Gson gson = new GsonBuilder().registerTypeAdapter(CartItem.class, new CartItemTypeAdapter()).create();
        return gson.toJson(cartItems);
    }

    public static void main(String[] args) {
//        List<CartItem> cartItems = new CartDAO().findByUserId(12);
//        System.out.println(new CartDAO().update(1, cartItems));
        System.out.println(new CartDAO().getCountCartItems(12));
    }
}
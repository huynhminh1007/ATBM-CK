package RowMaper;

import Model.CartItem;
import Model.Product;

import java.sql.ResultSet;
import java.sql.SQLException;

public class CartItemMapper implements RowMapper<CartItem> {

    @Override
    public CartItem map(ResultSet r) throws SQLException {
        try {
            Product product = new ProductMapper().map(r);

            CartItem cartItem = new CartItem();

            cartItem.setQuantity(r.getInt("quantityItem"));
            cartItem.setProduct(product);

            return cartItem;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
}

package RowMaper;

import java.sql.ResultSet;
import java.sql.SQLException;

import Model.Order_details;
import Model.Product;
import RowMaper.column.OrderDetailsColumn;
import RowMaper.column.ProductsColumn;

public class MyOrderDetailsMapper implements RowMapper<Order_details> {

	@Override
	public Order_details map(ResultSet r) {
		Order_details details = new Order_details();
		try {
			details.setOrderId(r.getInt(OrderDetailsColumn.OrderId.name()));
			RowMapper<Product> productMapper = new ProductMapper();
			Product product = new Product();
			product.setName(r.getString(ProductsColumn.ProductName.name()));
			product.setThumb(r.getString(ProductsColumn.Thumb.name()));
			details.setProduct(product);
			details.setPrice(r.getDouble(OrderDetailsColumn.Price.name()));
			details.setQuantity(r.getInt(OrderDetailsColumn.Quantity.name()));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return details;
	}

}

package RowMaper;

import java.sql.ResultSet;
import java.sql.SQLException;

import Model.Discounts;
import RowMaper.column.DiscountsColumn;

public class DiscountMapper implements RowMapper<Discounts> {

	@Override
	public Discounts map(ResultSet r) {
		Discounts discounts = new Discounts();
		try {
			discounts.setId(r.getInt(DiscountsColumn.DiscountId.name()));
			discounts.setAmount(r.getInt(DiscountsColumn.Amount.name()));
			discounts.setCode(r.getString(DiscountsColumn.Code.name()));
			discounts.setCondition(r.getDouble(DiscountsColumn.Conditions.name()));
			discounts.setDescription(r.getString(DiscountsColumn.Description.name()));
			discounts.setType(r.getString(DiscountsColumn.Type.name()));
			discounts.setExpDate(r.getDate(DiscountsColumn.ExpDate.name()));
			discounts.setCategoryId(r.getInt(DiscountsColumn.CategoryId.name()));
			discounts.setQuantity(r.getInt(DiscountsColumn.Quantity.name()));
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return discounts;
	}

}

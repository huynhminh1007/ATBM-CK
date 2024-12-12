package RowMaper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import Model.Categories;
import Model.Product;
import Model.ProductSale;
import Model.Status;
import RowMaper.column.CategoriesColumn;
import RowMaper.column.ProductsColumn;
import RowMaper.column.StatusColumn;

public class ProductMapper implements RowMapper<Product> {

	@Override
	public Product map(ResultSet r) {
        Product re = new Product();
		try {
			re.setId(r.getInt(ProductsColumn.ProductId.name()));
			re.setName(r.getString(ProductsColumn.ProductName.name()));
			re.setCostPrice(r.getDouble(ProductsColumn.CostPrice.name()));
			re.setUnitPrice(r.getDouble(ProductsColumn.UnitPrice.name()));
			re.setWeight(r.getDouble(ProductsColumn.Weight.name()));
			re.setUnitsInStock(r.getInt(ProductsColumn.UnitsInStock.name()));
			re.setThumb(r.getString(ProductsColumn.Thumb.name()));
			re.setDateCreated(r.getTimestamp(ProductsColumn.DateCreated.name()));
			re.setLastUpdated(r.getTimestamp(ProductsColumn.LastUpdated.name()));
			re.setThumb(r.getString(ProductsColumn.Thumb.name()));
			Categories categories = new Categories();
			categories.setId(r.getInt(CategoriesColumn.CategoryId.name()));
			categories.setName(r.getString(CategoriesColumn.CategoryName.name()));
			categories.setParentCategoryId(r.getInt(CategoriesColumn.ParentCategoryId.name()));
			categories.setActive(r.getInt(CategoriesColumn.Active.name()));
			Status status = new Status(r.getInt(StatusColumn.StatusId.name()), r.getString(StatusColumn.Description.name()));
			re.setStatus(status);
			re.setCategories(categories);

			if(r.getString("sale") != null) {
				return mapProductSale(re, r);
			}
			return re;
		} catch (SQLException e) {
            if("Column 'sale' not found.".equalsIgnoreCase(e.getMessage())) {
                return re;
            }

			e.printStackTrace();
			return null;
		}
	}

	// Product Sale
	public ProductSale mapProductSale(Product product, ResultSet res) throws SQLException {
		String sale = res.getString("sale");
		double newPrice = res.getDouble("newPrice");
		int quantity = res.getInt("quantity");
		int quantitySold = res.getInt("quantitySold");
		Timestamp startDateDisounct = res.getTimestamp("startDateDiscount");
		Timestamp endDateDisounct = res.getTimestamp("endDateDiscount");
		ProductSale productSale = new ProductSale(product);
		productSale.setSale(sale);
		productSale.setNewPrice(newPrice);
		productSale.setQuantity(quantity);
		productSale.setQuantitySold(quantitySold);
		productSale.setStartDateDiscount(startDateDisounct);
		productSale.setEndDateDiscount(endDateDisounct);
		return productSale;
	}
}
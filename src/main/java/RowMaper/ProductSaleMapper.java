package RowMaper;

import Model.Categories;
import Model.Product;
import Model.ProductSale;
import Model.Status;
import RowMaper.column.CategoriesColumn;
import RowMaper.column.ProductsColumn;
import RowMaper.column.StatusColumn;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

public class ProductSaleMapper implements RowMapper<ProductSale> {
    @Override
    public ProductSale map(ResultSet r) throws SQLException {
        ProductSale re;

        try {
            Product product = new Product();

            product.setId(r.getInt(ProductsColumn.ProductId.name()));
            product.setName(r.getString(ProductsColumn.ProductName.name()));
            product.setCostPrice(r.getDouble(ProductsColumn.CostPrice.name()));
            product.setUnitPrice(r.getDouble(ProductsColumn.UnitPrice.name()));
            product.setWeight(r.getDouble(ProductsColumn.Weight.name()));
            product.setUnitsInStock(r.getInt(ProductsColumn.UnitsInStock.name()));
            product.setThumb(r.getString(ProductsColumn.Thumb.name()));
            product.setDateCreated(r.getTimestamp(ProductsColumn.DateCreated.name()));
            product.setLastUpdated(r.getTimestamp(ProductsColumn.LastUpdated.name()));
            product.setThumb(r.getString(ProductsColumn.Thumb.name()));
            Categories categories = new Categories();
            categories.setId(r.getInt(CategoriesColumn.CategoryId.name()));
            categories.setName(r.getString(CategoriesColumn.CategoryName.name()));
            categories.setParentCategoryId(r.getInt(CategoriesColumn.ParentCategoryId.name()));
            categories.setActive(r.getInt(CategoriesColumn.Active.name()));
            Status status = new Status(r.getInt(StatusColumn.StatusId.name()), r.getString(StatusColumn.Description.name()));
            product.setStatus(status);
            product.setCategories(categories);

            String sale = r.getString("sale");
            double newPrice = r.getDouble("newPrice");
            int quantity = r.getInt("quantity");
            int quantitySold = r.getInt("quantitySold");
            Timestamp startDateDiscount = r.getTimestamp("startDateDiscount");
            Timestamp endDateDiscount = r.getTimestamp("endDateDiscount");

            re = new ProductSale(product);
            re.setSale(sale);
            re.setNewPrice(newPrice);
            re.setQuantity(quantity);
            re.setQuantitySold(quantitySold);
            re.setStartDateDiscount(startDateDiscount);
            re.setEndDateDiscount(endDateDiscount);
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }

        return re;
    }
}

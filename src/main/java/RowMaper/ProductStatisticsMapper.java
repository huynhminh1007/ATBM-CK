package RowMaper;

import Model.Product;
import Model.ProductStatistics;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ProductStatisticsMapper implements RowMapper<ProductStatistics> {
    @Override
    public ProductStatistics map(ResultSet r) throws SQLException {

        Product product = new ProductMapper().map(r);

        ProductStatistics productStatistics = new ProductStatistics();

        productStatistics.setProduct(product);
        productStatistics.setTotalSold(r.getInt("totalSold"));
        productStatistics.setTotalRevenue(r.getDouble("totalRevenue"));

        try {
            int requiredQuantity = r.getInt("requiredQuantity");

            productStatistics.setRequiredQuantity(requiredQuantity);

            if (product.getUnitsInStock() <= requiredQuantity
                    && requiredQuantity != 0) {
                productStatistics.setStatus("Cần nhập");
            } else {
                productStatistics.setStatus(product.getStatus().getDescription());
            }
        }
        catch(SQLException e) {
            if(e.getMessage().equalsIgnoreCase("Column 'requiredQuantity' not found.")) {
                productStatistics.setStatus(product.getStatus().getDescription());
                return productStatistics;
            }
            return null;
        }

        return productStatistics;
    }
}

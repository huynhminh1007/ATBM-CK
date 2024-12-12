package RowMaper;

import Model.ProductImport;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

public class ProductImportMapper implements RowMapper<ProductImport> {
    @Override
    public ProductImport map(ResultSet r) throws SQLException {
        ProductImport re;

        try {
            int productId = r.getInt("productId");
            String productName = r.getString("productName");
            double weight = r.getDouble("weight");
            double costPrice = r.getDouble("costPrice");
            int quantity = r.getInt("quantity");
            Timestamp dateCreated = r.getTimestamp("dateCreated");

            re = new ProductImport(productId, productName, weight, costPrice, quantity, dateCreated);
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }

        return re;
    }
}

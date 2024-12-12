package Database;

import Model.ProductSale;
import RowMaper.ProductSaleMapper;
import RowMaper.column.CategoriesColumn;
import RowMaper.column.ProductsColumn;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.MessageFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductSaleDAO extends AbtractDAO<ProductSale> implements IProductSaleDAO, SQLParameterSetter<ProductSale> {

    @Override
    public int save(List<ProductSale> productSales) {
        String sql = """
                INSERT INTO products_sale (productId, sale, newPrice, quantity, startDateDiscount, endDateDiscount)
                SELECT ?, ?, ?, ?, ?, ?
                FROM dual
                WHERE NOT EXISTS (
                    SELECT 1 FROM products_sale\s
                    WHERE productId = ? AND (startDateDiscount = ? AND endDateDiscount = ?)
                )
                """;

        return save(sql, productSales, this);
    }

    @Override
    public void setParameters(PreparedStatement statement, ProductSale productSale) throws SQLException {
        statement.setInt(1, productSale.getId());
        statement.setString(2, productSale.getSale());
        statement.setDouble(3, productSale.getNewPrice());
        statement.setInt(4, productSale.getQuantity());
        statement.setTimestamp(5, productSale.getStartDateDiscount());
        statement.setTimestamp(6, productSale.getEndDateDiscount());
        statement.setInt(7, productSale.getId());
        statement.setTimestamp(8, productSale.getStartDateDiscount());
        statement.setTimestamp(9, productSale.getEndDateDiscount());
    }

    @Override
    public List<ProductSale> find(Map<String, Object> filters, int limit, int offSet, String order, String sort) {
        StringBuilder queryFilter = getQueryFilters(filters);
        StringBuilder queryOrder = getQueryOrder(order, sort);
        StringBuilder sql = getQueryProductSale();

        if (queryFilter != null && !queryFilter.isEmpty()) {
            sql.append(" WHERE")
                    .append(queryFilter);
        }

        sql.append(" ORDER BY");

        if (queryOrder != null && !queryOrder.isEmpty()) {
            sql.append(queryOrder);
        }

        sql.append(" products_sale.productId ASC")
                .append(getQueryFilter("limit", limit, offSet)).append(";");

        return querry(sql.toString(), new ProductSaleMapper());
    }

    @Override
    public int getCount(Map<String, Object> filters) {
        StringBuilder queryFilter = getQueryFilters(filters);
        StringBuilder sql = new StringBuilder("""
                SELECT COUNT(*) FROM products
                INNER JOIN products_sale ON products.productId = products_sale.productId AND products_sale.endDateDiscount >= NOW()
                INNER JOIN status ON status.statusId = products.statusId
                INNER JOIN categories ON products.categoryId = categories.categoryId
                """);

        if (queryFilter != null && !queryFilter.isEmpty()) {
            sql.append(" WHERE")
                    .append(queryFilter);
        }

        return count(sql.toString());
    }

    private StringBuilder getQueryProductSale() {
        return new StringBuilder("""
                SELECT * FROM products
                INNER JOIN products_sale ON products.productId = products_sale.productId AND products_sale.endDateDiscount >= NOW()
                INNER JOIN status ON status.statusId = products.statusId
                INNER JOIN categories ON products.categoryId = categories.categoryId
                """);
    }

    private StringBuilder getQueryFilters(Map<String, Object> filters) {
        StringBuilder sql = new StringBuilder();

        filters.forEach((filter, param) -> {
            StringBuilder subQuery = getQueryFilter(filter, param);
            if (subQuery != null) {
                if (sql.length() > 0) {
                    sql.append(" AND ");
                }
                sql.append(subQuery);
            }
        });
        return sql;
    }

    private StringBuilder getQueryFilter(String filter, Object... params) {
        return switch (filter) {
            case "id" -> new StringBuilder(MessageFormat.format(" (products.productId = {0,number,#})", params));

            case "limit" ->
                    new StringBuilder(MessageFormat.format(" LIMIT {0,number,#} OFFSET {1,number,#}", params[0], params[1]));

            case "startDate" ->
                    new StringBuilder(MessageFormat.format(" (products_sale.startDateDiscount > ''{0}'')", params));

            case "endDate" ->
                    new StringBuilder(MessageFormat.format(" (products_sale.endDateDiscount < ''{0}'')", params));

            case "category" ->
                    new StringBuilder(MessageFormat.format(" (categories.categoryId = {0,number,#} OR categories.parentCategoryId = {0,number,#})", params));

            case "saleType" -> new StringBuilder(MessageFormat.format(" (products_sale.sale LIKE ''%\\{0}'')", params));

            case "search" -> {
                StringBuilder columnsStr = new StringBuilder();
                for (ProductsColumn c : ProductsColumn.values()) {
                    if (c != ProductsColumn.CategoryId
                            && c != ProductsColumn.BlogId
                            && c != ProductsColumn.StatusId
                            && c != ProductsColumn.Thumb) {
                        columnsStr
                                .append("products.")
                                .append(c.name()).append(" LIKE ")
                                .append("'%").append(params[0]).append("%'").append(" OR ");
                    }

                }
                for (CategoriesColumn c : CategoriesColumn.values()) {
                    if (c != CategoriesColumn.CategoryId
                            && c != CategoriesColumn.ParentCategoryId) {
                        columnsStr
                                .append("categories.")
                                .append(c.name()).append(" LIKE ")
                                .append("'%").append(params[0]).append("%'").append(" OR ");
                    }
                }
                columnsStr.delete(columnsStr.length() - " OR ".length(), columnsStr.length());

                yield new StringBuilder(MessageFormat.format(" ({0})", columnsStr.toString()));
            }
            default -> null;
        };
    }

    private StringBuilder getQueryOrder(String order, String sort) {
        if (order == null || order.isEmpty()) return null;

        StringBuilder query = new StringBuilder();

        switch (order) {
            case "name":
                query.append(" products.productName ");
                break;

            case "unitPrice":
                query.append(" products.unitPrice ");
                break;

            case "newPrice":
                query.append(" products_sale.newPrice ");
                break;

            case "quantity":
                query.append(" products_sale.quantity ");
                break;

            case "quantitySold":
                query.append(" products_sale.quantitySold ");
                break;

            case "startDate":
                query.append(" products_sale.startDateDiscount ");
                break;

            case "endDate":
                query.append(" products_sale.endDateDiscount ");
                break;

            case "id":
                query.append(" products.productId ");
                break;

            case "sale":
                query.append(" CAST(REGEXP_REPLACE(products_sale.sale, '[^0-9]', '') AS UNSIGNED) ");
                break;

            default:
                return null;
        }
        if (sort == null
                || (!sort.equalsIgnoreCase("ASC") && !sort.equalsIgnoreCase("DESC"))) return null;

        query.append(sort).append(", ");
        return query;
    }

    public static void main(String[] args) {
        Map<String, Object> filters = new HashMap<>();
        filters.put("saleType", "%");

        String orderBy = "startDate";
        String orderDir = "DESC";

        int limit = 5;
        int offset = 0;

        ProductSaleDAO productSaleDAO = new ProductSaleDAO();

        productSaleDAO.find(filters, limit, offset, orderBy, orderDir).forEach(System.out::println);
        System.out.println(productSaleDAO.getCount(filters));
    }
}

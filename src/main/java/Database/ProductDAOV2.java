package Database;

import Model.Product;
import Model.ProductSale;
import RowMaper.ProductMapper;
import RowMaper.ProductSaleMapper;
import RowMaper.column.CategoriesColumn;
import RowMaper.column.ProductsColumn;
import RowMaper.column.StatusColumn;

import java.text.MessageFormat;
import java.util.List;
import java.util.Map;

public class ProductDAOV2 extends AbtractDAO<Product> implements IProductDAOV2 {

    @Override
    public List<Product> find(Map<String, Object> filters, int limit, int offSet, String order, String sort) {
        StringBuilder queryFilter = getQueryFilters(filters);
        StringBuilder queryOrder = getQueryOrder(order, sort);
        StringBuilder sql = getQueryProduct();

        if (queryFilter != null && !queryFilter.isEmpty()) {
            sql.append(" WHERE")
                    .append(queryFilter);
        }

        sql.append(" ORDER BY");

        if (queryOrder != null && !queryOrder.isEmpty()) {
            sql.append(queryOrder);
        }

        sql.append(" products.productId ASC")
                .append(getQueryFilter("limit", limit, offSet)).append(";");

        return querry(sql.toString(), new ProductMapper());
    }

    @Override
    public int getCount(Map<String, Object> filters) {
        StringBuilder queryFilter = getQueryFilters(filters);
        StringBuilder sql = new StringBuilder("""
                SELECT COUNT(*) FROM products
                INNER JOIN categories ON products.categoryId = categories.categoryId
                INNER JOIN status ON status.statusId = products.statusId
                """);

        if (queryFilter != null && !queryFilter.isEmpty()) {
            sql.append(" WHERE")
                    .append(queryFilter);
        }

        return count(sql.toString());
    }

    private StringBuilder getQueryProduct() {
        return new StringBuilder("""
                SELECT * FROM products
                INNER JOIN categories ON products.categoryId = categories.categoryId
                INNER JOIN status ON status.statusId = products.statusId
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

            case "category" ->
                    new StringBuilder(MessageFormat.format(" (categories.categoryId = {0,number,#} OR categories.parentCategoryId = {0,number,#})", params));

            case "status" -> new StringBuilder(MessageFormat.format(" (status.statusId = {0,number,#})", params));

            case "lastUpdated" ->
                    new StringBuilder(MessageFormat.format(" (DATE(products.lastUpdated) = ''{0}'')", params));

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
                for (StatusColumn c : StatusColumn.values()) {
                    if (c != StatusColumn.StatusId) {
                        columnsStr
                                .append("status.")
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

            case "costPrice":
                query.append(" products.costPrice ");
                break;

            case "weight":
                query.append(" products.weight ");
                break;

            case "unitsInStock":
                query.append(" products.unitsInStock ");
                break;

            case "lastUpdated":
                query.append(" products.lastUpdated ");
                break;

            case "id":
                query.append(" products.productId ");
                break;

            default:
                return null;
        }
        if (sort == null
                || (!sort.equalsIgnoreCase("ASC") && !sort.equalsIgnoreCase("DESC"))) return null;

        query.append(sort).append(", ");
        return query;
    }

}

package Database;

import Model.*;
import RowMaper.*;
import RowMaper.column.CategoriesColumn;
import RowMaper.column.ProductsColumn;
import RowMaper.column.StatusColumn;

import java.text.MessageFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductDAO extends AbtractDAO<Product> implements IProductDAO {

    @Override
    public List<Product> findAll(int limit, int offSet) {
        StringBuilder sql = getQueryProduct()
                .append("ORDER BY products.productId ASC")
                .append(getQueryFilter("limit", limit, offSet));

        return querry(sql.toString(), new ProductMapper());
    }

    @Override
    public List<Product> findAll(int limit, int offSet, String order, String sort) {
        StringBuilder orderQuery = getQueryOrder(order, sort);

        StringBuilder sql = getQueryProduct().append(" ORDER BY");

        if (orderQuery != null) {
            sql.append(orderQuery);
        }

        sql.append(" products.productId ASC")
                .append(getQueryFilter("limit", limit, offSet));

        return querry(sql.toString(), new ProductMapper());
    }

    @Override
    public List<Product> findProductSales(int limit, int offSet, String order, String sort) {
        StringBuilder orderQuery = getQueryOrder(order, sort);

        StringBuilder sql = getQueryProductSale().append(" ORDER BY");

        if (orderQuery != null) {
            sql.append(orderQuery);
        }

        sql.append(" products.productId ASC")
                .append(getQueryFilter("limit", limit, offSet));

        return querry(sql.toString(), new ProductMapper());
    }

    private StringBuilder getQueryOrder(String order, String sort) {
        if (order == null || order.isEmpty()) return null;

        StringBuilder query = new StringBuilder();

        switch (order) {
            case "name":
                query.append(" products.productName ");
                break;

            case "price":
                query.append(" COALESCE(products_sale.newPrice, products.unitPrice) ");
                break;

            default:
                return null;
        }
        if (!sort.equalsIgnoreCase("ASC") && !sort.equalsIgnoreCase("DESC")) return null;

        query.append(sort).append(", ");
        return query;
    }

    @Override
    public Product findProductById(int id) {
        String sql = getQueryProduct().append("WHERE").append(getQueryFilter("id", id)).toString();
        List<Product> list = querry(sql, new ProductMapper());
        return !list.isEmpty() ? list.get(0) : null;
    }

    @Override
    public List<Product> findProductByCategoryId(int id, int limit, int offSet) {
        StringBuilder sql = getQueryProduct()
                .append("WHERE")
                .append(getQueryFilter("category", id))
                .append("ORDER BY products.productId ASC")
                .append(getQueryFilter("limit", limit, offSet));

        return querry(sql.toString(), new ProductMapper());
    }

    @Override
    public ProductDetail findProductDetailById(int id) {
        String sql = getQueryProduct().toString() +
                " INNER JOIN blogs ON products.blogId = blogs.BlogId WHERE products.productId = ?";
        List<ProductDetail> productDetails = querry(sql, new ProductDetailMapper(), id);
        ProductDetail productDetail = productDetails.size() > 0 ? productDetails.get(0) : null;
        if (productDetail != null) {
            String fetchImagesSQL = "SELECT * FROM images WHERE productId = ?";
            String fetchReviewsSQL = "SELECT * FROM reviews INNER JOIN users on users.userId = reviews.userId  WHERE productId = ?";
            List<Image> productImages = querry(fetchImagesSQL, new ImageMapper(), id);
            List<Review> productReviews = querry(fetchReviewsSQL, new ReviewMapper(), id);
            productDetail.setImages(productImages);
            productDetail.setReviews(productReviews);
        }
        return productDetail;
    }

    @Override
    public List<Product> findProductSales(int limit, int offSet) {
        StringBuilder sql = getQueryProductSale()
                .append("ORDER BY products.productId ASC")
                .append(getQueryFilter("limit", limit, offSet));

        return querry(sql.toString(), new ProductMapper());
    }

    @Override
    public List<Product> findProductByFilter(Map<String, Object> filters, int limit, int offSet) {
        StringBuilder queryFilter = getQueryFilters(filters);

        StringBuilder sql = getQueryProduct();

        if (queryFilter != null && !queryFilter.isEmpty()) {
            sql.append("WHERE")
                    .append(queryFilter);
        }

        sql.append(" ORDER BY products.productId ASC")
                .append(getQueryFilter("limit", limit, offSet));

        return querry(sql.toString(), new ProductMapper());
    }

    @Override
    public List<Product> findProductByFilter(Map<String, Object> filters, int limit, int offSet, String order, String sort) {
        StringBuilder queryFilter = getQueryFilters(filters);
        StringBuilder queryOrder = getQueryOrder(order, sort);

        StringBuilder sql = getQueryProduct();

        if (queryFilter != null && !queryFilter.isEmpty()) {
            sql.append("WHERE")
                    .append(queryFilter);
        }
        sql.append(" ORDER BY");

        if (queryOrder != null) {
            sql.append(queryOrder);
        }

        sql.append(" products.productId ASC")
                .append(getQueryFilter("limit", limit, offSet));

        return querry(sql.toString(), new ProductMapper());
    }

    @Override
    public List<Product> findProductSaleByFilter(Map<String, Object> filters, int limit, int offSet) {
        StringBuilder queryFilter = getQueryFilters(filters);

        StringBuilder sql = getQueryProductSale();

        if (queryFilter != null && !queryFilter.isEmpty()) {
            sql.append("WHERE")
                    .append(queryFilter);
        }

        sql.append(" ORDER BY products.productId ASC")
                .append(getQueryFilter("limit", limit, offSet));

        return querry(sql.toString(), new ProductMapper());
    }

    @Override
    public List<Product> findProductSaleByFilter(Map<String, Object> filters, int limit, int offSet, String order, String sort) {
        StringBuilder queryFilter = getQueryFilters(filters);
        StringBuilder queryOrder = getQueryOrder(order, sort);

        StringBuilder sql = getQueryProductSale();

        if (queryFilter != null && !queryFilter.isEmpty()) {
            sql.append("WHERE")
                    .append(queryFilter);
        }
        sql.append(" ORDER BY");

        if (queryOrder != null) {
            sql.append(queryOrder);
        }

        sql.append(" products.productId ASC")
                .append(getQueryFilter("limit", limit, offSet));

        return querry(sql.toString(), new ProductMapper());
    }

    @Override
    public int getCountProductSale() {
        String sql = new StringBuilder("""
                SELECT COUNT(*) FROM products
                INNER JOIN categories ON products.categoryId = categories.categoryId
                INNER JOIN status ON products.statusId = status.statusId
                INNER JOIN products_sale ON products.productId = products_sale.productId AND products_sale.endDateDiscount >= NOW()
                """).toString();
        return count(sql);
    }

    @Override
    public int getCountProductSale(Map<String, Object> filters) {
        if (filters == null || filters.isEmpty()) return getCount();
        StringBuilder queryFilter = getQueryFilters(filters);

        StringBuilder sql = new StringBuilder("""
                SELECT COUNT(*) FROM products
                INNER JOIN categories ON products.categoryId = categories.categoryId
                INNER JOIN status ON products.statusId = status.statusId
                INNER JOIN products_sale ON products.productId = products_sale.productId AND products_sale.endDateDiscount >= NOW()
                """);

        if (queryFilter != null && !queryFilter.isEmpty()) {
            sql.append("WHERE ");
        }

        sql.append(getQueryFilters(filters));
        return count(sql.toString());
    }

    @Override
    public int getCount() {
        String sql = new StringBuilder(
                """
                        SELECT COUNT(*) FROM products
                        INNER JOIN categories ON products.categoryId = categories.categoryId
                        INNER JOIN status ON products.statusId = status.statusId
                        LEFT JOIN products_sale ON products.productId = products_sale.productId AND products_sale.endDateDiscount >= NOW()
                        """)
                .toString();
        return count(sql);
    }

    @Override
    public int getCount(Map<String, Object> filters) {
        if (filters == null || filters.isEmpty()) return getCount();
        StringBuilder queryFilter = getQueryFilters(filters);

        StringBuilder sql = new StringBuilder("""
                SELECT COUNT(*) FROM products
                INNER JOIN categories ON products.categoryId = categories.categoryId
                INNER JOIN status ON products.statusId = status.statusId
                LEFT JOIN products_sale ON products.productId = products_sale.productId AND products_sale.endDateDiscount >= NOW()
                """);

        if (queryFilter != null && !queryFilter.isEmpty()) {
            sql.append("WHERE ");
        }

        sql.append(getQueryFilters(filters));

        return count(sql.toString());
    }

    private StringBuilder getQueryProductSale() {
        return new StringBuilder(
                """
                        SELECT * FROM products
                        INNER JOIN categories ON products.categoryId = categories.categoryId
                        INNER JOIN status ON products.statusId = status.statusId
                        INNER JOIN products_sale ON products.productId = products_sale.productId AND products_sale.endDateDiscount >= NOW()
                        """);
    }

    private StringBuilder getQueryProductSale(int offSet) {
        return new StringBuilder(MessageFormat.format(
                """
                        SELECT * FROM products
                        INNER JOIN categories ON products.categoryId = categories.categoryId
                        INNER JOIN status ON products.statusId = status.statusId
                        INNER JOIN products_sale ON products.productId = products_sale.productId AND products_sale.endDateDiscount >= NOW()
                        WHERE products.productId >= (SELECT productId FROM products ORDER BY productId LIMIT 1 OFFSET {0})
                        """, offSet));
    }

    private StringBuilder getQueryProduct(int offSet) {
        return new StringBuilder(MessageFormat.format(
                """
                        SELECT * FROM products
                        INNER JOIN categories ON products.categoryId = categories.categoryId
                        INNER JOIN status ON products.statusId = status.statusId
                        LEFT JOIN products_sale ON products.productId = products_sale.productId AND products_sale.endDateDiscount >= NOW()
                        WHERE products.productId >= (SELECT productId FROM products ORDER BY productId LIMIT 1 OFFSET {0})
                        """, offSet));
    }

    private StringBuilder getQueryProduct() {
        return new StringBuilder(
                """
                        SELECT * FROM products
                        INNER JOIN categories ON products.categoryId = categories.categoryId
                        INNER JOIN status ON products.statusId = status.statusId
                        LEFT JOIN products_sale ON products.productId = products_sale.productId AND products_sale.endDateDiscount >= NOW()
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
            case "minPrice" ->
                    new StringBuilder(MessageFormat.format(" (COALESCE(products_sale.newPrice, products.unitPrice) > {0,number,#})", params));

            case "maxPrice" ->
                    new StringBuilder(MessageFormat.format(" (COALESCE(products_sale.newPrice, products.unitPrice) < {0,number,#})", params));

            case "category" ->
                    new StringBuilder(MessageFormat.format(" (categories.categoryId = {0,number,#} OR categories.parentCategoryId = {0,number,#})", params));

            case "id" -> new StringBuilder(MessageFormat.format(" (products.productId = {0,number,#})", params));

            case "limit" -> new StringBuilder(MessageFormat.format(" LIMIT {0,number,#} OFFSET {1,number,#}", params[0], params[1]));

            case "name", "search" -> {
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

    @Override
    public int save(Product p) {
        String sql = """
                INSERT INTO products(productName,categoryId,thumb,costPrice,unitPrice,
                blogId,statusId,weight,unitsInStock) VALUES (?,?,?,?,?,?,?,?,?);
                """;
        return save(sql, p.getName(), p.getCategories().getId(), p.getThumb(), p.getCostPrice(), p.getUnitPrice(),
                p.getBlogId(), 8, p.getWeight(), p.getUnitsInStock());
    }

    @Override
    public int save(Blog blog) {
        String sql = "INSERT INTO blogs(content) VALUES(?)";
        return save(sql, blog.getContent());
    }

    @Override
    public boolean update(Product p) {
        String sql = """
                UPDATE products set productName = ?, costPrice = ?, unitPrice = ?, weight = ?,
                unitsInStock =? WHERE productId = ?
                """;
        return update(sql, p.getName(), p.getCostPrice(), p.getUnitPrice(), p.getWeight(), p.getUnitsInStock(), p.getId());
    }

    @Override
    public boolean updateStatus(Product product) {
        String sql = "UPDATE products SET statusId = ? WHERE productId =?";
        return update(sql, product.getStatus().getId(), product.getId());
    }

    public static void main(String[] args) {
        ProductDAO productDAO = new ProductDAO();
        Map<String, Object> filter = new HashMap<String, Object>();
		filter.put("category", 1);
		productDAO.findProductByFilter(filter, 81, 0).forEach(System.out::println);
    }

    @Override
    public int save(Image image) {
        String sql = "INSERT INTO IMAGES(productId,path) VALUES(?,?)";
        return save(sql, image.getProductId(), image.getPath());
    }

    @Override
    public int save(List<Image> images) {
        int re = 0;
        for (Image image : images) {
            save(image);
            re++;
        }
        return re;
    }

    @Override
    public boolean update(Blog blog) {
        String sql = "UPDATE blogs SET content = ? WHERE blogId =?";
        return update(sql, blog.getContent(), blog.getId());
    }

    @Override
    public List<Integer> findId(String id) {
        String sql = MessageFormat
                .format("SELECT productId AS num FROM products WHERE productId LIKE ''{0}%'' ORDER BY num ASC",
                        id);

        return querry(sql, new IntegerMapper());
    }
}

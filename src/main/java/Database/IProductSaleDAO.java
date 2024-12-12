package Database;

import Model.ProductSale;

import java.util.List;
import java.util.Map;

public interface IProductSaleDAO extends GenericDAO<ProductSale> {
    List<ProductSale> find(Map<String, Object> filters, int limit, int offSet, String order, String sort);
    int getCount(Map<String, Object> filters);
    int save(List<ProductSale> productSales);
}

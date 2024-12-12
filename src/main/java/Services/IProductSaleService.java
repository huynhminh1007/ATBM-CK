package Services;

import Model.ProductSale;

import java.util.List;
import java.util.Map;

public interface IProductSaleService extends IGenericService<ProductSale> {
    List<ProductSale> find(Map<String, Object> filters, int limit, int offSet, String order, String sort);
    int getCount(Map<String, Object> filters);
    int save(List<ProductSale> productSales);
}

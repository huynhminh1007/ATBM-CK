package Database;

import Model.Product;

import java.util.List;
import java.util.Map;

public interface IProductDAOV2 extends GenericDAO<Product> {
    List<Product> find(Map<String, Object> filters, int limit, int offSet, String order, String sort);
    int getCount(Map<String, Object> filters);
}

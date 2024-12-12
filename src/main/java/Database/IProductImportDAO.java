package Database;

import Model.ProductImport;

import java.util.List;
import java.util.Map;

public interface IProductImportDAO extends GenericDAO<ProductImport> {
    int save(List<ProductImport> productImports);
    List<ProductImport> find(Map<String, Object> filters, int limit, int offSet, String order, String sort, int duration, String durationType);
    int getCount(Map<String, Object> filters, int duration, String durationType);
}
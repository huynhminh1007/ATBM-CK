package Services;

import Database.IProductImportDAO;
import Model.ProductImport;

import javax.inject.Inject;
import java.util.List;
import java.util.Map;

public class ProductImportService implements IProductImportService {

    @Inject
    IProductImportDAO productImportDAO;

    @Override
    public int save(List<ProductImport> productImports) {
        return productImportDAO.save(productImports);
    }

    @Override
    public List<ProductImport> findAll() {
        return List.of();
    }

    @Override
    public List<ProductImport> findAll(int limit, int offSet) {
        return List.of();
    }

    @Override
    public int save(ProductImport productImport) {
        return 0;
    }

    @Override
    public boolean update(ProductImport productImport) {
        return false;
    }

    @Override
    public List<ProductImport> find(Map<String, Object> filters, int limit, int offSet, String order, String sort, int duration, String durationType) {
        return productImportDAO.find(filters, limit, offSet, order, sort, duration, durationType);
    }

    @Override
    public int getCount(Map<String, Object> filters, int duration, String durationType) {
        return productImportDAO.getCount(filters, duration, durationType);
    }
}
package Services;

import Database.ProductSaleDAO;
import Model.ProductSale;

import javax.inject.Inject;
import java.util.List;
import java.util.Map;

public class ProductSaleService implements IProductSaleService {

    @Inject
    private ProductSaleDAO productSaleDAO;

    @Override
    public List<ProductSale> find(Map<String, Object> filters, int limit, int offSet, String order, String sort) {
        return productSaleDAO.find(filters, limit, offSet, order, sort);
    }

    @Override
    public int getCount(Map<String, Object> filters) {
        return productSaleDAO.getCount(filters);
    }

    @Override
    public int save(List<ProductSale> productSales) {
        return productSaleDAO.save(productSales);
    }

    @Override
    public List<ProductSale> findAll() {
        return List.of();
    }

    @Override
    public List<ProductSale> findAll(int limit, int offSet) {
        return List.of();
    }

    @Override
    public int save(ProductSale productSale) {
        return 0;
    }

    @Override
    public boolean update(ProductSale productSale) {
        return false;
    }
}

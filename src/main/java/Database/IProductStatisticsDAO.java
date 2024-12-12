package Database;

import Model.ProductStatistics;

import java.util.List;
import java.util.Map;

public interface IProductStatisticsDAO {

    List<ProductStatistics> findProductStatisticsByFilter(Map<String, Object> filters, int limit, int offSet, String order, String sort, int duration, String durationType);
    int getCount(Map<String, Object> filters, int duration, String durationType);
    List<ProductStatistics> findProductStatisticsByFilterByDate(Map<String, Object> filters, int month, String year);
    int getCountProductRequiredImport(Map<String, Object> filters, int duration, String durationType);
}

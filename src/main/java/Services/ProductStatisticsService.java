package Services;

import Database.IProductStatisticsDAO;
import Model.ProductStatistics;

import javax.inject.Inject;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductStatisticsService implements IProductStatisticsService {

    @Inject
    IProductStatisticsDAO productStatisticsDAO;

    @Override
    public List<ProductStatistics> findProductStatisticsByFilter(Map<String, Object> filters, int limit, int offSet, String order, String sort, int duration, String durationType) {
        return productStatisticsDAO.findProductStatisticsByFilter(filters, limit, offSet, order, sort, duration, durationType);
    }

    @Override
    public List<ProductStatistics> findAll() {
        return List.of();
    }

    @Override
    public List<ProductStatistics> findAll(int limit, int offSet) {
        return List.of();
    }

    @Override
    public int save(ProductStatistics productStatistics) {
        return 0;
    }

    @Override
    public boolean update(ProductStatistics productStatistics) {
        return false;
    }

    @Override
    public int getCount(Map<String, Object> filters, int duration, String durationType) {
        return productStatisticsDAO.getCount(filters, duration, durationType);
    }

    @Override
    public int getCountProductRequiredImport(Map<String, Object> filters, int duration, String durationType) {
        return productStatisticsDAO.getCountProductRequiredImport(filters, duration, durationType);
    }

    @Override
    public List<ProductStatistics> findProductStatisticsByFilterByDate(Map<String, Object> filters, int month, String year) {
        return productStatisticsDAO.findProductStatisticsByFilterByDate(filters, month, year);
    }


    @Override
    public Map<Integer, Double> getStatisTicMap() {
        Map<Integer, Double> statisTicMap = new HashMap<>();
        List<Integer> lastSixMonths = getLastSixMonths();
        Map<String, Object> filters = new HashMap<>();
        for (Integer month : lastSixMonths) {
            statisTicMap.put(month, getTotalRevenue(month));
        }
        return statisTicMap;
    }

    private Double getTotalRevenue(Integer month) {
        Map<String, Object> filters = new HashMap<>();
        int year = LocalDate.now().getYear();
        double totalRevenue;

        totalRevenue = findProductStatisticsByFilterByDate(filters, month, String.valueOf(year))
                .stream()
                .map(ProductStatistics::getTotalRevenue)
                .reduce(0.0, Double::sum);
        return totalRevenue;
    }

    private List<Integer> getLastSixMonths() {
        int currentMonth = LocalDate.now().getMonthValue();
        List<Integer> lastSixMonths = new ArrayList<>();
        for (int i = 0; i < 6; i++) {
            int month = (currentMonth - i - 1) % 12 + 1;
            lastSixMonths.add(0,month);
        }
        return lastSixMonths;
    }
}

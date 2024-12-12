package Database;

import Model.Categories;
import Model.Discounts;
import Model.Log;

import java.util.List;

public interface ILogDAO {
    List<Log> findAll();
    Log findById(int id);
    int save(Log log);

    boolean update(Log log);

    boolean delete(int logId);

}

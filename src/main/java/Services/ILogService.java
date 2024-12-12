package Services;

import Database.ILogDAO;
import Model.Log;

import javax.inject.Inject;
import java.util.List;
import java.util.function.Predicate;

public interface ILogService {
    List<Log> findAllLogs();

    void saveLog(Log log);

    Log findLogById(int id);

    boolean deleteLogById(int id);

    List<Log> filterLogs(List<Integer> levels);
}

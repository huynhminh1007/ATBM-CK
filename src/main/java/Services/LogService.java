package Services;

import Database.ILogDAO;
import Model.Log;
import Model.LogLevel;

import javax.inject.Inject;
import java.util.Comparator;
import java.util.List;

public class LogService implements ILogService {
    ILogDAO logDAO;

    public LogService(ILogDAO logDAO) {
        this.logDAO = logDAO;
    }

    @Override
    public List<Log> findAllLogs() {
        return logDAO.findAll();
    }

    @Override
    public void saveLog(Log log) {
        logDAO.save(log);
    }

    @Override
    public Log findLogById(int id) {
        return logDAO.findById(id);
    }

    @Override
    public boolean deleteLogById(int id) {
        return logDAO.delete(id);
    }

    @Override
    public List<Log> filterLogs(List<Integer> levels) {
        List<LogLevel> logLevels = levels.stream().map(MLogFactory::getLogLevel).toList();
        return findAllLogs().stream()
                .filter(l -> logLevels.contains(l.getLevel()))
                .toList();
    }

}

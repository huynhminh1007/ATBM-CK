package Database;
import Model.Log;
import RowMaper.LogMapper;

import java.util.List;

public class LogDAO extends AbtractDAO<Log> implements ILogDAO {
    @Override
    public List<Log> findAll() {
        String sql = "SELECT * FROM logs ORDER BY dateCreated DESC";
        return querry(sql, new LogMapper());
    }

    @Override
    public Log findById(int id) {
        String sql = "SELECT * FROM logs WHERE logId = ?";
        List<Log> re = querry(sql, new LogMapper(), id);
        if (!re.isEmpty()) {
            return re.get(0);
        }
        return null;
    }

    @Override
    public int save(Log log) {
        String sql = """
                INSERT INTO logs(ipAddress,url,nation,currentValue,afterValue,description,level)
                 VALUES(?,?,?,?,?,?,?)
                """;
        return query(sql, log.getIpAddress(), log.getUrl(), log.getNation(), log.getCurrentValue(), log.getAfterValue(), log.getDescription(), log.getLevel().toString());
    }

    @Override
    public boolean update(Log log) {
        return false;
    }

    @Override
    public boolean delete(int logId) {
        String sql = "DELETE FROM logs WHERE logId = ?";
        return update(sql, logId);
    }

}

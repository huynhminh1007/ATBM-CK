package RowMaper;

import Model.Log;
import Model.LogLevel;
import RowMaper.column.LogsColumn;

import java.sql.ResultSet;
import java.sql.SQLException;

public class LogMapper implements RowMapper<Log> {
    @Override
    public Log map(ResultSet r) throws SQLException {
        Log log = new Log();
        log.setId(r.getInt(LogsColumn.LogId.name()));
        log.setDescription(r.getString(LogsColumn.Description.name()));
        log.setNation(r.getString(LogsColumn.Nation.name()));
        log.setLevel(LogLevel.valueOf(r.getString(LogsColumn.Level.name())));
        log.setIpAddress(r.getString(LogsColumn.IpAddress.name()));
        log.setCurrentValue(r.getString(LogsColumn.CurrentValue.name()));
        log.setAfterValue(r.getString(LogsColumn.AfterValue.name()));
        log.setUrl(r.getString(LogsColumn.Url.name()));
        log.setDateCreated(r.getTimestamp(LogsColumn.DateCreated.name()));
        return log;
    }
}

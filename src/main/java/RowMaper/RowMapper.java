package RowMaper;

import java.sql.ResultSet;
import java.sql.SQLException;

public interface RowMapper<T> {
	public T map(ResultSet r) throws SQLException;
}

package Database;

import java.util.List;

import RowMaper.RowMapper;

public interface GenericDAO<T> {
	<T> List<T> querry(String sql, RowMapper<T> rowMapper, Object... objects);

	int save(String sql, Object... objects);

	boolean update(String sql, Object... objects);
	
	int count(String sql, Object... objects);
	
	int query(String sql, Object... objects);

	<T> List<T> querryWithView(String sqlView, String sqlDrop, String sql, RowMapper<T> rowMapper, Object... objects);
	int countWithView(String sqlView, String sqlDrop, String sql, Object... objects);
}

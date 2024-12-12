package RowMaper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class IntegerMapper implements RowMapper<Integer> {
    @Override
    public Integer map(ResultSet r) throws SQLException {
        Integer res;
        try {
            res = r.getInt("num");
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
        return res;
    }
}

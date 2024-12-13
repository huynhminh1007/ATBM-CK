package RowMaper.security;

import Model.security.Key;
import RowMaper.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class KeyMapper implements RowMapper<Key> {
    @Override
    public Key map(ResultSet r) throws SQLException {
        Key key = new Key();

        try {
            key.setId(r.getInt("keyId"));
            key.setUserId(r.getInt("userId"));
            key.setKey(r.getString("key"));
            key.setAlgorithm(r.getString("algorithm"));
            key.setBeginDate(r.getTimestamp("begin_date"));
            key.setUpdateDate(r.getTimestamp("update_date"));
            key.setActive(r.getBoolean("is_active"));
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return key;
    }
}

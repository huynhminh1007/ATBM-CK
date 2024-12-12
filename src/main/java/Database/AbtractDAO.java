package Database;

import RowMaper.RowMapper;
import Utils.JDBCConnector;

import java.sql.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class AbtractDAO<T> implements GenericDAO<T> {

    @Override
    public <T> List<T> querry(String sql, RowMapper<T> rowMapper, Object... objects) {
        List<T> re = new ArrayList<>();
        try {
            Connection conn = JDBCConnector.getConnection();

            PreparedStatement statement = conn.prepareStatement(sql);
            setParameters(statement, objects);

            ResultSet r = statement.executeQuery();
            while (r.next()) {
                re.add(rowMapper.map(r));
            }
            return re;
        } catch (SQLException | IllegalArgumentException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return null;
        } finally {
            JDBCConnector.closeConnect();
        }
    }

    @Override
    public <T> List<T> querryWithView(String sqlView, String sqlDrop, String sql, RowMapper<T> rowMapper, Object... objects) {
        List<T> re = new ArrayList<>();
        try {
            Connection conn = JDBCConnector.getConnection();

            PreparedStatement statementDrop = conn.prepareStatement(sqlDrop);
            statementDrop.executeUpdate();

            PreparedStatement statementView = conn.prepareStatement(sqlView);
            statementView.executeUpdate();

            PreparedStatement statement = conn.prepareStatement(sql);
            setParameters(statement, objects);

            ResultSet r = statement.executeQuery();
            while (r.next()) {
                re.add(rowMapper.map(r));
            }

            statementDrop.executeUpdate();
            return re;
        } catch (SQLException | IllegalArgumentException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return null;
        } finally {
            JDBCConnector.closeConnect();
        }
    }

    private void setParameters(PreparedStatement statement, Object[] objects) {
        int index = 1;
        for (Object object : objects) {
            try {
                if (object instanceof Integer) {
                    statement.setInt(index, (int) object);
                } else if (object instanceof Long) { // Sửa ở đây, thêm dấu đóng ngoặc ")"
                    statement.setLong(index, (long) object);
                } else if (object instanceof Double) { // Sửa ở đây, thêm dấu đóng ngoặc ")"
                    statement.setDouble(index, (Double) object);
                } else if (object instanceof String) {
                    statement.setString(index, (String) object);
                } else if (object instanceof Date) {
                    statement.setDate(index, (Date) object);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            index++;
        }
    }

    @Override
    public int save(String sql, Object... objects) {
        int re = 0;
        Connection conn = JDBCConnector.getConnection();
        try {
            PreparedStatement statement = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            setParameters(statement, objects);
            conn.setAutoCommit(false);
            statement.executeUpdate();
            ResultSet r = statement.getGeneratedKeys();
            while (r.next()) {
                re = r.getInt(1);
            }
            conn.commit();
        } catch (SQLException e) {
            e.printStackTrace();
            try {
                conn.rollback();
            } catch (SQLException e1) {
                // TODO Auto-generated catch block
                e1.printStackTrace();
            }
        }

        return re;

    }

    @Override
    public boolean update(String sql, Object... objects) {
        Connection conn = JDBCConnector.getConnection();
        try {
            conn.setAutoCommit(false);
            PreparedStatement statement = conn.prepareStatement(sql);
            setParameters(statement, objects);
            statement.executeUpdate();
            conn.commit();
            return true;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            try {
                conn.rollback();
            } catch (SQLException e1) {
                // TODO Auto-generated catch block
                e1.printStackTrace();
            }
            return false;
        } finally {
            JDBCConnector.closeConnect();
        }
    }

    @Override
    public int count(String sql, Object... objects) {
        try {
            Connection conn = JDBCConnector.getConnection();

            PreparedStatement statement = conn.prepareStatement(sql);
            setParameters(statement, objects);

            ResultSet r = statement.executeQuery();
            return r.next() ? r.getInt(1) : 0;
        } catch (SQLException | IllegalArgumentException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return 0;
        } finally {
            JDBCConnector.closeConnect();
        }
    }

    @Override
    public int countWithView(String sqlView, String sqlDrop, String sql, Object... objects) {
        try {
            Connection conn = JDBCConnector.getConnection();

            PreparedStatement statementDrop = conn.prepareStatement(sqlDrop);
            statementDrop.executeUpdate();

            PreparedStatement statementView = conn.prepareStatement(sqlView);
            statementView.executeUpdate();

            PreparedStatement statement = conn.prepareStatement(sql);
            setParameters(statement, objects);

            ResultSet r = statement.executeQuery();

            statementDrop.executeUpdate();

            return r.next() ? r.getInt(1) : 0;
        } catch (SQLException | IllegalArgumentException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return 0;
        } finally {
            JDBCConnector.closeConnect();
        }
    }

    @Override
    public int query(String sql, Object... objects) {
        try {
            PreparedStatement stat = JDBCConnector.getConnection().prepareStatement(sql);
            setParameters(stat, objects);

            return stat.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return 0;
        }
        finally {
            JDBCConnector.closeConnect();
        }
    }

    public <T> int save(String sql, List<T> objects, SQLParameterSetter<T> parameterSetter) {
        try {
            Connection conn = JDBCConnector.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            conn.setAutoCommit(false);

            for (T object : objects) {
                parameterSetter.setParameters(statement, object);
                statement.addBatch();
            }

            int[] result = statement.executeBatch();
            int totalRowsAffected = Arrays.stream(result).sum();
            conn.commit();

            return totalRowsAffected;
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        } finally {
            JDBCConnector.closeConnect();
        }
    }
}

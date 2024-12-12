package Database;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public interface SQLParameterSetter<T> {
    void setParameters(PreparedStatement statement, T object) throws SQLException;
}

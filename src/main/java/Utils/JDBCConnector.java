package Utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import Database.UserDAO;
import Model.Status;
import Model.User;

public class JDBCConnector {

	private static Connection conn;

	public static Connection getConnection() {
		if(conn == null) connect();
		return conn;
	}
	
	private static void connect() {
		String host = "localhost";
		String port = "3306";
		String dbName = "luong_thuc_viet";
		String username = "root";
		String password = "";
		String url = "jdbc:mysql://" + host + ":" + port + "/" + dbName+"?useUnicode=true&characterEncoding=utf8";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url, username, password);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static void closeConnect() {
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			finally {
				conn = null;
			}
		}
	}
	
	public static void main(String[] args) {
		JDBCConnector.getConnection();
	}
}

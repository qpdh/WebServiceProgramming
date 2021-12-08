package module;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	public static Connection getConnection() throws SQLException, ClassNotFoundException {
		Connection conn = null;

		String url = "jdbc:mysql://embeded.clez5ac4cxmt.us-east-2.rds.amazonaws.com:3306/travel_community";
		String user = "root";
		String password = "rlaehdgus";

		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, user, password);

		return conn;
	}
}

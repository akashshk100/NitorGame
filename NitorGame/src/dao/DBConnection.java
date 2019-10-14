package dao;

import java.sql.*;

public class DBConnection {
	public static Connection getConnection() {
		Connection con=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost/ex", "root","akash");
		}catch(Exception e) {
			System.out.println(e);
		}
		return con;
	}
}

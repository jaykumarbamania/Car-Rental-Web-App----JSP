package app.controller;

import java.sql.*;

public class JDBC {
	public static Connection getCon() {
		Connection con = null;
		try {
//			Class.forName("oracle.jdbc.driver.OracleDriver");
//			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "system");

			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3307/jspCarRental", "root", "J@ykumar99");
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return con;
	}
}

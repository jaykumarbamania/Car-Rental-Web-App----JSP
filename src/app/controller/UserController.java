package app.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import app.model.User;

public class UserController {


	public static List<User> getAllNormalUsers() throws SQLException {
		Connection con = JDBC.getCon();

		List<User> users = new ArrayList<User>();
		PreparedStatement pst = null;
		try {
			String query = "SELECT * FROM jspCarRental.normal_user";
			pst = con.prepareStatement(query);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				User user = new User();
				user.setUser_id(rs.getInt(1));
				user.setUsername(rs.getString(2));
				user.setUser_email(rs.getString(3));
				user.setUser_mobile(rs.getString(4));
				user.setUser_password(rs.getString(5));
				user.setInitial_deposit(rs.getDouble(6));
				user.setBalance(rs.getDouble(7));
				users.add(user);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pst.close();
			con.close();
		}
		return users;
	}
	
	public static List<User> getAllRenterUsers() throws SQLException {
		Connection con = JDBC.getCon();

		List<User> users = new ArrayList<User>();
		PreparedStatement pst = null;
		try {
			String query = "SELECT * FROM jspCarRental.renter";
			pst = con.prepareStatement(query);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				User user = new User();
				user.setUser_id(rs.getInt(1));
				user.setUsername(rs.getString(2));
				user.setUser_email(rs.getString(3));
				user.setUser_mobile(rs.getString(4));
				user.setUser_password(rs.getString(5));
				users.add(user);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pst.close();
			con.close();
		}
		return users;
	}

	// method to register user in database
	public static int SaveNormalUser(User u) throws Exception {

		Connection con = JDBC.getCon();
		PreparedStatement pst = null;
		String insertQuery = "INSERT INTO jspCarRental.normal_user(user_id,username,user_email,"
				+ "user_mobile,user_password,initial_deposit,balance) VALUES(null,?,?,?,?,?,?)";
		pst = con.prepareStatement(insertQuery);
		pst.setString(1, u.getUsername());
		pst.setString(2, u.getUser_email());
		pst.setString(3, u.getUser_mobile());
		pst.setString(4, u.getUser_password());
		pst.setDouble(5, u.getInitial_deposit());
		pst.setDouble(6, u.getInitial_deposit());
		int result = pst.executeUpdate();
		System.out.println("Insert " + result);
		pst.close();
		return result;
	}
	
	public static int SaveRenter(User u) throws Exception {

		Connection con = JDBC.getCon();
		PreparedStatement pst = null;
		String insertQuery = "INSERT INTO jspCarRental.renter(user_id,username,user_email,"
				+ "user_mobile,user_password) VALUES(null,?,?,?,?)";
		pst = con.prepareStatement(insertQuery);
		pst.setString(1, u.getUsername());
		pst.setString(2, u.getUser_email());
		pst.setString(3, u.getUser_mobile());
		pst.setString(4, u.getUser_password());
		int result = pst.executeUpdate();
		System.out.println("Insert " + result);
		pst.close();
		return result;
	}

	public static int updateNormalUser(User u) {
		int status = 0;
		Connection con = JDBC.getCon();
		String query = "UPDATE  jspCarRental.normal_user SET username=?,user_email=?,user_mobile = ?,user_password = ?,balance = ? where user_id=?";
		try {

			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, u.getUsername());
			pst.setString(2, u.getUser_email());
			pst.setString(3, u.getUser_mobile());
			pst.setString(4, u.getUser_password());
			pst.setDouble(5, u.getBalance());
			pst.setDouble(6, u.getUser_id());
			status = pst.executeUpdate();
			con.close();
		} catch (Exception ex1) {
			ex1.printStackTrace();
		}

		return status;
	}
	
	public static int updateRenter(User u) {
		int status = 0;
		Connection con = JDBC.getCon();
		String query = "UPDATE  jspCarRental.renter SET username=?,user_email=?,user_mobile = ?,user_password = ? where user_id=?";
		try {
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, u.getUsername());
			pst.setString(2, u.getUser_email());
			pst.setString(3, u.getUser_mobile());
			pst.setString(4, u.getUser_password());
			pst.setDouble(5, u.getUser_id());
			status = pst.executeUpdate();
			con.close();
		} catch (Exception ex1) {
			ex1.printStackTrace();
		}

		return status;
	}
	
	public static int updateBalance(String email,double currbal, double amount) {
		int status = 0;
		Connection con = JDBC.getCon();
		String query = "UPDATE  jspCarRental.normal_user SET balance=? WHERE user_email = ?";
		try {

			PreparedStatement pst = con.prepareStatement(query);
			pst.setDouble(1, currbal+amount);
			pst.setString(2, email);
			status = pst.executeUpdate();
			con.close();
		} catch (Exception ex1) {
			ex1.printStackTrace();
		}

		return status;
	}
	//
//	public static int delete(int userId) {
//		int status = 0;
//		PreparedStatement pst = null;
//		try {
//			Connection con = DB.getCon();
//
//			String deleteQuery = "DELETE FROM USERS WHERE user_id = ?";
//			pst = con.prepareStatement(deleteQuery);
//			pst.setInt(1, userId);
//			status = pst.executeUpdate();
//			pst.close();
//			deleteQuery = "DELETE FROM RENTCAR WHERE user_id = ?";
//			pst = con.prepareStatement(deleteQuery);
//			pst.setInt(1, userId);
//			status = pst.executeUpdate();
//			String selectQuery = "SELECT * FROM RENTCAR WHERE user_id = ?";
//			pst = con.prepareStatement(selectQuery);
//			pst.setInt(1, userId);
//			ResultSet rs = pst.executeQuery();
//			while (rs.next()) {
//				pst = con.prepareStatement("UPDATE CARS SET AVAILABILITY = ? WHERE CAR_NO = ?");
//				int avail = CarController.carAvailability(rs.getString(2)).getCarAvailable() + 1;
//				pst.setInt(1, avail);
//				pst.setString(2, rs.getString(2));
//				status = pst.executeUpdate();
//			}
//			pst.close();
//			con.close();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return status;
//	}

	// method to check user for login purpose
	public static boolean validateNormalUser(User u) {
		
		Connection con = JDBC.getCon();
		boolean status= false;
		String query = "SELECT * FROM jspCarRental.normal_user WHERE user_email = ? AND user_password = ?";
		try {
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, u.getUser_email());
			pst.setString(2, u.getUser_password());
			ResultSet rs = pst.executeQuery();
			status= rs.next();
			rs.close();
			pst.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return status;

	}
	
	public static boolean validateRenter(User u) {
		
		Connection con = JDBC.getCon();
		boolean status= false;
		String query = "SELECT * FROM jspCarRental.renter WHERE user_email = ? AND user_password = ?";
		try {
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, u.getUser_email());
			pst.setString(2, u.getUser_password());
			ResultSet rs = pst.executeQuery();
			status= rs.next();
			rs.close();
			pst.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return status;

	}
	
	public static int deleteRenter(int userId) {
	int status = 0;
	PreparedStatement pst = null;
	try {
		Connection con = JDBC.getCon();

		String deleteQuery = "DELETE FROM jspCarRental.renter WHERE user_id = ?";
		pst = con.prepareStatement(deleteQuery);
		pst.setInt(1, userId);
		status = pst.executeUpdate();
		pst.close();
		con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	return status;
}

	public static int deleteNormalUser(int userId) {
	int status = 0;
	PreparedStatement pst = null;
	try {
		Connection con = JDBC.getCon();

		String deleteQuery = "DELETE FROM jspCarRental.normal_user WHERE user_id = ?";
		pst = con.prepareStatement(deleteQuery);
		pst.setInt(1, userId);
		status = pst.executeUpdate();
		pst.close();
		String selectQuery = "SELECT * FROM RENTCAR WHERE user_id = ?";
		pst = con.prepareStatement(selectQuery);
		pst.setInt(1, userId);
		ResultSet rs = pst.executeQuery();
//		deleteQuery = "DELETE FROM jspCarRental.RENTCAR WHERE user_id = ?";
//		pst = con.prepareStatement(deleteQuery);
//		pst.setInt(1, userId);
//		status = pst.executeUpdate();
		while (rs.next()) {
			pst = con.prepareStatement("UPDATE CARS SET AVAILABILITY = ? WHERE CAR_ID = ?");
			pst.setString(1, "yes");
			pst.setInt(2, rs.getInt(4));
			status = pst.executeUpdate();
		}
		pst.close();
		con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	return status;
}
//
	public static User getNormalUser(int id) {
		Connection con = JDBC.getCon();
		User u = null;
		String query = "SELECT * FROM  jspCarRental.normal_user WHERE user_id = ?";
		try {
			PreparedStatement pst = con.prepareStatement(query);
			pst = con.prepareStatement(query);
			pst.setInt(1, id);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				u = new User();
				u.setUser_id(rs.getInt(1));
				u.setUsername(rs.getString(2));
				u.setUser_email(rs.getString(3));
				u.setUser_mobile(rs.getString(4));
				u.setUser_password(rs.getString(5));
				u.setInitial_deposit(rs.getDouble(6));
				u.setBalance(rs.getDouble(7));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return u;
	}
	public static User getRenter(int id) {
		Connection con = JDBC.getCon();
		User u = null;
		String query = "SELECT * FROM  jspCarRental.renter WHERE user_id = ?";
		try {
			PreparedStatement pst = con.prepareStatement(query);
			pst = con.prepareStatement(query);
			pst.setInt(1, id);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				u = new User();
				u.setUser_id(rs.getInt(1));
				u.setUsername(rs.getString(2));
				u.setUser_email(rs.getString(3));
				u.setUser_mobile(rs.getString(4));
				u.setUser_password(rs.getString(5));
				u.setInitial_deposit(rs.getDouble(6));
				u.setBalance(rs.getDouble(7));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return u;
	}
	
	public static User getNormalUser(String email) {
		Connection con = JDBC.getCon();
		User u = null;
		String query = "SELECT * FROM  jspCarRental.normal_user WHERE user_email = ?";
		try {
			PreparedStatement pst = con.prepareStatement(query);
			pst = con.prepareStatement(query);
			pst.setString(1, email);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				u = new User();
				u.setUser_id(rs.getInt(1));
				u.setUsername(rs.getString(2));
				u.setUser_email(rs.getString(3));
				u.setUser_mobile(rs.getString(4));
				u.setUser_password(rs.getString(5));
				u.setInitial_deposit(rs.getDouble(6));
				u.setBalance(rs.getDouble(7));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return u;
	}
	
	public static User getRenter(String email) {
		Connection con = JDBC.getCon();
		User u = null;
		String query = "SELECT * FROM  jspCarRental.renter WHERE user_email = ?";
		try {
			PreparedStatement pst = con.prepareStatement(query);
			pst = con.prepareStatement(query);
			pst.setString(1, email);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				u = new User();
				u.setUser_id(rs.getInt(1));
				u.setUsername(rs.getString(2));
				u.setUser_email(rs.getString(3));
				u.setUser_mobile(rs.getString(4));
				u.setUser_password(rs.getString(5));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return u;
	}
//
//	public static List<User> getSpecificTypeofUsers(String userType) throws SQLException {
//		Connection con = DB.getCon();
//
//		List<User> users = new ArrayList<User>();
//		PreparedStatement pst = null;
//		try {
//			String query = "SELECT * FROM CARRENTALDB.USERS WHERE user_type = ?";
//			pst = con.prepareStatement(query);
//			pst.setString(1, userType);
//			ResultSet rs = pst.executeQuery();
//			while (rs.next()) {
//				users.add(new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
//						rs.getString(6), rs.getString(7), rs.getTimestamp(8)));
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			pst.close();
//			con.close();
//		}
//		return users;
//	}

}

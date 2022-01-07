package app.controller;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Part;

import app.model.Cars;
import app.model.RentCar;
import app.model.User;
public class CarController {
	public static int save(Cars c, Part imgPart) throws Exception {
		int result=0;
		if(imgPart != null) {
			Connection con = JDBC.getCon();
			PreparedStatement pst = null;
			
			InputStream is = imgPart.getInputStream(); 
			String insertQuery = "INSERT INTO jspCarRental.CARS(car_id,car_no,car_photo,car_name,car_maker,"
					+ "car_model,availability,rent_price) VALUES(null,?,?,?,?,?,?,?)";
			pst = con.prepareStatement(insertQuery);
			pst.setString(1, c.getCar_no());
			pst.setBlob(2, is);
			pst.setString(3, c.getCar_name());
			pst.setString(4, c.getCar_maker());
			pst.setString(5, c.getCar_model());
			pst.setString(6, "yes");
			pst.setDouble(7, c.getRent_price());
			result = pst.executeUpdate();
			System.out.println("Insert " + result);
			pst.close();
		}
		
		return result;
	}
	
	public static int updateCar(Cars c, Part imgPart) throws Exception  {
		int status = 0;
		if(imgPart != null) {
		Connection con = JDBC.getCon();
		String query = "UPDATE  jspCarRental.CARS SET car_no=?, car_photo = ?, car_name=?,car_maker=?,car_model = ?,availability = ?, rent_price=? where car_id=?";
			InputStream is = imgPart.getInputStream(); 
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, c.getCar_no());
			pst.setBlob(2, is);
			pst.setString(3, c.getCar_name());
			pst.setString(4, c.getCar_maker());
			pst.setString(5, c.getCar_model());
			pst.setString(6, c.getCarAvailable());
			pst.setDouble(7, c.getRent_price());
			pst.setInt(8, c.getCar_id());
			status = pst.executeUpdate();
			con.close();

	}
		return status;
	}

	public static List<Cars> getAllCars() {
		Connection con = JDBC.getCon();

		List<Cars> cars = new ArrayList<Cars>();
		PreparedStatement pst = null;
		try {
			String query = "SELECT * FROM jspCarRental.CARS";
			pst = con.prepareStatement(query);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				Cars car = new Cars();
				car.setCar_id(rs.getInt(1));
				car.setCar_no(rs.getString(2));
				car.setCar_name(rs.getString(4));
				car.setCar_maker(rs.getString(5));
				car.setCar_model(rs.getString(6));
				car.setCarAvailable(rs.getString(7));
				car.setRent_price(rs.getDouble(8));
				car.setCreatedAt(rs.getTimestamp(9));
				cars.add(car);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {	
			try {
				pst.close();
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return cars;
	}
	public static int updateCarAvailability(int id)  {
		int result = 0;
		Connection con = JDBC.getCon();
		PreparedStatement pst = null;
//		if (u != null && car != null) {
//			String insertQuery = "INSERT INTO CARRENTALDB.RENTCAR(rent_id,car_no,user_id,username,"
//					+ "user_mobile,return_status) VALUES(null,?,?,?,?,?)";
//			pst = con.prepareStatement(insertQuery);
//			pst.setString(1, c.getCarNo());
//			pst.setInt(2, c.getUserid());
//			pst.setString(3, c.getUsername());
//			pst.setLong(4, c.getUser_mobile());
//			pst.setString(5, "no");
//			result = pst.executeUpdate();
////		else {
////				result =  2;
////			}
//		}

//		if (result == 1) {
			String selectQuery = "SELECT * FROM users";
			String updateQuery = "UPDATE jspCarRental.CARS SET AVAILABILITY = ? WHERE car_id = ?";
			try {
				pst = con.prepareStatement(updateQuery);
				pst.setString(1, "no");
				pst.setInt(2, id);
				result = pst.executeUpdate();
				pst.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
//		}
		
		return result;
	}

	public static int deleteCar(int car_id) {
		int status = 0;
		PreparedStatement pst = null;
		try {
			Connection con = JDBC.getCon();

			String deleteQuery = "DELETE FROM CARS WHERE car_id = ?";
			pst = con.prepareStatement(deleteQuery);
			pst.setInt(1, car_id);
			status = pst.executeUpdate();
			pst.close();
			deleteQuery = "DELETE FROM RENTCAR WHERE car_id = ?";
			pst = con.prepareStatement(deleteQuery);
			pst.setInt(1, car_id);
			status = pst.executeUpdate();
			pst.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	
	public static int rentCar(User u , Cars c) {
		int status = 0;
		PreparedStatement pst = null;
			String insertQuery = "INSERT INTO jspCarRental.RENTCAR(rent_id,car_no,car_name,car_id,user_id,username,"
					+ "user_mobile,return_status,rent_price,car_model) VALUES(null,?,?,?,?,?,?,?,?,?)";
			String updateQuery = "UPDATE jspCarRental.normal_user SET balance =? where user_id = ?";
			try {
				Connection con = JDBC.getCon();
				pst = con.prepareStatement(insertQuery);
				pst.setString(1, c.getCar_no());
				pst.setString(2, c.getCar_name());
				pst.setInt(3, c.getCar_id());
				pst.setInt(4, u.getUser_id());
				pst.setString(5, u.getUsername());
				pst.setString(6, u.getUser_mobile());
				pst.setString(7, "no");
				pst.setDouble(8, c.getRent_price());
				pst.setString(9, c.getCar_model());
				status = pst.executeUpdate();
				if(status > 0) {
					pst = con.prepareStatement(updateQuery);
					pst.setDouble(1, u.getBalance()-c.getRent_price());
					pst.setInt(2, u.getUser_id());
					status = pst.executeUpdate();
				}
		}catch(Exception e) {
			e.printStackTrace();
		}
			return status;
	}
	
	public static Cars getCar(int carId) {
		Connection con = JDBC.getCon();
		Cars car = null;
		String query = "SELECT * FROM  jspCarRental.CARS WHERE car_id = ?";
		try {
			PreparedStatement pst = con.prepareStatement(query);
			pst = con.prepareStatement(query);
			pst.setInt(1, carId);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				car = new Cars();
				car.setCar_id(rs.getInt(1));
				car.setCar_no(rs.getString(2));
				car.setCar_name(rs.getString(4));
				car.setCar_maker(rs.getString(5));
				car.setCar_model(rs.getString(6));
				car.setCarAvailable(rs.getString(7));
				car.setRent_price(rs.getDouble(8));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return car;
	}
//

//
//	public static Cars carAvailability(String carNo) throws SQLException {
//		Connection con = DB.getCon();
//
//		PreparedStatement pst = null;
//		Cars car = null;
//		try {
//			String query = "SELECT * FROM CARRENTALDB.CARS WHERE car_no = ?";
//			pst = con.prepareStatement(query);
//			pst.setString(1, carNo);
//			ResultSet rs = pst.executeQuery();
//			while (rs.next()) {
//				if (rs.getInt(7) > 0) {
//					car = new Cars(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
//							rs.getString(6), rs.getInt(7));
//				}
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			pst.close();
//			con.close();
//		}
//		System.out.println("From Car Availability" + car.toString());
//		return car;
//	}
//
	public static int returnCar(int rent_id,int car_id) {
		Connection con = JDBC.getCon();

		PreparedStatement pst = null;
		int status = 0;
		try {
			String query = "SELECT * FROM jspCarRental.RENTCAR WHERE RENT_ID = ? ";
			pst = con.prepareStatement(query);
			pst.setInt(1, rent_id);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				if (rs.getString(9).equals("no")) {
					pst = con.prepareStatement("UPDATE RENTCAR SET RETURN_STATUS = ? WHERE RENT_ID = ?");
					pst.setString(1, "yes");
					pst.setInt(2, rent_id);
					status = pst.executeUpdate();
					pst.close();
					pst = con.prepareStatement("UPDATE CARS SET AVAILABILITY = ? WHERE CAR_ID = ?");
					pst.setString(1, "yes");
					pst.setInt(2, car_id);
					status = pst.executeUpdate();
					pst.close();
					con.close();
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		} 
		return status;
	}
	
	public static List<RentCar> getAllRentedCars() throws SQLException {
		Connection con = JDBC.getCon();

		List<RentCar> rentcars = new ArrayList<RentCar>();
		PreparedStatement pst = null;
		try {
			String query = "SELECT * FROM jspCarRental.RENTCAR";
			pst = con.prepareStatement(query);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				RentCar rc = new RentCar();
				rc.setRent_id(rs.getInt(1));
				rc.setCar_no(rs.getString(2));
				rc.setCar_name(rs.getString(3));
				rc.setCar_id(rs.getInt(4));
				rc.setUser_id(rs.getInt(5));
				rc.setUsername(rs.getString(6));
				rc.setUser_mobile(rs.getString(7));
				rc.setRent_price(rs.getDouble(8));
				rc.setReturn_status(rs.getString(9));
				rc.setRent_date(rs.getTimestamp(10));
				rc.setReturn_date(rs.getTimestamp(11));
				rc.setCar_model(rs.getString(12));
				rentcars.add(rc);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pst.close();
			con.close();
		}
		return rentcars;
	}
	
	public static int deleteRentedRecord(int rent_id) {
		Connection con = JDBC.getCon();
		PreparedStatement pst = null;
		int status = 0;
		try {
			String query = "DELETE FROM jspCarRental.RENTCAR WHERE RENT_ID = ? ";
			pst = con.prepareStatement(query);
			pst.setInt(1, rent_id);
			status = pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return status;
	}
}

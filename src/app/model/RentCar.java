package app.model;

import java.util.Date;

import app.servlet.DurationTime;

public class RentCar {
	
	private int car_id, user_id,rent_id; 
	private String username,car_no,car_name,car_model;
	private String user_mobile;
	private double rent_price;
	private Date rent_date;
	private String return_status;
	private Date return_date;
	
	public RentCar() {}

	public int getCar_id() {
		return car_id;
	}

	public void setCar_id(int car_id) {
		this.car_id = car_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getRent_id() {
		return rent_id;
	}
	
	

	public String getCar_model() {
		return car_model;
	}

	public void setCar_model(String car_model) {
		this.car_model = car_model;
	}

	public void setRent_id(int rent_id) {
		this.rent_id = rent_id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getCar_no() {
		return car_no;
	}

	public void setCar_no(String car_no) {
		this.car_no = car_no;
	}

	public String getCar_name() {
		return car_name;
	}

	public void setCar_name(String car_name) {
		this.car_name = car_name;
	}



	public String getUser_mobile() {
		return user_mobile;
	}

	public void setUser_mobile(String user_mobile) {
		this.user_mobile = user_mobile;
	}

	public double getRent_price() {
		return rent_price;
	}

	public void setRent_price(double rent_price) {
		this.rent_price = rent_price;
	}

	public Date getRent_date() {
		return rent_date;
	}

	public void setRent_date(Date rent_date) {
		this.rent_date = rent_date;
	}

	public String getReturn_status() {
		return return_status;
	}

	public void setReturn_status(String return_status) {
		this.return_status = return_status;
	}

	public Date getReturn_date() {
		return return_date;
	}

	public void setReturn_date(Date return_date) {
		this.return_date = return_date;
	}
	
	public String getDuration() {
		return DurationTime.findDifference(rent_date, return_date);
	}

	
}

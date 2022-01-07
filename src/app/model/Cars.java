package app.model;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;

public class Cars implements Serializable{
	private static final long serialVersionUID = 1L;
	private int car_id;
	private String car_photo;
	private String car_no, car_name, car_maker, car_model;
	private double rent_price;
	private String availability;
	private Date createdAt;
	
	
	
	public Cars() {
		
	}


	public int getCar_id() {
		return car_id;
	}


	public void setCar_id(int car_id) {
		this.car_id = car_id;
	}

	
	
	public String getCar_photo() {
		return car_photo;
	}


	public void setCar_photo(String car_photo) {
		this.car_photo = car_photo;
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


	public String getCar_maker() {
		return car_maker;
	}


	public void setCar_maker(String car_maker) {
		this.car_maker = car_maker;
	}


	public String getCar_model() {
		return car_model;
	}


	public void setCar_model(String car_model) {
		this.car_model = car_model;
	}


	public double getRent_price() {
		return rent_price;
	}


	public void setRent_price(double rent_price) {
		this.rent_price = rent_price;
	}


	public String getCarAvailable() {
		return availability;
	}


	public void setCarAvailable(String carAvailable) {
		this.availability = carAvailable;
	}


	public Date getCreatedAt() {
		return createdAt;
	}


	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}


	
	
	
}



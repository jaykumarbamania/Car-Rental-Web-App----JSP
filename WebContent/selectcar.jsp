<%@page import="app.model.Cars"%>
<%@page import="app.model.User"%>
<%@page import="app.controller.UserController"%>
<%@page import="app.controller.CarController"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="balanceerror.jsp" %>
<%
	int carid = Integer.parseInt(request.getParameter("id"));
	 
	String user_email = (String) session.getAttribute("user_email");
	User u = UserController.getNormalUser(user_email);
	Cars c = CarController.getCar(carid);
	if(u.getBalance() >= c.getRent_price()){
		int status =  CarController.rentCar(u, c);
		
		if(status >0){
			status = CarController.updateCarAvailability(carid);
			response.sendRedirect("userrentedcars.jsp");
		}
	}else{
		throw new Exception("Need to add Balance");
	}
	
%>
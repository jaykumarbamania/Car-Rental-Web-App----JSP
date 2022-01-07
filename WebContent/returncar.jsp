
<%@page import="app.controller.CarController"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% 
	int rent_id = Integer.parseInt(request.getParameter("id"));
	int car_id = Integer.parseInt(request.getParameter("car_id"));
	int status = CarController.returnCar(rent_id, car_id);
	if(status >0){
		response.sendRedirect("userrentedcars.jsp");
	}

%>
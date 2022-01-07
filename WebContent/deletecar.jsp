<%@page import="app.controller.CarController"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <%
    	int car_id  = Integer.parseInt(request.getParameter("id"));
    	int status = CarController.deleteCar(car_id);
    	if(status >0){
    		response.sendRedirect("viewcars.jsp");
    	}
    %>
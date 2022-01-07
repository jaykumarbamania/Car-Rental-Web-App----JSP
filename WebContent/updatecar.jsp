<%@page import="app.controller.CarController"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
		
			<jsp:useBean id="car" class="app.model.Cars" />
 			<jsp:setProperty property = "*" name="car" />   
		<%	
			Part imgPart = request.getPart("car_photo");
			int status = CarController.save(car, imgPart);
			if(status > 0){
				session.setAttribute("success", "Car Updated successfully");
				response.sendRedirect("viewcars.jsp");
			}
		%>
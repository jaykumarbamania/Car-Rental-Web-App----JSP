<%@page import="app.controller.UserController"%>
<%@page import="app.controller.CarController"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% 
	String email = (String) session.getAttribute("user_email");
	double currbal = UserController.getNormalUser(email).getBalance();
	double amount = Double.parseDouble(request.getParameter("amount"));
	int status = UserController.updateBalance(email, currbal, amount);
	if(status >0){
		response.sendRedirect("rentcar.jsp");
	}else{
		response.sendRedirect("balanceerror.jsp");
	}
%>
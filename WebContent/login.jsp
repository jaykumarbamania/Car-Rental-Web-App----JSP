<%@page import="app.controller.UserController"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <jsp:useBean id="user" class="app.model.User" />
    <jsp:setProperty property = "*" name="user" />
    
    <%	
    	String email =  request.getParameter("user_email");
    	String password =  request.getParameter("user_password");
    	if(email.equals("admin@gmail.com") && password.equals("admin")){
    		session.setAttribute("admin", "admin@gmail.com");
    		session.setAttribute("user_type","admin");
    		response.sendRedirect("viewcars.jsp");
    	}
    	else{
    		boolean normalUserStatus = UserController.validateNormalUser(user);
    		boolean renterStatus = UserController.validateRenter(user);
    		if(normalUserStatus){
    			out.println("You are successfully logged in..");
    			session.setAttribute("user_email", email);
    			session.setAttribute("user_type","normal");
    			response.sendRedirect("viewcars.jsp");
    		}
    		if(renterStatus){
    			out.println("You are successfully logged in..");
    			session.setAttribute("user_email", email);
    			session.setAttribute("user_type","renter");
    			response.sendRedirect("viewcars.jsp");
    		}
    		else{
    			out.println("<script type='text/javascript'>");
    			out.println("alert('Invalid Credentials... ');");
    			out.println("</script>");
    	%>
    			<jsp:include page="/index.jsp"></jsp:include>
    	<%
    		}	
    	}
    	%>
    	

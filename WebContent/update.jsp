<%@page import="app.controller.CarController"%>
<%@page import="app.controller.UserController"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% 
	session.setAttribute("error", "");
	String user_id = request.getParameter("user_id");
	String car_id = request.getParameter("car_id");
	String usertype = request.getParameter("usertype");
	int status=0;
	
	if(user_id != null){
		int parseId = Integer.parseInt(user_id);
		if(!(request.getParameter("user_password").equals(request.getParameter("cpassword")))){	
				session.setAttribute("error", "Password Mismatch");
				response.sendRedirect("edituser.jsp?user="+usertype+"&id="+parseId);
			}else{
	%>		<jsp:useBean id="user" class="app.model.User" />
    		<jsp:setProperty property = "*" name="user" />	
	<%		if(usertype.equals("normal")){
				status = UserController.updateNormalUser(user);
			}else{
				status = UserController.updateRenter(user);
			}
	
			if(status>0){
	%>			<script type="text/javascript">
					alert('Updated Successfully');
				</script>
	<%			response.sendRedirect("viewusers.jsp");
				}else{
	%>			<script type="text/javascript">
					alert('Not Updated Successfully');
				</script>
	<%			response.sendRedirect("viewusers.jsp");
				}
			}
	}else{
%>		
<%
	}
%>
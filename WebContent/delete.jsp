<%@page import="app.controller.CarController"%>
<%@page import="app.controller.UserController"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <%
    	String user_type = request.getParameter("user");
    	String id = request.getParameter("id");
    	String rent_id = request.getParameter("rent_id");
    	int status = 0;
    	if(user_type.equals("normal") || user_type.equals("renter")){
    		if(user_type.equals("normal")){
    			status = UserController.deleteNormalUser(Integer.parseInt(id));
    		}else{
    			status = UserController.deleteRenter(Integer.parseInt(id));
    		}
    		
    		if(status > 0){
   %>			<script type="text/javascript">
					alert('Deleted Successfully');
				</script>
   <%			response.sendRedirect("viewusers.jsp");
    		}
    	}
    %>
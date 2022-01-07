<%@page import="app.controller.CarController"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
        <%
    	String rent_id = request.getParameter("rent_id");
 			if(rent_id != null){
    		int status = CarController.deleteRentedRecord(Integer.parseInt(rent_id));
    		if(status > 0){
   %>			<script type="text/javascript">
					alert('Deleted Successfully');
				</script>
   <%			response.sendRedirect("returnedcar.jsp");
    		}
    	}
    %>
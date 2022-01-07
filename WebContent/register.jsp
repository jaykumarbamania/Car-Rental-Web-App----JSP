<%@ page import="app.controller.UserController"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<jsp:useBean id="user" class="app.model.User" />
<jsp:setProperty property="*" name="user" />

<%	
 	String admin= (String) session.getAttribute("admin");
 	String useremail= (String) session.getAttribute("user_email");
 	if(admin == null && useremail == null){
 		response.sendRedirect("index.jsp");
 	}else{
	if(!(request.getParameter("user_password").equals(request.getParameter("cpassword")))){	
	%>
<script type="text/javascript">
			alert("Password Mismatch... try again");
		</script>
<jsp:include page="/registerform.jsp" />
<%	}else{
		
    	String user_type = (String) session.getAttribute("usertype");
		int status = 0;
/* 		out.println("User type : "+user_type);
		out.println("Admin : "+admin); */
		if(user_type.equals("normal")){
			
			status = UserController.SaveNormalUser(user);
		}else{
			status = UserController.SaveRenter(user);
		} 
		if(status>0){
%>
<script type="text/javascript">
				alert('Registered Successfully');
			</script>
<% if(admin == null){ 
				response.sendRedirect("index.jsp");
			}else{
				response.sendRedirect("viewusers.jsp");
			}
		}	
	}
 	}
%>

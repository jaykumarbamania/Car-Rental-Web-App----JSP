<%@page import="app.model.User"%>
<%@page import="app.controller.UserController"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link
	href="https://fonts.googleapis.com/css2?family=Jost:wght@500&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" />
<title>Car Rental</title>
<style>
.navbar {
	display: flex;
	width: 1000px;
	justify-content: center;
	border-bottom: 2px solid #ff9900;
	background: white;
}

.nav-item .nav-link:hover {
	color: white !important;
	background-color: #ff9900;
	border-radius: 5px;
}

.text-yellow {
	color: #ff9900;
}
.navbar-light, .navbar-brand, .navbar-nav .nav-link {
	color: #ff9900 !important;
}

.navbar-brand {
	font-weight: 500 !important;
}

.dropdown {
    position: relative;
    display: inline-block;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #ff9900;
    color:white;
    width:auto;
    min-width: 200px;
    z-index: 1;
}

.dropdown-content a {
    color: black;
    padding: 12px 16px;
     color:white;
    text-decoration: none;
    display: block;
}

.dropdown-content a:hover {background-color: white; color:#ff9900 !important;}
.dropdown:hover .dropdown-content  {display: block; color:white;}
.dropdown:hover .dropbtn {background-color: #ff9900; color:white !important; }
</style>
</head>
<body>
		<nav class=" container navbar navbar-expand-lg navbar-light  fixed-top">
		<div>
			<a class="navbar-brand ml-5 mr-5 ">Car Rental</a>
			<button class="navbar-toggler" data-target="#my-nav"
				data-toggle="collapse" aria-controls="my-nav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
		</div>
		<div id="my-nav" class="collapse navbar-collapse d-flex justify-content-between ">
			
				
				<% 
				
				String user_type = (String)session.getAttribute("user_type");
				String admin = (String)session.getAttribute("admin");
				String user_email = (String) session.getAttribute("user_email");
				if(user_type != null || admin != null){
				%>
				<ul class="navbar-nav mr-auto ">
				<li class="nav-item"><a class="nav-link " href="viewcars.jsp">View Cars</a></li>
				<% if(user_type.equals("renter")) { %>
					<li class="nav-item"><a class="nav-link " href="rentedcars.jsp">Rented Cars</a></li>
					<li class="nav-item"><a class="nav-link " href="returnedcar.jsp">Returned Cars</a></li>
				<% } if(user_type.equals("normal")) { %>
					<li class="nav-item"><a class="nav-link " href="rentcar.jsp">Rent a Car</a></li>
					<li class="nav-item"><a class="nav-link " href="userrentedcars.jsp">Rented Cars</a></li>
				<% } if(admin != null){ %>
					<li class="nav-item"><a class="nav-link " href="viewusers.jsp">View Users</a></li>
				<% } %>
				</ul>
				<ul class="navbar-nav ml-auto ">
				<%
				User u = null;
				if(user_type.equals("normal")) {
					 u = UserController.getNormalUser(user_email);
					%>
					<li class="nav-item "><a class="nav-link " href=""><%= u.getBalance() %></a></li>
				<%} else{ 
					 u = UserController.getRenter(user_email);
				%>
				<% } if(admin == null){ %>
					
				
				<li class="nav-item ">
					<div class="dropdown">
					<a class="nav-link dropbtn" href="">Profile</a>
						<div class="dropdown-content" style="border:1px solid #ff9900">
							<a >Username : <%= u.getUsername() %> </a>
							<a >Email : <%= u.getUser_email() %></a>
							<a >Mobile : <%= u.getUser_mobile() %> </a>
						</div>
					</div>
				</li>
				<%} %>
				<li class="nav-item "><a class="nav-link " href="logout.jsp">Logout</a></li>
				</ul>
				<%
					}else{		
						%>
				<ul class="navbar-nav mr-auto ">
				<li class="nav-item"><a class="nav-link" href="registerform.jsp">Sign
						Up
				</a></li>
				<li class="nav-item"><a class="nav-link " href="index.jsp">Sign In</a></li>
				<%
					}
				%>
			</ul>
		</div>
	</nav>
</body>
</html>
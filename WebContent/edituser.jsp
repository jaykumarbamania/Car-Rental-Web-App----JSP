<%@page import="app.model.User"%>
<%@page import="app.controller.UserController"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="slide navbar style.css">

<title>Edit Users</title>
</head>
<jsp:include page="header.jsp" />
<section class="vh-auto" style="background-color: #eee;">
	<div class="container h-100">
		<div
			class="row d-flex justify-content-center align-items-center h-100">

			<div class="col-lg-12 col-xl-11">
				<div class="card text-yellow" style="border-radius: 25px;">
					<div class="card-body p-md-5">


						<div class="row justify-content-center">

							<div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">
								<%
									String user_type = request.getParameter("user");
									String error = (String) session.getAttribute("error"); 
									String success = (String) session.getAttribute("success"); 
									int id = Integer.parseInt(request.getParameter("id"));
									session.setAttribute("error", "");
									User u  = null;
									if(user_type.equals("normal")){	
										u = UserController.getNormalUser(id);
								%> 		
								<p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Edit User</p>
								<% }else { 
										u = UserController.getRenter(id);
								%>
									<p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Edit Renter</p>
									<% } if(!error.equals("")){%>
									<h3 class="alert alert-danger text-center" ><%= error %></h3>
									<% } %> 
								<form class="mx-1 mx-md-4" action="update.jsp" method="post" >
									<input type="hidden" name="user_id" value="<%=u.getUser_id() %>" />
									<input type="hidden" name="usertype" value="<%=user_type %>" />
									<input type="hidden" name="type" value="<%= user_type %>"/>
									<div class="d-flex flex-row align-items-center mb-4">
										<i class="fas fa-user fa-lg me-3 fa-fw"></i>
										<div class="form-outline flex-fill mb-0">
											<input type="text" name="username"  value="<%= u.getUsername() %>" class="form-control" />
											<label class="form-label" >Username</label>
										</div>
									</div>

									<div class="d-flex flex-row align-items-center mb-4">
										<i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
										<div class="form-outline flex-fill mb-0">
											<input type="email" name="user_email" value="<%= u.getUser_email() %>" class="form-control" />
											<label class="form-label" for="form3Example3c">Email</label>
										</div>
									</div>

									<div class="d-flex flex-row align-items-center mb-4">
										<i class="fas fa-phone fa-lg me-3 fa-fw"></i>
										<div class="form-outline flex-fill mb-0">
											<input type="text" name="user_mobile" value="<%= u.getUser_mobile() %>" class="form-control" />
											<label class="form-label" for="form3Example3c">Mobile</label>
										</div>
									</div>	
									<% if(user_type.equals("normal")){ %>
										<div class="d-flex flex-row align-items-center mb-4">
											<i class="fas fa-rupee-sign fa-lg me-3 fa-fw"></i>
											<div class="form-outline flex-fill mb-0">
												<input type="text" disabled="true" name="balance" value="<%= u.getBalance()%>" class="form-control" />
												<label class="form-label" for="form3Example3c">Balance</label>
											</div>
										</div>
									<% } %>
									<div class="d-flex flex-row align-items-center mb-4">
										<i class="fas fa-key fa-lg me-3 fa-fw"></i>
										<div class="form-outline flex-fill mb-0">
											<input type="password" name="user_password" value="<%= u.getUser_password() %>" class="form-control" />
											<label class="form-label" for="form3Example3c">Password</label>
										</div>
									</div>
									
									<div class="d-flex flex-row align-items-center mb-4">
										<i class="fas fa-lock fa-lg me-3 fa-fw"></i>
										<div class="form-outline flex-fill mb-0">
											<input type="password" value="<%= u.getUser_password() %>" name="cpassword" class="form-control" />
											<label class="form-label" for="form3Example3c">Confirm Password</label>
										</div>
									</div>		
									
									<div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
									<% if(user_type.equals("normal")){ %>
										<button type="submit" class="btn btn-warning btn-lg">Edit User</button>
									<% }else{ %>
										<button type="submit" class="btn btn-warning btn-lg">Edit Renter</button>
									<% } %>
									</div>

								</form>

							</div>
							<div
								class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2">

								<img src="images/wallpaper/index.PNG" class="img-fluid"
									alt="Sample image">

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
</body>
</html>
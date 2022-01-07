
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
									session.setAttribute("usertype", user_type);
									String admin = (String) session.getAttribute("admin");
									if(admin!= null){
										response.sendRedirect("index.jsp");
									}
									else if(user_type.equals("normal")){									
								%> 		<p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Add New User</p>
								<% }else { %>
									<p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Add New Renter</p>
									<% } %>
								<form class="mx-1 mx-md-4" action="register.jsp" method="post" >

									<div class="d-flex flex-row align-items-center mb-4">
										<i class="fas fa-user fa-lg me-3 fa-fw"></i>
										<div class="form-outline flex-fill mb-0">
											<input type="text" name="username"  class="form-control" />
											<label class="form-label" >Username</label>
										</div>
									</div>

									<div class="d-flex flex-row align-items-center mb-4">
										<i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
										<div class="form-outline flex-fill mb-0">
											<input type="email" name="user_email" class="form-control" />
											<label class="form-label" for="form3Example3c">Email</label>
										</div>
									</div>

									<div class="d-flex flex-row align-items-center mb-4">
										<i class="fas fa-phone fa-lg me-3 fa-fw"></i>
										<div class="form-outline flex-fill mb-0">
											<input type="text" name="user_mobile" class="form-control" />
											<label class="form-label" for="form3Example3c">Mobile</label>
										</div>
									</div>	
									<% if(user_type.equals("normal")){ %>
										<div class="d-flex flex-row align-items-center mb-4">
											<i class="fas fa-rupee-sign fa-lg me-3 fa-fw"></i>
											<div class="form-outline flex-fill mb-0">
												<input type="text" name="initial_deposit" class="form-control" />
												<label class="form-label" for="form3Example3c">Initial Deposit</label>
											</div>
										</div>
									<% } %>
									<div class="d-flex flex-row align-items-center mb-4">
										<i class="fas fa-key fa-lg me-3 fa-fw"></i>
										<div class="form-outline flex-fill mb-0">
											<input type="password" name="user_password" class="form-control" />
											<label class="form-label" for="form3Example3c">Password</label>
										</div>
									</div>
									
									<div class="d-flex flex-row align-items-center mb-4">
										<i class="fas fa-lock fa-lg me-3 fa-fw"></i>
										<div class="form-outline flex-fill mb-0">
											<input type="password" name="cpassword" class="form-control" />
											<label class="form-label" for="form3Example3c">Confirm Password</label>
										</div>
									</div>		
									
									<div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
									<% if(user_type.equals("normal")){ %>
										<button type="submit" class="btn btn-warning btn-lg">Register User</button>
									<% }else{ %>
										<button type="submit" class="btn btn-warning btn-lg">Register Renter</button>
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
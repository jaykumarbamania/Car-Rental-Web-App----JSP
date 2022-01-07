<%@page import="app.controller.CarController"%>
<%@page import="app.model.Cars"%>
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
								String admin = (String) session.getAttribute("admin");
								String user = (String) session.getAttribute("user_email");
								if (admin == null && user ==null) {
									response.sendRedirect("index.jsp");
								}else {
								String user_type = (String) session.getAttribute("user_type");
								if(!(user_type.equals("renter") || user_type.equals("admin"))){
									response.sendRedirect("logout.jsp");
								}
								int id = Integer.parseInt(request.getParameter("id"));
								Cars car = CarController.getCar(id);
								session.setAttribute("id", id);
								%>
								
								<p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Edit Car</p>

								<form class="mx-1 mx-md-4" action="EditCar" method="post" enctype="multipart/form-data">
									
									<div class="d-flex flex-row align-items-center mb-4">
										<i class="fas fa-car fa-lg me-3 fa-fw"></i>
										<div class="form-outline flex-fill mb-0">
											<input type="text" name="car_no"  value="<%= car.getCar_no() %>" class="form-control" />
											<label class="form-label" >Car no</label>
										</div>
									</div>
									
									<div class="d-flex flex-row align-items-center mb-4">
										<i class="fas fa-upload fa-lg me-3 fa-fw"></i>
										<div class="form-outline flex-fill mb-0">
										<img src='getImage.jsp?id=<%= car.getCar_id()%>' class='card-img-top col-md-5 w-auto' style='border:2px solid #ff9900;  height:150px; border-radius:25px;'/>
											<input type="file" name="car_photo"  class="form-control" />
											<label class="form-label" >Upload car image</label>
										</div>
									</div>

									<div class="d-flex flex-row align-items-center mb-4">
										<i class="fas fa-car fa-lg me-3 fa-fw"></i>
										<div class="form-outline flex-fill mb-0">
											<input type="text" name="car_name" value="<%= car.getCar_name() %>" class="form-control" />
											<label class="form-label">Car Name</label>
										</div>
									</div>

									<div class="d-flex flex-row align-items-center mb-4">
										<i class="fas fa-building fa-lg me-3 fa-fw"></i>
										<div class="form-outline flex-fill mb-0">
											<input type="text" name="car_maker" value="<%= car.getCar_maker() %>"  class="form-control" />
											<label class="form-label">Car Maker</label>
										</div>
									</div>	
									
									<div class="d-flex flex-row align-items-center mb-4">
										<i class="fas fa-cogs fa-lg me-3 fa-fw"></i>
										<div class="form-outline flex-fill mb-0">
											<input type="text" name="car_model" value="<%= car.getCar_model()%>" class="form-control" />
											<label class="form-label">Car Model</label>
										</div>
									</div>		

									
									<div class="d-flex flex-row align-items-center mb-4">
										<i class="fas fa-rupee-sign fa-lg me-3 fa-fw"></i>
										<div class="form-outline flex-fill mb-0">
											<input type="text" name="rent_price" value="<%= car.getRent_price() %>" class="form-control" />
											<label class="form-label" >Rent Price</label>
										</div>
									</div>
									
									<div class="d-flex flex-row align-items-center mb-4">
										<i class="fas fa-user fa-lg me-3 fa-fw"></i>
										<div class="form-outline flex-fill mb-0">
											<label class="form-label" >Availability</label>
											<select name="availability">
												<option value="yes">Yes</option>
												<option value="no">No</option>
											</select>
										</div>
									</div>

									
									<div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
										<button type="submit" class="btn btn-warning btn-lg">Update</button>
									</div>

								</form>
								<% } %>
							</div>
							<div class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center justify-content-center order-1 order-lg-2">

								<!-- <img src="images/wallpaper/index.PNG" class="img-fluid"
									alt="Sample image"> -->
								<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100" width="400px" height="400px" src="https://www.bing.com/th?id=OIP.DeW63hXaGjFJk30UBksDYQHaEK&w=206&h=103&c=8&rs=1&qlt=90&o=6&dpr=1.25&pid=3.1&rm=2" alt="First slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="https://www.bing.com/th?id=OIP.IPad_IFI-HoCCbu_inewDAHaDK&w=247&h=105&c=8&rs=1&qlt=90&o=6&dpr=1.25&pid=3.1&rm=2" alt="Second slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="https://www.bing.com/th?id=OIP.nRZNBIC5ShGiI_0qIh1vewHaEo&w=190&h=103&c=8&rs=1&qlt=90&o=6&dpr=1.25&pid=3.1&rm=2" alt="Third slide">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

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
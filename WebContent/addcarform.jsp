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


								<p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Add New Car</p>

								<form class="mx-1 mx-md-4" action="AddCar" method="post" enctype="multipart/form-data">

									<div class="d-flex flex-row align-items-center mb-4">
										<i class="fas fa-car fa-lg me-3 fa-fw"></i>
										<div class="form-outline flex-fill mb-0">
											<input type="text" name="car_no"  class="form-control" />
											<label class="form-label" >Car no</label>
										</div>
									</div>
									
									<div class="d-flex flex-row align-items-center mb-4">
										<i class="fas fa-upload fa-lg me-3 fa-fw"></i>
										<div class="form-outline flex-fill mb-0">
											<input type="file" name="car_photo"  class="form-control" />
											<label class="form-label" >Upload car image</label>
										</div>
									</div>

									<div class="d-flex flex-row align-items-center mb-4">
										<i class="fas fa-car fa-lg me-3 fa-fw"></i>
										<div class="form-outline flex-fill mb-0">
											<input type="text" name="car_name" class="form-control" />
											<label class="form-label" for="form3Example3c">Car Name</label>
										</div>
									</div>

									<div class="d-flex flex-row align-items-center mb-4">
										<i class="fas fa-building fa-lg me-3 fa-fw"></i>
										<div class="form-outline flex-fill mb-0">
											<input type="text" name="car_maker" class="form-control" />
											<label class="form-label" for="form3Example3c">Car Maker</label>
										</div>
									</div>	
									
									<div class="d-flex flex-row align-items-center mb-4">
										<i class="fas fa-cogs fa-lg me-3 fa-fw"></i>
										<div class="form-outline flex-fill mb-0">
											<input type="text" name="car_model" class="form-control" />
											<label class="form-label" for="form3Example3c">Car Model</label>
										</div>
									</div>		

									
									<div class="d-flex flex-row align-items-center mb-4">
										<i class="fas fa-rupee-sign fa-lg me-3 fa-fw"></i>
										<div class="form-outline flex-fill mb-0">
											<input type="text" name="rent_price"  class="form-control" />
											<label class="form-label" >Rent Price</label>
										</div>
									</div>

									
									<div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
										<button type="submit" class="btn btn-warning btn-lg">Register Car</button>
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
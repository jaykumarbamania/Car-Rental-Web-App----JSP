<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="slide navbar style.css">

<title>Login</title>
<style>

</style>
</head>
<body>
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


									<p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Sign
										In</p>

									<form class="mx-1 mx-md-4" action="login.jsp" method="post">

										<div class="d-flex flex-row align-items-center mb-4">
											<i class="fas fa-user fa-lg me-3 fa-fw"></i>
											<div class="form-outline flex-fill mb-0">
												<input type="text" name="user_email" value="" class="form-control" />
												<label class="form-label"> Email</label>
											</div>
										</div>

										<div class="d-flex flex-row align-items-center mb-4">
											<i class="fas fa-lock fa-lg me-3 fa-fw"></i>
											<div class="form-outline flex-fill mb-0">
												<input type="password" 
													name = "user_password"
													value=""
													class="form-control" /> <label class="form-label"
													>Password</label>
											</div>
										</div>


										<div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
											<button type="submit" class="btn btn-warning btn-lg">Login</button>
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
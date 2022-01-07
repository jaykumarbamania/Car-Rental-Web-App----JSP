<%@page import="app.controller.UserController"%>
<%@page import="app.model.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="WEB-INF/carstag.tld" prefix="cartag"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="slide navbar style.css">

<title>View Users</title>
<style>
.card {
	flex-direction: row !important;
	align-items: center;
}

.card-title {
	font-weight: bold;
}

.card img {
	width: 30%;
	border-top-right-radius: 0;
	border-bottom-left-radius: calc(0.25rem - 1px);
}

@media only screen and (max-width: 768px) {
	a {
		display: none;
	}
	.card-body {
		padding: 0.5em 1.2em;
	}
	.card-body .card-text {
		margin: 0;
	}
	.card img {
		width: 50%;
	}
}

@media only screen and (max-width: 1200px) {
	.card img {
		width: 40%;
	}
}
</style>
<body>
	<jsp:include page="header.jsp" />

	<section class="vh-auto">
		<div class="container h-auto pb-5 pt-5"
			style="border-radius: 25px; background-color: #eee;">

			<div
				class="row d-flex justify-content-center align-items-center h-100 pt-5">
				<%
				String admin = (String) session.getAttribute("admin");
				if (admin == null) {
					response.sendRedirect("index.jsp");
				}
				List<User> normal_users = UserController.getAllNormalUsers();
				request.setAttribute("normal_user", normal_users);
				List<User> renters = UserController.getAllRenterUsers();
				request.setAttribute("renter", renters);
				%>
				<div class="col-lg-12 col-xl-11 ">
					<%
					if (admin != null) {
					%>
					<div class="text-yellow  " style="">
						<div class="p-3 text-center m-auto d-flex  "
							style="color: #ff9900; width: 1000px; background-color: white; margin-bottom:20px !important; justify-content: space-between; border-bottom: 2px solid #ff9900;">
							<div style="width: 70%;">
								<h4 class="m-auto">Renters</h4>
							</div>
							<div class=" d-flex">
								<a href="adduserform.jsp?user=renter" class="btn btn-warning ">Add New
									Renter</a>
							</div>
						</div>
						<c:forEach items="${renter}" var="user">
							<%-- <cartag:getcar rentprice="${car.getRent_price()}" carname="${car.setCar_name()}" carmodel="${car.setCar_model()}" imgPath="getImage.jsp?id=${car.getCar_id}"/> --%>

							<div class='card row d-flex w-75 m-auto '
								style='border-radius: 25px; border: 2px solid #ff9900; margin-bottom: 20px !important;'>
								<%-- <img src='getImage.jsp?id=${car.getCar_id()}' class='card-img-top col-md-5 w-25 h-auto' style='border-right:2px solid #ff9900; border-radius:25px;'/> --%>
								<div class='card-body col-md-7 ml-5 text-black d-flex'
									style='justify-content: space-between;'>
									<div class='row col-10' style='justify-content: space-between;'>
										<table>
											<tr>
												<th>Username :</th>
												<td>${user.getUsername() }</td>
											</tr>
											<tr>
												<th>Email :</th>
												<td>${user.getUser_email() }</td>
											</tr>
											<tr>
												<th>Mobile :</th>
												<td>${user.getUser_mobile() }</td>
											</tr>
										</table>
										<%-- <h5 class='card-title row col-12'>Username : <b >${user.getCar_maker()}</b></h5>
								<h5 class='card-title row col-12'>Car Name :<b>${user.getCar_name()}</b></h5>
								<h5 class='card-text row col-12'>Model : <b>${user.getCar_model()}</b></h5>
								<h5 class='card-text row col-12'>Rent Price : <b>${user.getRent_price()}</b></h5> --%>
									</div>
									<div class="col-2 d-flex"
											style="flex-direction: column; width: auto;">
											<a href="delete.jsp?user=renter&id=${user.getUser_id()}" class='btn btn-danger float-right'>Delete</a> 
											<a href="edituser.jsp?user=renter&id=${user.getUser_id()}" class='btn btn-warning float-right'>Edit</a>
										</div>
								</div>
							</div>
						</c:forEach>
						<%
						}
						%>
						<div class="text-yellow  " style="">
							<div class="p-3 text-center m-auto d-flex  "
								style="color: #ff9900; width: 1000px; background-color: white; margin-bottom:20px !important; margin-top:20px !important; justify-content: space-between; border-bottom: 2px solid #ff9900;">
								<div style="width: 70%;">
									<h4 class="m-auto">Normal Users</h4>
								</div>
								<div class=" d-flex">
									<a href="adduserform.jsp?user=normal" class="btn btn-warning ">Add
										New User</a>
								</div>
							</div>
							<c:forEach items="${normal_user}" var="user">
								<%-- <cartag:getcar rentprice="${car.getRent_price()}" carname="${car.setCar_name()}" carmodel="${car.setCar_model()}" imgPath="getImage.jsp?id=${car.getCar_id}"/> --%>

								<div class='card row d-flex w-75 m-auto '
									style='border-radius: 25px; border: 2px solid #ff9900; margin-bottom: 20px !important;'>
									<%-- <img src='getImage.jsp?id=${car.getCar_id()}' class='card-img-top col-md-5 w-25 h-auto' style='border-right:2px solid #ff9900; border-radius:25px;'/> --%>
									<div class='card-body col-md-7 ml-5 text-black d-flex'
										style='justify-content: space-between;'>
										<div class='row col-10'
											style='justify-content: space-between;'>
											<table>
												<tr>
													<th>Username :</th>
													<td>${user.getUsername() }</td>
													<th>Balance :</th>
													<td>${user.getBalance() }</td>
												</tr>
												<tr>
													<th>Email :</th>
													<td>${user.getUser_email() }</td>
												</tr>
												<tr>
													<th>Mobile :</th>
													<td>${user.getUser_mobile() }</td>
												</tr>
											</table>
											<%-- <h5 class='card-title row col-12'>Username : <b >${user.getCar_maker()}</b></h5>
								<h5 class='card-title row col-12'>Car Name :<b>${user.getCar_name()}</b></h5>
								<h5 class='card-text row col-12'>Model : <b>${user.getCar_model()}</b></h5>
								<h5 class='card-text row col-12'>Rent Price : <b>${user.getRent_price()}</b></h5> --%>
										</div>
										<div class="col-2 d-flex"
											style="flex-direction: column; width: auto;">
											<a href="delete.jsp?user=normal&id=${user.getUser_id()}" class='btn btn-danger float-right'>Delete</a> 
											<a href="edituser.jsp?user=normal&id=${user.getUser_id()}" class='btn btn-warning float-right'>Edit</a>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
	</section>

</body>
</html>

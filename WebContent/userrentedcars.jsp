<%@page import="app.servlet.DurationTime"%>
<%@page import="app.model.User"%>
<%@page import="app.controller.UserController"%>
<%@page import="app.model.RentCar"%>
<%@page import="app.controller.CarController"%>
<%@page import="app.model.Cars"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

   <%@ taglib uri="WEB-INF/carstag.tld" prefix="cartag" %>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
  <!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="slide navbar style.css">

<title>Rented</title>
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
	<%-- <% if() %> --%>
   <jsp:include page="header.jsp" />
   
   	<section class="vh-auto" >
		<div class="container h-auto pb-5 pt-5" style="border-radius: 25px; background-color: #eee;">
			<div class="p-3 text-center m-auto d-flex  "
				style="color: #ff9900; width: 1000px; margin-top:40px !important; background-color: white; justify-content: space-between; border-bottom: 2px solid #ff9900;">
				<div style="width: 60%;">
					<h4 class="m-auto">Your Rented Cars </h4>
				</div>
			</div>
			<div class="row d-flex justify-content-center align-items-center h-100 pt-5">
				<div class="col-lg-12 col-xl-11">
					<div class="text-yellow " style=" ">
					<% List<RentCar> rentcars = CarController.getAllRentedCars();
					request.setAttribute("rentcars", rentcars);
					String user_email = (String) session.getAttribute("user_email");
					String user_type = (String) session.getAttribute("user_type");
					User u = UserController.getNormalUser(user_email);
					request.setAttribute("username", u.getUsername());
					if(user_type.equals("normal")){
					%>
					<c:forEach items="${rentcars}" var="rentcar">
					
						<c:if test="${rentcar.getUsername() eq username  && rentcar.getReturn_status().equals(\"no\")}">
						<div class='card row d-flex w-75 m-auto ' style='border-radius:25px; border:2px solid green; margin-bottom:20px !important;'>
						<img src='getImage.jsp?id=${rentcar.getCar_id()}' class='card-img-top col-md-5 w-25' style='border-right:2px solid green;  height:150px; border-radius:25px;'/>
						<div class='card-body col-md-7 ml-5 text-black d-flex' style='justify-content:space-between;'>
							<div class='row col-10 pl-3' style='justify-content:space-between;'>
							<table style=" margin-left:20px;">
								<tr>
									<th>Car No : </th>
									<td><b >${rentcar.getCar_no()}</b></td>
									<th>User Id </th>
									<td><b >${rentcar.getUser_id()}</b></td>
								</tr>
								<tr>
									<th>Car Name : </th>
									<td><b >${rentcar.getCar_name()}</b></td>
									<th>User Name : </th>
									<td><b >${rentcar.getUsername()}</b></td>
								</tr>
								<tr>
									<th>Model : </th>
									<td><b >${rentcar.getCar_model()}</b></td>
									<th>User Mobile : </th>
									<td><b >${rentcar.getUser_mobile()}</b></td>
								</tr>
								<tr>
									<th>Rented On : </th>
									<td><b >${rentcar.getRent_date()}</b></td>
									<th>Return Date : </th>
									<td><b >-</b></td>
								</tr>
								<tr style="color: green;">
									<th>Rented Price : </th>
									<td><h4>${rentcar.getRent_price()}</h4></td>
									<th>Return Status : </th>
									<td><h4>${rentcar.getReturn_status()}</h4></td>
								</tr>
							</table>
							</div>
							<div class="col-2">
								<a href="returncar.jsp?id=${rentcar.getRent_id()}&car_id=${rentcar.getCar_id()}" class='btn btn-success float-right' >Return Car</a>
							</div>
						</div>
					</div>
						</c:if>
						</c:forEach>
						<div class="p-3 text-center m-auto d-flex  "
							style="color: #ff9900; width: 1000px; background-color: white; margin-bottom:20px !important; justify-content: space-between; border-bottom: 2px solid #ff9900;">
							<div style="width: 70%;">
								<h4 class="m-auto">Cars you have returned </h4>
							</div>
						</div>
						<c:forEach items="${rentcars}" var="rentcar">
						<c:if test="${rentcar.getUsername() eq username  && rentcar.getReturn_status().equals(\"yes\")}">
						
						<div class='card row d-flex w-75 m-auto ' style='border-radius:25px; border:2px solid #ff9900; margin-bottom:20px !important;'>
						<img src='getImage.jsp?id=${rentcar.getCar_id()}' class='card-img-top col-md-5 w-25' style='border-right:2px solid #ff9900;  height:150px; border-radius:25px;'/>
						<div class='card-body col-md-7 ml-5 text-black d-flex' style='justify-content:space-between;'>
							<div class='row col-10 pl-3' style='justify-content:space-between;'>
							<table style=" margin-left:20px;">
								<tr>
									<th>Car No : </th>
									<td><b >${rentcar.getCar_no()}</b></td>
									<th>User Id </th>
									<td><b >${rentcar.getUser_id()}</b></td>
								</tr>
								<tr>
									<th>Car Name : </th>
									<td><b >${rentcar.getCar_name()}</b></td>
									<th>User Name : </th>
									<td><b >${rentcar.getUsername()}</b></td>
								</tr>
								<tr>
									<th>Model : </th>
									<td><b >${rentcar.getCar_model()}</b></td>
									<th>User Mobile : </th>
									<td><b >${rentcar.getUser_mobile()}</b></td>
								</tr>
								<tr>
									<th>Rented On : </th>
									<td><b >${rentcar.getRent_date()}</b></td>
									<th>Rented Price : </th>
									<td><h5>${rentcar.getRent_price()}</h5></td>
									
								</tr>
								<tr >
									<th>Return Date : </th>
									<td><b >${rentcar.getReturn_date()}</b></td>
									<th>Return Status : </th>
									<td><h5>${rentcar.getReturn_status()}</h5></td>
								</tr>
							</table>
							</div>
							<div class="col-2 d-flex" style="flex-direction: column;color: #ff9900;">
								<h6>Duration : </h6>
								<h6>${rentcar.getDuration()}</h6>>
							</div>
						</div>
					</div>
					</c:if>
					<%-- <cartag:getcar rentprice="${car.getRent_price()}" carname="${car.setCar_name()}" carmodel="${car.setCar_model()}" imgPath="getImage.jsp?id=${car.getCar_id}"/> --%>
				
					</c:forEach>
					<% }else{ %>
						<c:forEach items="${rentcars}" var="rentcar">
						<c:choose>
						<c:when test="${rentcar.getReturn_status().equals(\"yes\")}">
						
						<div class='card row d-flex w-75 m-auto ' style='border-radius:25px; border:2px solid #ff9900; margin-bottom:20px !important;'>
						<img src='getImage.jsp?id=${rentcar.getCar_id()}' class='card-img-top col-md-5 w-25' style='border-right:2px solid #ff9900;  height:150px; border-radius:25px;'/>
						<div class='card-body col-md-7 ml-5 text-black d-flex' style='justify-content:space-between;'>
							<div class='row col-10 pl-3' style='justify-content:space-between;'>
							<table style=" margin-left:20px;">
								<tr>
									<th>Car No : </th>
									<td><b >${rentcar.getCar_no()}</b></td>
									<th>User Id </th>
									<td><b >${rentcar.getUser_id()}</b></td>
								</tr>
								<tr>
									<th>Car Name : </th>
									<td><b >${rentcar.getCar_name()}</b></td>
									<th>User Name : </th>
									<td><b >${rentcar.getUsername()}</b></td>
								</tr>
								<tr>
									<th>Model : </th>
									<td><b >${rentcar.getCar_model()}</b></td>
									<th>User Mobile : </th>
									<td><b >${rentcar.getUser_mobile()}</b></td>
								</tr>
								<tr>
									<th>Rented On : </th>
									<td><b >${rentcar.getRent_date()}</b></td>
									<th>Rented Price : </th>
									<td><h5>${rentcar.getRent_price()}</h5></td>
									
								</tr>
								<tr >
									<th>Return Date : </th>
									<td><b >${rentcar.getReturn_date()}</b></td>
									<th>Return Status : </th>
									<td><h5>${rentcar.getReturn_status()}</h5></td>
								</tr>
							</table>
							</div>
							<div class="col-2 d-flex" style="flex-direction: column;color: #ff9900;">
								<h6>Duration : </h6>
								<h6>${rentcar.getDuration()}</h6>>
							</div>
						</div>
					</div>
					</c:when>
					<%-- <cartag:getcar rentprice="${car.getRent_price()}" carname="${car.setCar_name()}" carmodel="${car.setCar_model()}" imgPath="getImage.jsp?id=${car.getCar_id}"/> --%>
					</c:choose>
					</c:forEach>
					<% } %>
						</div>
					</div>
				</div>
			</div>
	</section>
	
   </body>
</html>

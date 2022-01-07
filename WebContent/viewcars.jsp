<%@page import="java.util.stream.Collectors"%>
<%@page import="java.util.Comparator"%>
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

<title>View Cars</title>
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
			
			<div class="row d-flex justify-content-center align-items-center h-100 pt-5">
			<% String admin = (String) session.getAttribute("admin");
			String user = (String) session.getAttribute("user_email");
			if (admin == null && user ==null) {
				response.sendRedirect("index.jsp");
			}else {
			String user_type = (String) session.getAttribute("user_type");
			if( admin != null || user_type.equals("renter") ) {
			%>
				<div class="m-5 d-flex justify-content-center"><a href="addcarform.jsp" class="btn btn-warning ">Add New Car</a></div>
				<% } %>
				<div class="col-lg-12 col-xl-11">
					<div class="text-yellow " style=" ">
					<% List<Cars> carslist = CarController.getAllCars();
					Comparator<Cars> compareByReturnDate = Comparator.comparing(Cars::getCreatedAt).reversed();
					List<Cars> cars  = carslist.stream().sorted(compareByReturnDate).collect(Collectors.toList());
					request.setAttribute("cars", cars);
					
					if(user_type.equals("normal")){
					%>
					<c:forEach items="${cars}" var="car">
					<c:choose>
						<c:when test="${car.getCarAvailable().equals(\"no\")}">
						<div class='card row d-flex w-75 m-auto ' style='border-radius:25px; border:2px solid green; margin-bottom:20px !important;'>
						<img src='getImage.jsp?id=${car.getCar_id()}' class='card-img-top col-md-5 w-25' style='border-right:2px solid green;  height:150px; border-radius:25px;'/>
						<div class='card-body col-md-7 ml-5 text-black d-flex' style='justify-content:space-between;'>
							<div class='row col-10 pl-3' style='justify-content:space-between;'>
							<table style=" margin-left:20px;">
								<tr>
									<th>Company : </th>
									<td><b >${car.getCar_maker()}</b></td>
								</tr>
								<tr>
									<th>Car Name : </th>
									<td><b >${car.getCar_name()}</b></td>
								</tr>
								<tr>
									<th>Model : </th>
									<td><b >${car.getCar_model()}</b></td>
								</tr>
								<tr style="color: #ff9900;">
									<th>Rent Price : </th>
									<td><h4>${car.getRent_price()}</h4></td>
								</tr>
							</table>
							</div>
							<div class="col-2  d-flex" style="flex-direction: column">
								<a href="" class='btn btn-success float-right'>Not Available</a>
							</div>
						</div>
					</div>
						</c:when>
						<c:otherwise>
								<div class='card row d-flex w-75 m-auto ' style='border-radius:25px; border:2px solid #ff9900; margin-bottom:20px !important;'>
						<img src='getImage.jsp?id=${car.getCar_id()}' class='card-img-top col-md-5 w-25' style='border-right:2px solid #ff9900;  height:150px; border-radius:25px;'/>
						<div class='card-body col-md-7 ml-5 text-black d-flex' style='justify-content:space-between;'>
							<div class='row col-10 pl-3' style='justify-content:space-between;'>
							<table style=" margin-left:20px;">
								<tr>
									<th>Company : </th>
									<td><b >${car.getCar_maker()}</b></td>
								</tr>
								<tr>
									<th>Car Name : </th>
									<td><b >${car.getCar_name()}</b></td>
								</tr>
								<tr>
									<th>Model : </th>
									<td><b >${car.getCar_model()}</b></td>
								</tr>
								<tr style="color: #ff9900;">
									<th>Rent Price : </th>
									<td><h4>${car.getRent_price()}</h4></td>
								</tr>
							</table>
								<%-- <h5 class='card-title row col-12'>Company : </h5>
								<h5 class='card-title row col-12'>Car Name :<b>${car.getCar_name()}</b></h5>
								<h5 class='card-text row col-12'>Model : <b>${car.getCar_model()}</b></h5>
								<h5 class='card-text row col-12'>Rent Price : <b>${car.getRent_price()}</b></h5> --%>
							</div>
							<div class="col-2  d-flex" style="flex-direction: column">
								<%-- <a href="selectcar.jsp?id=${car.getCar_id()}" class='btn btn-warning float-right'>Select</a> --%>
							</div>
						</div>
					</div>
						</c:otherwise>
					</c:choose>
					<%-- <cartag:getcar rentprice="${car.getRent_price()}" carname="${car.setCar_name()}" carmodel="${car.setCar_model()}" imgPath="getImage.jsp?id=${car.getCar_id}"/> --%>
				
					</c:forEach>
					<% } else{ %>
						<c:forEach items="${cars}" var="car">
						<c:choose>
						<c:when test="${car.getCarAvailable().equals(\"yes\")}">
						
						<div class='card row d-flex w-75 m-auto ' style='border-radius:25px; border:2px solid #ff9900; margin-bottom:20px !important;'>
						<img src='getImage.jsp?id=${car.getCar_id()}' class='card-img-top col-md-5 w-25' style='border-right:2px solid #ff9900;  height:150px; border-radius:25px;'/>
						<div class='card-body col-md-7 ml-5 text-black d-flex' style='justify-content:space-between;'>
							<div class='row col-10 pl-3' style='justify-content:space-between;'>
							<table style=" margin-left:20px;">
								<tr>
									<th>Company : </th>
									<td><b >${car.getCar_maker()}</b></td>
								</tr>
								<tr>
									<th>Car Name : </th>
									<td><b >${car.getCar_name()}</b></td>
								</tr>
								<tr>
									<th>Model : </th>
									<td><b >${car.getCar_model()}</b></td>
								</tr>
								<tr style="color: #ff9900;">
									<th>Rent Price : </th>
									<td><h4>${car.getRent_price()}</h4></td>
								</tr>
							</table>
							</div>
							<div class="col-2  d-flex" style="flex-direction: column">
								<a href="editcar.jsp?id=${car.getCar_id()}" class='btn btn-warning float-right'>Edit</a>
								<a href="deletecar.jsp?id=${car.getCar_id()}" class='btn btn-danger mt-3 float-right'>Delete</a>
							</div>
						</div>
					</div>
					</c:when>
						
						<c:otherwise>
						<div class='card row d-flex w-75 m-auto ' style='border-radius:25px; border:2px solid green; margin-bottom:20px !important;'>
						<img src='getImage.jsp?id=${car.getCar_id()}' class='card-img-top col-md-5 w-25' style='border-right:2px solid green;  height:150px; border-radius:25px;'/>
						<div class='card-body col-md-7 ml-5 text-black d-flex' style='justify-content:space-between;'>
							<div class='row col-10 pl-3' style='justify-content:space-between;'>
							<table style=" margin-left:20px;">
								<tr>
									<th>Company : </th>
									<td><b >${car.getCar_maker()}</b></td>
								</tr>
								<tr>
									<th>Car Name : </th>
									<td><b >${car.getCar_name()}</b></td>
								</tr>
								<tr>
									<th>Model : </th>
									<td><b >${car.getCar_model()}</b></td>
								</tr>
								<tr style="color: green;">
									<th>Rent Price : </th>
									<td><h4>${car.getRent_price()}</h4></td>
								</tr>
							</table>
							</div>
							<div class="col-2 d-flex" style="flex-direction: column">
								<a href="editcar.jsp?id=${car.getCar_id()}" class='btn btn-warning float-right'>Edit</a>
								<a href="" class='btn btn-success float-right mt-3'>On Rent</a>
							</div>
						</div>
					</div>
						</c:otherwise>
						</c:choose>
						</c:forEach>
					<% }
					}%>
						</div>
					</div>
				</div>
			</div>
	</section>
	
   </body>
</html>

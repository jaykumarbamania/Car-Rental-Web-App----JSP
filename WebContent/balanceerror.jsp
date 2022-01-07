<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Error Page</title>
<style>
.errorDiv {
	color: red;
}
</style>
</head>
<body>
	<%@ include file="header.jsp"%>
	<section class="vh-auto">
		<div class="container h-auto pb-5 pt-5"
			style="border-radius: 25px; background-color: #eee;">
			<div class="row d-flex justify-content-center align-items-center h-100 pt-5">
			
				<div class="errorDiv text-center">
					<h1>Oops!... Something Went worng</h1>
					<h3 class="alert alert-danger">Insufficient Balance</h3>
					<h4 class="alert alert-danger">
						"<%= exception.getMessage() %>"
					</h4>
				</div>
				<div>
				<div class="alert alert-warning text-warning">
				<h1 >But Don't worry you can deposit amount</h1>
				<h2 >Want to Deposit amount ?</h2>
				</div>
					<form action = "updatebal.jsp" method="post">
				  		<div class="d-flex flex-row align-items-center mb-4 text-warning">
							<i class="fas fa-rupee-sign fa-lg me-3 fa-fw"></i>
							<div class="form-outline flex-fill mb-0">
								<input type="text" name="amount" class="form-control" />
								<label class="form-label" for="form3Example3c">Enter amount to Deposit</label>
							</div>
						</div>
					  	<button type="submit" class="btn btn-success">Deposit</button>
				  	</form>
				</div>
			</div>
		</div>
	</section>
	




</body>
</html>
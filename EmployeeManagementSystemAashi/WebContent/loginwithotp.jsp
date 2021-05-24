<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="BootstrapCSS.jsp" %>
<%@include file="CommonHeader.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Forgot the password</title>
<link rel="stylesheet" href="style.css">

</head>
<body>
	
	<header class="header">
	
	<br>
	<br>
	<div style="text-align: center">

			<h1>Login Via OTP</h1>
			<br> <br>
			
			<form action="loginViaOtp" method="post">
				<label for="PhoneNumber">Phone Number :</label>
				
				 <input type="number" name="phonenumber" size="30" />
				 <br>
				 
				 <button type="submit" class="btn btn-primary">verify</button>
				  <br> <br> 
			</form>
	
		</div>
	</header>
	<section class="footer">
	<div class="py-1 bg-dark">
		<p style="text-align:center; color:white">
		 Copyright &copy; 2020 - Employee Management System </p>
	</div>
	</section>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="BootstrapCSS.jsp"%>
<%@include file="CommonHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>After OTP Login</title>
<link rel="stylesheet" href="style.css">
</head>
<body>

	<header class="header">

		<br> <br> <br>

		<div style="text-align: center">
			<form action="VerifyingOtp" method="post">
				<h2>One Time Password :</h2> 
				<br>
				<input type="number" size="15" name="otp">
				<br> <br> <br>
				<input type="submit" class="btn btn-primary" value="submit">
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
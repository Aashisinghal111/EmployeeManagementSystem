<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="BootstrapCSS.jsp" %>
<%@include file="CommonHeader.jsp" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee web tracker</title>
<link rel="stylesheet" href="style.css">

</head>
<body>


	<header class="header">
		<br> <br> <br> <br>
		<%
			String msg = request.getParameter("message");
		if (msg != null) {
		%>
		<div style="text-align: center">

			<h1>Admin Login</h1>
			<br>
			<p><%=msg%></p>
			<form action="AfterSuccessLogin.jsp" method="post">
				<label for="email">Email:</label> <input type="email" name="email"
					size="30" /> <br> <br> <label for="password">Password:</label>
				<input type="password" name="password" size="30" /> <br> <br>
				<button type="submit" class="btn btn-primary">Login</button> <br> <br>
				<small>Forgot the password?</small>
				<a href="loginwithotp.jsp">Login Via OTP</a>
			</form>
			
		</div>
		<%
			} else {
		%>

		<div style="text-align: center">
			<h1>Admin Login</h1>
			<br>
			<form action="AfterSuccessLogin.jsp" method="post">
				<label for="email">Email:</label> <input type="email" name="email"
					size="30" /> <br> <br> <label for="password">Password:</label>
				<input type="password" name="password" size="30" /> <br> <br>
				<button type="submit" class="btn btn-primary">Login</button> <br> <br>
				<small>Forgot the password?</small>
				<a href="loginwithotp.jsp">Login Via OTP</a>
			</form>
		</div>
		<%
			}
		%>
		
	</header>
	
	<section class="footer">
	<div class="py-1 bg-dark">
		<p style="text-align:center; color:white">
		 Copyright &copy; 2020 - Employee Management System </p>
	</div>
	</section>
	
	
	
</body>
</html>
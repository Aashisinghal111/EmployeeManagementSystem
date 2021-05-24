<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="BootstrapCSS.jsp" %>
<%@include file="CommonHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee Main Page</title>

<link rel="stylesheet" href="style.css">

</head>
<body>
	<%
		String status = (String)session.getAttribute("status");
		if(status!=null){
		
	%>

	<br>
	<br>
	<div class="container">
		<form action="SaveEmployee" method="post">
			<table class="table table-striped">

				<tr>
					<td scope="col"> <b> Employee First Name </b></td>
					<td scope="col"><input type="text" size="30" name="first_name"
						placeholder="Employee first name" required="required"></td>
				</tr>

				<tr>
					<td scope="col"><b> Employee Last Name</b></td>
					<td scope="col"><input type="text" size="30" name="last_name"
						placeholder="Employee last name" required="required"></td>
				</tr>

				<tr>
					<td scope="col"><b> Employee Email</b> </td>
					<td scope="col"><input type="email" name="email" size="30"
						placeholder="Employee email" required="required"></td>
				</tr>

				<tr>
					<td scope="col"><b> Employee Contact No</b></td>
					<td scope="col"><input type="number" name="phoneno" size="10"
						placeholder="Employee phone no" min="6111111111" max="9999999999" required="required"></td>
				</tr>

				<tr>
					<td scope="col"> <b> Employee Hobbies </b></td>
					<td scope="col"><input type="checkbox" name="hobby"
						value="Writing"> <label for="hobby1"> I love
							writing</label>&nbsp;&nbsp;&nbsp;&nbsp;  <input type="checkbox" name="hobby"
						value="Reading"> <label for="hobby2"> I love
							reading</label>&nbsp;&nbsp;&nbsp;&nbsp;  <input type="checkbox" name="hobby"
						value="Coding" checked> <label for="hobby3"> I
							love coding</label></td>

				</tr>

				<tr>
					<td> <b> Date of joining </b> </td>
					<td><input type="date" name="dateofjoining" required="required"></td>
				</tr>

				<tr>
					<td> <b> Upload your resume </b> </td>
					<td><input type="file" name="resume" ></td>
				</tr>

				<tr>
					<td> <b> Employee gender </b></td>
					<td><input type="radio" value="female" name="gender" checked>
						Female &nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" value="male"
						name="gender"> Male &nbsp;&nbsp;&nbsp;&nbsp; <input
						type="radio" value="transgender" name="gender">Transgender
					</td>
				</tr>

				<tr>
				<td> <b> Interest in Coding </b></td>
					<td><input type="range" list="tickmarks" name="interest" >

					<datalist id="tickmarks">
						<option value="0" >0</option>
						<option value="10" >10</option>
						<option value="20" >20</option>
						<option value="30" >30</option>
						<option value="40" >40</option>
						<option value="50" >50</option>
						<option value="60" >60</option>
						<option value="70" >70</option>
						<option value="80" >80</option>
						<option value="90" >90</option>
						<option value="100" >100</option>
					</datalist>
					</td>
				</tr>

				<tr>
					<td colspan="2" align="center"><input type="submit"
						class="btn btn-primary" value="Addding new Employee"></td>
				</tr>

			</table>
		</form>
	</div>
	<%}
		else{
			response.sendRedirect("login.jsp");
		}
		%>
		
		<section class="footer">
	<div class="py-1 bg-dark">
		<p style="text-align:center; color:white">
		 Copyright &copy; 2020 - Employee Management System </p>
	</div>
	</section>
</body>
</html>
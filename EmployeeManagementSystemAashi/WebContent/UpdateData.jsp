<%@page import="com.emp.connection.Connecting"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
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

	try {
		Connection conn = Connecting.getConnection();
		int id = Integer.parseInt(request.getParameter("id"));
		String sql = "select * from employee where id=?";
		PreparedStatement preparestatement = conn.prepareStatement(sql);
		preparestatement.setInt(1, id);
		ResultSet resultSet = preparestatement.executeQuery();
		while (resultSet.next()) {
	%>

	<div class="container">

		<form action="UpdateEmployee" method="post">
			<br> <br>

			<h2 align="center">Update values here.</h2>
			<table class="table table-striped">


				<tr>
					<td>Employee ID</td>
					<td><input type="hidden" name ="id" value="<%=resultSet.getInt(1)%>">
						<%=resultSet.getInt(1) %>
					</td>
				</tr>



				<tr>
					<td scope="col">Employee First Name</td>
					<td scope="col"><input type="text" name="first_name" size="30"
						value="<%=resultSet.getString("first_name")%>" required="required"></td>
				</tr>



				<tr>
					<td scope="col">Employee Last Name</td>
					<td scope="col"><input type="text" name="last_name" size="30"
						value="<%=resultSet.getString("last_name")%>" required="required"></td>
				</tr>



				<tr>
					<td scope="col">Employee Email</td>
					<td scope="col"><input type="email" name="email" size="30"
						value="<%=resultSet.getString("email")%>" required="required"></td>
				</tr>



				<tr>
					<td scope="col">Employee Contact No</td>
					<td scope="col"><input type="number" name="phoneno" size="10" min="6111111111"
						max="9999999999" value="<%=resultSet.getString("phoneno")%>" required="required"></td>
				</tr>



				<tr>
					<td scope="col">Employee Hobbies</td>
					<td>
					<%
						String hobby= (resultSet.getString("hobbies")).trim();
						if(hobby.equals("Writing")){
					%>
					
						<input type="checkbox" name="hobby" value="Writing" checked>
						 <label for="hobby1"> I love writing</label>&nbsp;&nbsp;&nbsp;&nbsp; 
						 <input type="checkbox" name="hobby" value="Reading"> 
						<label for="hobby2"> I love reading</label>&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="checkbox" name="hobby" value="Coding">
						 <label for="hobby3"> I love coding</label>&nbsp;&nbsp;&nbsp;&nbsp; 
						 
					<%
						} else if(hobby.equals("Reading")){
					
					%>
					<input type="checkbox" name="hobby" value="Writing">
						 <label for="hobby1"> I love writing</label>&nbsp;&nbsp;&nbsp;&nbsp; 
						 <input type="checkbox" name="hobby" value="Reading" checked> 
						<label for="hobby2"> I love reading</label>&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="checkbox" name="hobby" value="Coding">
						 <label for="hobby3"> I love coding</label>&nbsp;&nbsp;&nbsp;&nbsp; 
					<%
						} else if(hobby.equals("Coding")){
					
					%>
					
					<input type="checkbox" name="hobby" value="Writing">
						 <label for="hobby1"> I love writing</label>&nbsp;&nbsp;&nbsp;&nbsp; 
						 <input type="checkbox" name="hobby" value="Reading"> 
						<label for="hobby2"> I love reading</label>&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="checkbox" name="hobby" value="Coding" checked>
						 <label for="hobby3"> I love coding</label>&nbsp;&nbsp;&nbsp;&nbsp; 
						 
					<%
					
						} else if(hobby.equals("Writing Coding")){
					
					%>
					<input type="checkbox" name="hobby" value="Writing" checked>
						 <label for="hobby1"> I love writing</label>&nbsp;&nbsp;&nbsp;&nbsp; 
						 <input type="checkbox" name="hobby" value="Reading"> 
						<label for="hobby2"> I love reading</label>&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="checkbox" name="hobby" value="Coding" checked>
						 <label for="hobby3"> I love coding</label>&nbsp;&nbsp;&nbsp;&nbsp; 
						 
					<%
						} else if(hobby.equals("Writing Reading")){
					%>
					
					<input type="checkbox" name="hobby" value="Writing" checked>
						 <label for="hobby1"> I love writing</label>&nbsp;&nbsp;&nbsp;&nbsp; 
						 <input type="checkbox" name="hobby" value="Reading" checked> 
						<label for="hobby2"> I love reading</label>&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="checkbox" name="hobby" value="Coding">
						 <label for="hobby3"> I love coding</label>&nbsp;&nbsp;&nbsp;&nbsp; 
						 
					<%
						} else if(hobby.equals("Reading Coding")){
					%>
					
					<input type="checkbox" name="hobby" value="Writing">
						 <label for="hobby1"> I love writing</label>&nbsp;&nbsp;&nbsp;&nbsp; 
						 <input type="checkbox" name="hobby" value="Reading" checked> 
						<label for="hobby2"> I love reading</label>&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="checkbox" name="hobby" value="Coding" checked>
						 <label for="hobby3"> I love coding</label>&nbsp;&nbsp;&nbsp;&nbsp; 
						
					<%
						} else if(hobby.equals("Writing Reading Coding")){
					%>
					
					<input type="checkbox" name="hobby" value="Writing" checked>
						 <label for="hobby1"> I love writing</label>&nbsp;&nbsp;&nbsp;&nbsp;  
						 <input type="checkbox" name="hobby" value="Reading" checked> 
						<label for="hobby2"> I love reading</label>&nbsp;&nbsp;&nbsp;&nbsp;  
						<input type="checkbox" name="hobby" value="Coding" checked>
						 <label for="hobby3"> I love coding</label>&nbsp;&nbsp;&nbsp;&nbsp; 
						 
					<% } %>
					</td>

				</tr>



				<tr>
					<td>Date of joining</td>
					<td><input type="date" name="dateofjoining"
						value="<%=resultSet.getDate("dateofjoining")%>" required="required"></td>
				</tr>


					
				<tr>
				<td>Gender</td>
					<td>
					<%
						String gender=resultSet.getString("gender");
  						if(gender.equals("male")){		
					%> 
					
						<input type="radio" value="female"
						 name="gender"> Female &nbsp;&nbsp;&nbsp;&nbsp; 
						
						<input type="radio" value="male"
						name="gender" checked="checked"> Male &nbsp;&nbsp;&nbsp;&nbsp; 
						
						<input type="radio" value="transgender"
						 name="gender">Transgender
						 
						 <%
							} 
	  						else if(gender.equals("female")){ 
						 
 						 %> 
						 	
						<input type="radio" value="female" name="gender" checked="checked">
						Female &nbsp;&nbsp;&nbsp;&nbsp; 
						
						<input type="radio" value="male"
						name="gender"> Male &nbsp;&nbsp;&nbsp;&nbsp; 
						
						<input type="radio" value="transgender"
						 name="gender">Transgender
						 
						 <%
  						}else if(gender.equals("transgender")){ 
						 
						 %> 
						 
						 	
						<input type="radio" value="female" name="gender">
						Female &nbsp;&nbsp;&nbsp;&nbsp; 
						
						<input type="radio" value="male" name="gender"> 
						Male &nbsp;&nbsp;&nbsp;&nbsp; 
						
						<input type="radio" value="transgender" name="gender" 
						checked="checked">Transgender
						 
						 <% }else{ %>
						 
						<input type="radio" value="female" name="gender">
						Female &nbsp;&nbsp;&nbsp;&nbsp; 
						
						<input type="radio" value="male" name="gender">
						 Male &nbsp;&nbsp;&nbsp;&nbsp; 
						
						<input type="radio" value="transgender" name="gender">Transgender
						 
						 <% } %>
					</td>
				</tr>



				<tr>
					<td>Interested in Coding</td>
					<td><input type="range" list="tickmarks" name="interest" 
					value="<%=resultSet.getString("interest")%>">

						<datalist id="tickmarks">
							<option value="0">0</option>
							<option value="10">10</option>
							<option value="20">20</option>
							<option value="30">30</option>
							<option value="40">40</option>
							<option value="50">50</option>
							<option value="60">60</option>
							<option value="70">70</option>
							<option value="80">80</option>
							<option value="90">90</option>
							<option value="100">100</option>
						</datalist></td>
				</tr>



				<tr>
					<td colspan="2" align="center"><input type="submit"
						class="btn btn-primary" value="Update"></td>
				</tr>
		
			</table>
		
		</form>
	</div>
	<%
	
		}
		}
	
	catch (Exception e) {
	e.printStackTrace();
	}
	%>
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
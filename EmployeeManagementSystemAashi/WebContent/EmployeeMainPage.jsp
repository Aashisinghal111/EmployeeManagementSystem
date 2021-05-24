<%@page import="com.emp.connection.Connecting"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@include file="BootstrapCSS.jsp"%>
<%@include file="CommonHeader.jsp"%>
<%
String id = request.getParameter("userid");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee Main Page</title>
<link rel="stylesheet" href="style.css">
</head>
<body>

	<br>

	<h3 style="text-align: center">Details of all Employees</h3>

	<div class="container">
		<br>

		<nav class="navbar navbar-light bg-light" style="text-align: center">
			<form class="form-inline" action="SearchName" method="get">
				<input class="form-control mr-sm-2" type="search"
					name="searchingname" placeholder="Search first name" aria-label="Search">
				<button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
			</form>

			<a href="logout" class="btn btn-primary">Logout</a>
		</nav>


		<div style="text-align: center;">
			<table border="1" class="table table-striped">
				<thead>
					<tr>
						<th scope="col">First Name</th>
						<th scope="col">Last Name</th>
						<th scope="col">Email Address</th>
						<th scope="row">Contact Details</th>
						<th scope="row">Hobbies</th>
						<th scope="row">Date of Joining</th>
						<th scope="row">Gender</th>
						<th scope="row">Interest in Coding(%)</th>
						<th scope="col">Edit?</th>
						<th scope="col">Delete?</th>
					</tr>
				</thead>

				<tbody>
					<%
					try {
						Connection conn = Connecting.getConnection();
						Statement statement = conn.createStatement();
						String sql = "select * from employee";
						ResultSet resultSet = statement.executeQuery(sql);
						while (resultSet.next()) {
					%>
					<tr>
						<td><%=resultSet.getString("first_name")%></td>
						<td><%=resultSet.getString("last_name")%></td>
						<td><%=resultSet.getString("email")%></td>
						<td><%=resultSet.getString("phoneno")%></td>
						<td><%=resultSet.getString("hobbies")%></td>
						<td><%=resultSet.getDate("dateofjoining")%></td>
						<td><%=resultSet.getString("gender")%></td>
						<td><%=resultSet.getString("interest")%></td>
						<td>
							<button type="button" class="btn btn-outline-warning">
								<a style="color:inherit; text-decoration: none; !important" href="UpdateData.jsp?id=<%=resultSet.getInt("id")%>">Edit</a>
							</button>
						</td>
						<td>
							<!-- Button trigger modal -->
							<button type="button" class="btn btn-outline-danger"
								data-toggle="modal" data-target="#exampleModal">Delete</button>
							<!-- Modal -->
							<div class="modal fade" id="exampleModal" tabindex="-1"
								role="dialog" aria-labelledby="exampleModalLabel"
								aria-hidden="true">
								<div class="modal-dialog" role="document" style="width:300px;">
									<div class="modal-content">
										<div class="modal-title">
											<h5 class="text-center" >Delete
												Confirmation</h5>
										</div>
										<div class="modal-body">Are you sure to delete this?</div>
										<div class="modal-footer">
										<div class="container my-4 ">
											<button type="button" class="btn btn-outline-warning"
												data-dismiss="modal">Close</button>
											<button type="button" class="btn btn-outline-primary">
												<a style="color:inherit; text-decoration: none; !important"
													href="DeleteEmployee?id=<%=resultSet.getInt("id")%>">Sure,
													Delete</a>
											</button>
										</div>
										</div>
									</div>
								</div>
							</div>




						</td>
					</tr>
					<%
					}

					conn.close();
					}

					catch (Exception e) {
					e.printStackTrace();
					}
					%>

				</tbody>
			</table>

		</div>

		<br> <br>

		<p align="center">
			<input type="button" value="Add New Employee" class="btn btn-primary"
				onClick="window.location.href='InsertData.jsp'; return false;">
		</p>

	</div>
	
	<section class="footer">
	<div class="py-1 bg-dark">
		<p style="text-align:center; color:white">
		 Copyright &copy; 2020 - Employee Management System </p>
	</div>
	</section>
</body>
</html>
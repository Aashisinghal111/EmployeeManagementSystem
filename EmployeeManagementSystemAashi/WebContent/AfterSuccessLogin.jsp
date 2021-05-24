<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="com.emp.connection.Connecting" %>
<%@include file="BootstrapCSS.jsp" %>

<!DOCTYPE html>

<html>
<head>
	<meta charset="ISO-8859-1">
	<title>After Success Login</title>
</head>

<body>
	<%
	
		// fetching values of email and password at runtime
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
	try {
		
		// implementation of singleton design pattern
		Connection conn = Connecting.getConnection();
		
		
		// select query where email address and password is matched 
		// with fetching email address and password
		String query = "Select * from employeeuser where emailaddress=? and password=?";
		
		PreparedStatement ps = conn.prepareStatement(query);
		ps.setString(1, email);
		ps.setString(2, password);
		
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			response.sendRedirect("/EmployeeManagementSystemAashi/EmployeeServlet");
		}
		
		else {

			response.sendRedirect("login.jsp?message=Invalid Login Details");
		}
	}
	
	catch (Exception ex) {
		System.out.println(ex);
	}
	
	
	%>

</body>

</html>
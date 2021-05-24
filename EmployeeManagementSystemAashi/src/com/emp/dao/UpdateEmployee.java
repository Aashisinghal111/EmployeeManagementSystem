/**
 * Created by Aashi 
 * aashisinghal111@gmail.com
 */
package com.emp.dao;

import java.io.IOException;
//import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.emp.connection.Connecting;

@WebServlet("/UpdateEmployee")
public class UpdateEmployee extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// implementation of singleton design pattern
		Connection conn = Connecting.getConnection();

		try {

			// use to print data directly on webpage not on console
			//PrintWriter out = response.getWriter();

			// update sql query in which all the values get fetch dynamically
			String sql = "Update employee set first_name=?, last_name=?, email=?, phoneno=?,"
					+ "hobbies=?, dateofjoining=?, gender=?, interest=? where id=?";

			// to insert values in query at runtime
			PreparedStatement preparestatement = conn.prepareStatement(sql);

			// as our hobby is of output of checkbox so we are taking it in array then
			// we will merge all the array element into one string

			String hobbies[] = request.getParameterValues("hobby");

			// initializing the employeeHobby as null
			String employeeHobby = "";
			if (hobbies != null) {
				for (String hobby : hobbies) {
					employeeHobby += " " + hobby;
				}
			}

			// code to converting util.date to sql.date
			String utilDate = request.getParameter("dateofjoining");
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date date = dateFormat.parse(utilDate);
			String stringDate = dateFormat.format(date);
			java.sql.Date sqlDate = java.sql.Date.valueOf(stringDate);

			// inserting values into update query at runtime
			preparestatement.setString(1, request.getParameter("first_name"));
			preparestatement.setString(2, request.getParameter("last_name"));
			preparestatement.setString(3, request.getParameter("email"));
			preparestatement.setString(4, request.getParameter("phoneno"));
			preparestatement.setString(5, employeeHobby);
			preparestatement.setDate(6, sqlDate);
			preparestatement.setString(7, request.getParameter("gender"));
			preparestatement.setString(8, request.getParameter("interest"));
			preparestatement.setInt(9, Integer.parseInt(request.getParameter("id")));

			// if variable i get positive value that means our sql query is executed
			// successfully
			int i = preparestatement.executeUpdate();

			if (i > 0) {
				response.sendRedirect("EmployeeMainPage.jsp");
			}

			else {
				response.sendRedirect("Error.jsp");
				// out.println("error! data could not be updated ");
			}

		}

		catch (SQLException | ParseException e) {
			response.sendRedirect("Error.jsp");
			e.printStackTrace();
		}

	}

}

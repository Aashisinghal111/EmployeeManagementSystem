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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.emp.connection.Connecting;

public class SaveEmployee extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// implementation of singleton design pattern
		Connection conn = Connecting.getConnection();

		try {

			// use to print data directly on webpage not on console
		//	PrintWriter out = response.getWriter();

			// insert query which gets values dynamically
			String sql = "Insert into employee"
					+ "(first_name,last_name,email,phoneno,hobbies,dateofjoining,gender,interest)"
					+ " values(?,?,?,?,?,?,?,?)";

			// to put values in insert query dynamically
			PreparedStatement preparestatement = conn.prepareStatement(sql);

			String hobbies[] = request.getParameterValues("hobby");

			// initailizing the employeeHobby as null string and when the checkbox
			// get checked, it will concatenate with them and form new string
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

			// inserting values at runtime into query
			preparestatement.setString(1, request.getParameter("first_name"));
			preparestatement.setString(2, request.getParameter("last_name"));
			preparestatement.setString(3, request.getParameter("email"));
			preparestatement.setString(4, request.getParameter("phoneno"));
			preparestatement.setString(5, employeeHobby);
			preparestatement.setDate(6, sqlDate);
			preparestatement.setString(7, request.getParameter("gender"));
			preparestatement.setString(8, request.getParameter("interest"));

			// if this query will execute successfully then the variable i get positive
			// value
			// else this will handle by else part.
			int i = preparestatement.executeUpdate();
			if (i > 0) {
				response.sendRedirect("EmployeeMainPage.jsp");
			}

			else {
				response.sendRedirect("Error.jsp");
				// out.println("error! data is not inserted ");
			}

		}

		// to handle any exception
		catch (SQLException | ParseException e) {
			response.sendRedirect("Error.jsp");
			// e.printStackTrace();
		}

	}

}

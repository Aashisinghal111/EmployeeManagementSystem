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

import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.emp.connection.Connecting;

public class DeleteEmployee extends HttpServlet implements Servlet {

	private static final long serialVersionUID = 1L;

	
	public void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String status = (String)session.getAttribute("status");
		if(status!=null){
			
		// implementation of singleton design pattern
		Connection conn = Connecting.getConnection();
		
		try {
			
			//use to print data directly on webpage not on console
			//PrintWriter out = response.getWriter();
			
			//delete query where employee id gets fetched dynamically 
			String sql = "Delete from employee where id=?";
			
			// to create query at runtime
			PreparedStatement preparestatement = conn.prepareStatement(sql);
			preparestatement.setInt(1, Integer.parseInt(request.getParameter("id")));
			
			
			// if variable i gets positive value that means query will executed successfully
			int i = preparestatement.executeUpdate();
			
			if (i > 0) {
				response.sendRedirect("EmployeeMainPage.jsp");
			} else {
				response.sendRedirect("Error.jsp");
				//out.println("error! data could not be deleted ");
			}
			
		}
		
		catch (SQLException e) {
			response.sendRedirect("Error.jsp");
			e.printStackTrace();
		}
	
	
	}
		else {
			response.sendRedirect("login.jsp");
		}
	
	
	}
}

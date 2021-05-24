/**
 * Created by Aashi 
 * aashisinghal111@gmail.com
 */
package com.emp.dao;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/EmployeeServlet")
public class EmployeeServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response )
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.setAttribute("status", "Session Started");
		response.sendRedirect("EmployeeMainPage.jsp");
	}
	
}

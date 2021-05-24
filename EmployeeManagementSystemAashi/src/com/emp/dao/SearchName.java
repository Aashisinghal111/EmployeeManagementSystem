package com.emp.dao;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.emp.connection.Connecting;

@WebServlet("/SearchName")
public class SearchName extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String nameForSearch = request.getParameter("searchingname");
		// System.out.println(nameForSearch);

		Connection conn = Connecting.getConnection();
		PrintWriter out = response.getWriter();

		try {
			String sql = " Select * from employee where first_name like ?";
			PreparedStatement preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, nameForSearch + "%");

			ResultSet i = preparedStatement.executeQuery();

			// System.out.println(i.first());
			if (i.first()) {
				response.sendRedirect("SearchPage.jsp");
				// System.out.println("select query is working");
			} else {
				response.sendRedirect("Error.jsp");
				out.print("Select query is not working");
			}
		} catch (Exception e) {
			response.sendRedirect("Error.jsp");
			e.printStackTrace();
		}

		// out.print("Successfully running search servlet");
	}

}

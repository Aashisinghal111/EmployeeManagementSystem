/**
 * Created by Aashi 
 * aashisinghal111@gmail.com
 */
package com.emp.connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class Connecting {

	public static Connection getConnection() {
		// initializing the connection as null
		Connection conn = null;
	
		
		try {
			
		// Class.forName is used to load the class dynamically where we
		// doesn’t know the class name before hand. Once the class 
		// is loaded we will use newInstance() method to create the object dynamically.
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			// creating connection with database
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/employeewebtracker", 
					"root", "root");

		}
		
		// if any exception occur, catch block will handle it
		catch (Exception ex) {
			ex.printStackTrace();
		}
		
		
		return conn;
	}
	
}

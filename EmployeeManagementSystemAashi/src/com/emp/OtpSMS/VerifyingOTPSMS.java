package com.emp.OtpSMS;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/VerifyingOTPSMS")
public class VerifyingOTPSMS extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String Otpbyuser = request.getParameter("otp");
		String genOtp = (String)session.getAttribute("sessionOtp");
		
		System.out.println("Otp entered by user "+ Otpbyuser);
	
		if(genOtp.equals(Otpbyuser)) {
			response.sendRedirect("EmployeeMainPage.jsp");
			//System.out.println("Otp is correct");
		}
		else {
			//System.out.println("Otp is incorrect");
			response.sendRedirect("loginwithotp.jsp");
		}
		
	}

}

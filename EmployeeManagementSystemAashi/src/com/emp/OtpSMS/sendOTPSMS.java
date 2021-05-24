package com.emp.OtpSMS;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.SplittableRandom;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class sendOTPSMS extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();

		String userPhoneNumber = request.getParameter("phonenumber");

		System.out.println("Phone number entered by user is " + userPhoneNumber);

		String otpStr = sendOTPSMS.generateOtp(5);
		System.out.println("Generated OTP = " + otpStr);

		sendOTPSMS.sendSMS(otpStr, userPhoneNumber);
		session.setAttribute("sessionOtp", otpStr);

		response.sendRedirect("AfterOtpLogin.jsp");

	}

	public static String generateOtp(int otpLength) {
		SplittableRandom splittableRandom = new SplittableRandom();
		StringBuilder sb = new StringBuilder();

		for (int i = 0; i < otpLength; i++) {
			sb.append(splittableRandom.nextInt(0, 10));
		}

		return sb.toString();

	}

	public static void sendSMS(String otpStr, String PhoneNo) {
		try {

			String apiKey = "apiKey=" + "IRwZ4t5RpXc-uaMFtGu3TQm0kFya38MMlnseno2MZx";
			// + "2KJB7Jd6FxE-qqUWgrQssHJRilmLbtEknXrYjy8xvk";

			String message = "&message="
					+ URLEncoder.encode("Please don't share your OTP(One Time Password) with anyone."
							+ "It is credential information. Your OTP for Login in Employee Management System is "
							+ otpStr, "UTF-8");

			String numbers = "&numbers=" + PhoneNo;

			String apiURL = "https://api.textlocal.in/send/?" + apiKey + message + numbers;

			URL url = new URL(apiURL);
			URLConnection connection = url.openConnection();
			connection.setDoOutput(true);

			BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));

			String line = "";
			StringBuilder sb = new StringBuilder();

			while ((line = reader.readLine()) != null) {
				sb.append(line).append("\n");
			}

			System.out.println(sb.toString());

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
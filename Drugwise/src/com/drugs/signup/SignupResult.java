package com.drugs.signup;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class SignupResult extends HttpServlet{
	public void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException{
		
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
	if (session.getAttribute("User") != null) {
		SignupDao DAO789 = new SignupDao();
		request.setAttribute("SignUpList", DAO789.listOfSingup());
		request.getRequestDispatcher("./jsp/signupResult.jsp").forward(request, response);
		System.out.println("Successfully generate signup result");
		}else{
			out.println("<script>window.open('./index.jsp?status=Your session has been expired please re-login', '_top');</script>");
		}
	}
}
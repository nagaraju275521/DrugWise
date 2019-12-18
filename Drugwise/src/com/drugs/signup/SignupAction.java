package com.drugs.signup;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.drugs.brand.BrandDao;

public class SignupAction extends HttpServlet{
	
	SignupDao DAO786 = new SignupDao();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException{
		
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
	if (session.getAttribute("User") != null) {
	
		if("EditUser".equals(request.getParameter("action"))){
			String email_id = request.getParameter("edit_id");
			request.setAttribute("SignUpList", DAO786.EditResultOfSignup(email_id));
			request.getRequestDispatcher("./jsp/SignUp.jsp").forward(request, response);
		}
	}else{
		out.println("<script>window.open('./index.jsp?status=Your session has been expired please re-login', '_top');</script>");
		}
}
public void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException{
	
		PrintWriter out = response.getWriter();
	if("InsertSignup".equals(request.getParameter("action"))){
			String first_Name  = request.getParameter("First_Name");
			String last_Name = request.getParameter("Last_Name");
			String email = request.getParameter("Email");
			String password = request.getParameter("Password");
			DAO786.insertSignup(first_Name, last_Name, email, password);
			System.out.println("Successfully inserted signup values");
			response.sendRedirect("./jsp/Menu.jsp");
			}
		
		HttpSession session = request.getSession();
	if (session.getAttribute("User") != null) {
		if("EditSignUp".equals(request.getParameter("action"))){
			String firstName  = request.getParameter("First_Name");
			String lastName = request.getParameter("Last_Name");
			String email1 = request.getParameter("Email");
			String password1 = request.getParameter("Password");
			DAO786.editUser(firstName, lastName, email1, password1);
			System.out.println("Successfully edited signup values");
			response.sendRedirect("./signupResult");
			
		}else if("DeleteUser".equals(request.getParameter("action"))){
			String[] email_id = request.getParameterValues("Email_ID");
			DAO786.DeleteUser(email_id);
			System.out.println("Successfully deleted user");
			response.sendRedirect("./signupResult");
		}
	}else{
		out.println("<script>window.open('./index.jsp?status=Your session has been expired please re-login', '_top');</script>");
	}
	}
}
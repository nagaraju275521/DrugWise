package com.drugs.login;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginAction extends HttpServlet{
	public void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException{
		String user_name = request.getParameter("user_name");
		String user_password = request.getParameter("password");
		String user = null;
		String password = null;
		try {
			String sql = "SELECT * FROM signup WHERE Email ='"+user_name+"'";
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn;
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/drug","root","root");
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			System.out.println("we are in login class");
			while(rs.next()){
				
				user = rs.getString("Email");
				password = rs.getString("Password");
				
				}
			
			if(user_name.equals(user) && user_password.equals(password)){
				
				HttpSession session = request.getSession();
				session.setAttribute("User", user);
				//session.setMaxInactiveInterval(120);
				response.sendRedirect("./jsp/Menu.jsp");
				
			}else{
				response.sendRedirect("index.jsp?error=your password or mail wrong");
			}
			
			}catch (SQLException e1) {
				// TODO Auto-generated catch block
			e1.printStackTrace();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
			e.printStackTrace();
			}
	}

}

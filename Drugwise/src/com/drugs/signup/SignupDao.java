package com.drugs.signup;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class SignupDao {
	
public void insertSignup(String first_Name, String last_Name, String email, String password){
	try{
		Class.forName("com.mysql.jdbc.Driver"); 
		Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/drug", "root", "root");
		String sql = "insert into signup values (?,?,?,?)";
			  PreparedStatement pst = con.prepareStatement(sql);
			  pst.setString(1, first_Name);
			  pst.setString(2, last_Name);
			  pst.setString(3, email);
			  pst.setString(4, password);
			  pst.executeUpdate();
		}catch  (Exception e2) {System.out.println("--error :"+e2);  }
	}

public List listOfSingup(){
	ArrayList<Signup> signup_data = new ArrayList<Signup>();
	try {
		String sql = "SELECT * FROM signup";
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn;
			conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/drug", "root", "root");
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()){
			Signup sign = new Signup();
			sign.setFirst_Name(rs.getString("First_Name"));
			sign.setLast_Name(rs.getString("Last_Name"));
			sign.setEmail(rs.getString("Email"));
			sign.setPassword(rs.getString("Password"));
			signup_data.add(sign);
			}
		}catch (SQLException e1) {
			// TODO Auto-generated catch block
		e1.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
		e.printStackTrace();
		}
	return signup_data;
}

public List EditResultOfSignup(String email_id){
	ArrayList<Signup> data = new ArrayList<Signup>();
	try {
		String sql = "SELECT * FROM signup WHERE Email ='"+email_id+"'";
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn;
			conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/drug", "root", "root");
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()){
			Signup signedit = new Signup();
			signedit.setFirst_Name(rs.getString("First_Name"));
			signedit.setLast_Name(rs.getString("Last_Name"));
			signedit.setEmail(rs.getString("Email"));
			signedit.setPassword(rs.getString("Password"));
			data.add(signedit);
			}
		}catch (SQLException e1) {
			// TODO Auto-generated catch block
		e1.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
		e.printStackTrace();
		}
	return data;
}

	public void editUser(String firstName, String lastName, String email1,
			String password1) {
	try{
		Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/drug", "root", "root");
			String sql = "UPDATE signup SET First_Name='" + firstName
					+ "', Last_Name='" + lastName + "', Password='" + password1
					+ "'  WHERE Email='" + email1 + "' ";
		PreparedStatement pstp = con.prepareStatement(sql);
		pstp.executeUpdate();
		}catch  (Exception e2) {System.out.println("--error :"+e2);  }
			
	}

public void DeleteUser(String[] email_id){
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn;
			conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/drug", "root", "root");
		Statement stmt = conn.createStatement();
			for(String s:email_id)
			{
				String qy1 = "delete from signup WHERE Email='"+s+"' ";
				stmt.executeUpdate(qy1);
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

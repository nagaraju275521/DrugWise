package com.drug.contact;

import java.sql.*;
import java.util.*;

public class ContactDao {

	public void insertContact(String brand_ID, String Location_ID,
			String Contact_Name, String Contact_Details) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/drug", "root", "");
			String sql = "insert into contact values (?,?,?,?)";
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, brand_ID);
			pst.setString(2, Location_ID);
			pst.setString(3, Contact_Name);
			pst.setString(4, Contact_Details);
			pst.executeUpdate();
		} catch (Exception e2) {
			System.out.println("--error :" + e2);
		}
	}

	public List resultOfContact() {
		ArrayList<Contact> result = new ArrayList<Contact>();
		try {
			String sql = "SELECT * FROM contact";
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn;
			conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/drug", "root", "");
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Contact drug = new Contact();
				drug.setBrand_ID(rs.getString("Brand_ID"));
				drug.setLocation_ID(rs.getString("Location_ID"));
				drug.setContact_Name(rs.getString("Contact_Name"));
				drug.setContact_Details(rs.getString("Contact_Details"));
				result.add(drug);
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	public void deleteContact(String[] c) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = null;
			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/drug", "root", "");
			Statement stmt = null;
			stmt = con.createStatement();
			for (String s : c) {
				String qy = "delete from contact WHERE location_ID='" + s
						+ "' ";
				stmt.executeUpdate(qy);
				System.out.println("Successfully Deleted contact  with loc id "
						+ s);
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public List resultOfEditContact(String edit_id) {
		ArrayList<Contact> edit_contact = new ArrayList<Contact>();
		try {
			String sql1 = "SELECT * FROM contact WHERE Location_ID='" + edit_id
					+ "'";
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn;
			conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/drug", "root", "");
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql1);
			while (rs.next()) {
				Contact cont = new Contact();
				cont.setBrand_ID(rs.getString("Brand_ID"));
				cont.setLocation_ID(rs.getString("Location_ID"));
				cont.setContact_Name(rs.getString("Contact_Name"));
				cont.setContact_Details(rs.getString("Contact_Details"));
				edit_contact.add(cont);
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return edit_contact;
	}

	public void editContact(String location_ID, String brand_ID,
			String contact_Name, String contact_Details) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/drug", "root", "");
			String sql = "UPDATE contact SET Brand_ID='" + brand_ID
					+ "',  Contact_Name='" + contact_Name
					+ "', Contact_Details='" + contact_Details
					+ "'  WHERE Location_ID='" + location_ID + "' ";
			PreparedStatement pstp = con.prepareStatement(sql);
			pstp.executeUpdate();
		} catch (Exception e2) {
			System.out.println("--error :" + e2);
		}
	}
}

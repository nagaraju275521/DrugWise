package com.drugs.location;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class LocationDao {
	
public List ResultOFlocation(){
	ArrayList<Location> data = new ArrayList<Location>();
	try {
		String sql = "SELECT * FROM location ORDER BY Location_ID";
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn;
			conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/drug", "root", "root");
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()){
			Location loc = new Location();
			loc.setLocation_ID(rs.getString("Location_ID"));
			loc.setName(rs.getString("Name"));
			loc.setActive(rs.getInt("Active"));
			data.add(loc);
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
	
public void DeleteLocation(String[] id){
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn;
			conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/drug", "root", "root");
		Statement stmt = conn.createStatement();
		for(String s:id)
		{
			String qy1 = "DELETE FROM location WHERE Location_ID='"+s+"' ";
			String contactDelete = "DELETE FROM contact WHERE Location_ID='"+s+"'";
			stmt.executeUpdate(qy1);
				System.out.println("Successfully Deleted location  with loc id "+s);
			stmt.executeUpdate(contactDelete);
				System.out.println("Successfully Deleted from contact  with loc id "+s);
		}
		}catch (SQLException e1) {
			// TODO Auto-generated catch block
		e1.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
		e.printStackTrace();
		}
	}

public List EditResult(String location_id){
	ArrayList<Location> data = new ArrayList<Location>();
	try {
		String sql = "SELECT * FROM location WHERE Location_ID ='"+location_id+"'";
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn;
			conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/drug", "root", "root");
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()){
			Location loc = new Location();
			loc.setLocation_ID(rs.getString("Location_ID"));
			loc.setName(rs.getString("Name"));
			loc.setActive(rs.getInt("Active"));
			data.add(loc);
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

public void editLocation(String location_id, String location_name, int active){
	try{
		Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/drug", "root", "root");
		 String sql = "UPDATE location SET Name='" + location_name
					+ "',  Active='" + active + "'  WHERE Location_ID='"
					+ location_id + "' ";
		 PreparedStatement pstp = con.prepareStatement(sql);
		 pstp.executeUpdate();
		}catch  (Exception e2) {System.out.println("--error :"+e2);  }
	}

public void insertLocation(String location_id, String location_name, int active){
	try{
		Class.forName("com.mysql.jdbc.Driver"); 
		Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/drug", "root", "root");
		String sql = "insert into location values (?,?,?)";
		  PreparedStatement pst = con.prepareStatement(sql);
		  pst.setString(1, location_id);
		  pst.setString(2, location_name);
		  pst.setInt(3, active);
		  pst.executeUpdate();
		}catch  (Exception e2) {System.out.println("--error :"+e2);  }
	}
}

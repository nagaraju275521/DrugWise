package com.drugs.brand;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BrandDao {
	
public void insertBrand(String brand_ID, String brand_Name){
	try{
		Class.forName("com.mysql.jdbc.Driver"); 
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/drug","root","");
		Statement stmt = null;
		stmt = con.createStatement();
		String sql = "insert into brand values (?,?)";
		  PreparedStatement pst = con.prepareStatement(sql);
		  pst.setString(1, brand_ID);
		  pst.setString(2, brand_Name);
		  pst.executeUpdate();
		}catch  (Exception e2) {System.out.println("--error :"+e2);  }
	}

public List listOfBrand(){
	ArrayList<Brand> brand_data = new ArrayList<Brand>();
	try {
		String sql = "SELECT * FROM brand ORDER BY Brand_ID";
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn;
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/drug","root","");
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()){
			Brand brand = new Brand();
			brand.setBrand_ID(rs.getString("Brand_ID"));
			brand.setBrand_Name(rs.getString("Brand_Name"));
			brand_data.add(brand);
			}
		}catch (SQLException e1) {
			// TODO Auto-generated catch block
		e1.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
		e.printStackTrace();
		}
	return brand_data;
}

public void deleteBrand(String[] id){
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn;
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/drug","root","");
		Statement stmt = conn.createStatement();
			for(String s:id)
			{
				String qy1 = "DELETE FROM brand WHERE Brand_ID="+s;
				stmt.executeUpdate(qy1);
				System.out.println("Successfully Deleted brand:"+s);
		
				String brandDrug = "DELETE FROM drug_brand WHERE Brand_ID="+s;
				stmt.executeUpdate(brandDrug);
				System.out.println("Successfully Deleted brand  from drug_brand:"+s);
		
				String brandContact = "DELETE FROM contact WHERE Brand_ID="+s;
				stmt.executeUpdate(brandContact);
				System.out.println("Successfully Deleted brand  from contact:"+s);
			}
		}catch (SQLException e1) {
			// TODO Auto-generated catch block
		e1.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
		e.printStackTrace();
		}
}

public List Editbrand(String brand_id){
	ArrayList<Brand> data = new ArrayList<Brand>();
	try {
		String sql = "SELECT * FROM brand WHERE Brand_ID ='"+brand_id+"'";
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn;
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/drug","root","");
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()){
			Brand brd = new Brand();
			brd.setBrand_ID(rs.getString("Brand_ID"));
			brd.setBrand_Name(rs.getString("Brand_Name"));
			data.add(brd);
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

public void editBrand(String brand_ID, String brand_Name){
	try{
		Class.forName("com.mysql.jdbc.Driver"); 
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/drug","root","");
		String sql = "UPDATE brand SET Brand_Name='"+brand_Name+"'  WHERE Brand_ID='"+brand_ID+"' ";
		PreparedStatement pstp = con.prepareStatement(sql);
		pstp.executeUpdate();
		System.out.println("Edit record of brand");
		}catch  (Exception e2) {System.out.println("--error :"+e2);  }
	}
}

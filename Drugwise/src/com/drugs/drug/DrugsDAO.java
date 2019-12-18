package com.drugs.drug;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.drugs.brand.Brand;

public class DrugsDAO {
	
public List resultOfDrugs(){
ArrayList<Drugs> result = new ArrayList<Drugs>();
	try {
		String sql = "SELECT * FROM drugs ORDER BY Drug_ID";
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn;
			conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/drug", "root", "");
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()){
			Drugs drug = new Drugs();
			drug.setDrug_ID(rs.getString("Drug_ID"));
			drug.setDrug_Name(rs.getString("Drug_name"));
			drug.setPharmacological_Class(rs.getString("Pharmacological_Class"));
			drug.setMechanismOFAction(rs.getString("MechanismOFAction"));
			drug.setUses(rs.getString("Uses"));
			drug.setDosage(rs.getString("Dosage"));
			drug.setAdverse_Effects(rs.getString("Adverse_Effects"));
			drug.setContra_Indication(rs.getString("Contra_Indication"));
			drug.setDrug_Interaction(rs.getString("Drug_Interaction"));
			drug.setPrecaution(rs.getString("Precaution"));
			drug.setPharmaCare_Information(rs.getString("PharmaCare_Information"));
			result.add(drug);
			}
		}catch (SQLException e1) {
			// TODO Auto-generated catch block
		e1.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
		e.printStackTrace();
		}
	return result;
}

public void insertDrugsData(String Drug_ID, String Drug_name, 
		String Pharmacological_Class, String MechanismOFAction, String Uses, 
		String Dosage, String Adverse_Effects, String Contra_Indication, 
		String Drug_Interaction, String Precaution, 
		String PharmaCare_Information, String[] Drug_Brand){
	try{
		String id  = Drug_ID;
		Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/drug", "root", "");
		String sql = "insert into drugs values (?,?,?,?,?,?,?,?,?,?,?)";
		  PreparedStatement pst = con.prepareStatement(sql);
		  pst.setString(1, Drug_ID);
		  pst.setString(2, Drug_name);
		  pst.setString(3, Pharmacological_Class);
		  pst.setString(4, MechanismOFAction);
		  pst.setString(5, Uses);
		  pst.setString(6, Dosage);
		  pst.setString(7, Adverse_Effects);
		  pst.setString(8, Contra_Indication);
		  pst.setString(9, Drug_Interaction);
		  pst.setString(10, Precaution);
		  pst.setString(11, PharmaCare_Information);
		  pst.executeUpdate();
		  for(String s:Drug_Brand)
			{
			  String sql1 = "insert into drug_brand values (?,?)";
			  PreparedStatement pstArray = con.prepareStatement(sql1);
			  pstArray.setString(1, id);
			  pstArray.setString(2, s);
			  pstArray.executeUpdate();
			}
		 System.out.println("Multy brands insert in drug_brand");
		}catch  (Exception e2) {System.out.println("--error :"+e2);  }
	}

public void deleteDrugs(String[] c){
	try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = null;
	con = DriverManager.getConnection(
			"jdbc:mysql://localhost:3306/drug", "root", "");
	Statement stmt = null;
	stmt = con.createStatement();
		for(String s:c)
			{
			String qy = "delete from drugs WHERE Drug_ID='"+s+"' ";
			stmt.executeUpdate(qy);
			System.out.println("Successfully Deleted");
			}
		for(String s:c){
			String sqlqy = "DELETE FROM drug_brand WHERE Drug_ID='"+s+"'";
			stmt.executeUpdate(sqlqy);
			System.out.println("Successfully Deleted brand id from drug_brand table");
			}
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
	e.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
	e.printStackTrace();
	}
}

public List resultOfEditDrug(String edit_id){
	ArrayList<Drugs> edit_result = new ArrayList<Drugs>();
	try {
		String sql1 = "SELECT * FROM drugs WHERE Drug_ID='"+edit_id+"'";
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn;
			conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/drug", "root", "");
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql1);
		while(rs.next()){
			Drugs drug = new Drugs();
			drug.setDrug_ID(rs.getString("Drug_ID"));
			drug.setDrug_Name(rs.getString("Drug_name"));
			drug.setPharmacological_Class(rs.getString("Pharmacological_Class"));
			drug.setMechanismOFAction(rs.getString("MechanismOFAction"));
			drug.setUses(rs.getString("Uses"));
			drug.setDosage(rs.getString("Dosage"));
			drug.setAdverse_Effects(rs.getString("Adverse_Effects"));
			drug.setContra_Indication(rs.getString("Contra_Indication"));
			drug.setDrug_Interaction(rs.getString("Drug_Interaction"));
			drug.setPrecaution(rs.getString("Precaution"));
			drug.setPharmaCare_Information(rs.getString("PharmaCare_Information"));
			edit_result.add(drug);
			}
		}catch (SQLException e1) {
			// TODO Auto-generated catch block
		e1.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
		e.printStackTrace();
		}
	return edit_result;
}

public void editDrug(String drug_ID, String drug_name,
			String pharmacological_Class, String mechanismOFAction,
			String uses, String dosage, String adverse_Effects,
			String contra_Indication, String drug_Interaction,
			String precaution, String pharmaCare_Information,
			String[] drugbrand_ID) {
	try{
		Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/drug", "root", "");
		Statement stmt = null;
		stmt = con.createStatement();
			String sql = "UPDATE drugs SET Drug_name='" + drug_name
					+ "', Pharmacological_Class='" + pharmacological_Class
					+ "', MechanismOFAction='" + mechanismOFAction
					+ "', Uses='" + uses + "', Dosage='" + dosage
					+ "', Adverse_Effects='" + adverse_Effects
					+ "', Contra_Indication='" + contra_Indication
					+ "', Drug_Interaction='" + drug_Interaction
					+ "', Precaution='" + precaution
					+ "', PharmaCare_Information='" + pharmaCare_Information
					+ "'  WHERE Drug_ID='" + drug_ID + "' ";
		PreparedStatement pstp = con.prepareStatement(sql);
		pstp.executeUpdate();
		String sql12 = "DELETE FROM drug_brand  WHERE Drug_ID="+drug_ID;
		stmt.executeUpdate(sql12);
		String sqlmulty = "insert into drug_brand values (?,?)";
		for(String s:drugbrand_ID){
			PreparedStatement pstmulty = con.prepareStatement(sqlmulty);
			  pstmulty.setString(1, drug_ID);
			  pstmulty.setString(2, s);
			  pstmulty.executeUpdate();
			}
		}catch  (Exception e2) {System.out.println("--error :"+e2);  }
}
	
public List resultOfMultyDrugs(){
	ArrayList<Brand> Multyresult = new ArrayList<Brand>();
	try {
		String sql = "SELECT * FROM brand";
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn;
			conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/drug", "root", "");
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()){
			Brand bran = new Brand();
			bran.setBrand_ID(rs.getString("Brand_ID"));
			bran.setBrand_Name(rs.getString("Brand_Name"));
			Multyresult.add(bran);
			}
		}catch (SQLException e1) {
			// TODO Auto-generated catch block
		e1.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
		e.printStackTrace();
		}
	return Multyresult;
}

public List resultOfEditDrugMulty(){
	ArrayList<DrugMulty> result_multy = new ArrayList<DrugMulty>();
	try {
		String sql2 = "SELECT * FROM brand";
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn;
			conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/drug", "root", "");
		Statement stmt = conn.createStatement();
		ResultSet rss = stmt.executeQuery(sql2);
		while(rss.next()){
			DrugMulty drugMulty = new DrugMulty();
			drugMulty.setBrand_ID(rss.getString("Brand_ID"));
			drugMulty.setBrand_Name(rss.getString("Brand_name"));
			result_multy.add(drugMulty);
			}
		}catch (SQLException e1) {
			// TODO Auto-generated catch block
		e1.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
		e.printStackTrace();
		}
	return result_multy;
}

public List resultOfExistDrugBrand(String edit_id){
	ArrayList<DrugMulty> exist = new ArrayList<DrugMulty>();
	try {
		String sql = "SELECT * FROM drug_brand WHERE Drug_ID="+edit_id;
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn;
			conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/drug", "root", "");
		Statement stmt = conn.createStatement();
		ResultSet rst = stmt.executeQuery(sql);
		while(rst.next()){
			DrugMulty Edrug = new  DrugMulty();
			//Edrug.setDrug_ID(rst.getString("Drug_ID"));
			Edrug.setBrand_ID(rst.getString("Brand_ID"));
			exist.add(Edrug);
			}
		}catch (SQLException e1) {
			// TODO Auto-generated catch block
		e1.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
		e.printStackTrace();
		}
	return exist;
}
}

package com.drugs.drug;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class DrugsResult extends HttpServlet{
	
		DrugsDAO DAO123 = new DrugsDAO();
		
	public void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException{
	
	PrintWriter out = response.getWriter();
	HttpSession session = request.getSession();
	if (session.getAttribute("User") != null) {
		
	String edit_id = request.getParameter("edit_id");
	if("editDrugs".equals(request.getParameter("action"))){
		request.setAttribute("editDrug", DAO123.resultOfEditDrug(edit_id));		//This object holds the drugs table row content for edit
		request.setAttribute("resultOfMulty", DAO123.resultOfEditDrugMulty());				//This object holds dropdown list of drugbrand table content
		request.setAttribute("existMulty", DAO123.resultOfExistDrugBrand(edit_id));
		request.getRequestDispatcher("./jsp/EnterDrugData.jsp").forward(request, response);
			
	}else if("moreDrugs".equals(request.getParameter("action"))){
		
		request.setAttribute("resultBrand", DAO123.resultOfMultyDrugs());
		request.setAttribute("existBrand", DAO123.resultOfExistDrugBrand(request.getParameter("more_id")));
		request.setAttribute("resultOfMoreDrug", DAO123.resultOfEditDrug(request.getParameter("more_id")));
		request.getRequestDispatcher("./jsp/drugsMore.jsp").forward(request, response);
		
	}else{
			request.setAttribute("resultOfDrug", DAO123.resultOfDrugs());
			System.out.println("Successfully generate drugs result");
			request.getRequestDispatcher("./jsp/drugs.jsp").forward(request, response);
		}
	}else{
		out.println("<script>window.open('./index.jsp?status=Your session has been expired please re-login', '_top');</script>");
	}
	}
	
public void doPost(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException{
	
PrintWriter out = response.getWriter();
HttpSession session = request.getSession();
if (session.getAttribute("User") != null) {
	String action = request.getParameter("action");
	if("InsertData".equals(action)){
		String Drug_ID = request.getParameter("Drug_ID");
		String Drug_name = request.getParameter("Drug_Name");
		String[] Drug_Brand = request.getParameterValues("Drug_Brand");
		String Pharmacological_Class = request.getParameter("Pharmacological_Class");
		String MechanismOFAction = request.getParameter("MechanismOFAction");
		String Uses = request.getParameter("Uses");
		String Dosage = request.getParameter("Dosage");
		String Adverse_Effects = request.getParameter("Adverse_Effects");
		String Contra_Indication = request.getParameter("Contra_Indication");
		String Drug_Interaction = request.getParameter("Drug_Interaction");
		String Precaution = request.getParameter("Precaution");
		String PharmaCare_Information = request.getParameter("PharmaCare_Information");
		DAO123.insertDrugsData(Drug_ID, Drug_name, Pharmacological_Class,
					MechanismOFAction, Uses, Dosage, Adverse_Effects,
					Contra_Indication, Drug_Interaction, Precaution,
					PharmaCare_Information, Drug_Brand);
		System.out.println("Successfully insert drugs data");
		response.sendRedirect("./jsp/Menu.jsp");
			
	}else if("DeleteDrug".equals(action)){
		String c[] = request.getParameterValues("drugID");
		DAO123.deleteDrugs(c);
		System.out.println("Successfully delete drugs row data");
		response.sendRedirect("./jsp/Menu.jsp");
			
	}else if("Edit_Drug".equals(action)){
		String drug_ID = request.getParameter("Drug_ID");
		String drug_name = request.getParameter("Drug_Name");
		String[] drug_brand_ID = request.getParameterValues("Drug_Brand");
		String pharmacological_Class = request.getParameter("Pharmacological_Class");
		String mechanismOFAction = request.getParameter("MechanismOFAction");
		String uses = request.getParameter("Uses");
		String dosage = request.getParameter("Dosage");
		String adverse_Effects = request.getParameter("Adverse_Effects");
		String contra_Indication = request.getParameter("Contra_Indication");
		String drug_Interaction = request.getParameter("Drug_Interaction");
		String precaution = request.getParameter("Precaution");
		String pharmaCare_Information = request.getParameter("PharmaCare_Information");
			DAO123.editDrug(drug_ID, drug_name, pharmacological_Class,
					mechanismOFAction, uses, dosage, adverse_Effects,
					contra_Indication, drug_Interaction, precaution,
					pharmaCare_Information, drug_brand_ID);
		System.out.println("Successfully drugs data updated");
		response.sendRedirect("./jsp/Menu.jsp");
		}
	}else{
		out.println("<script>window.open('./index.jsp?status=Your session has been expired please re-login', '_top');</script>");
		}
	}
}

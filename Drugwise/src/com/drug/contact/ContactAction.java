package com.drug.contact;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class ContactAction extends HttpServlet{
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException{
	
		PrintWriter out = response.getWriter();	
		ContactDao DAO143 = new ContactDao();
HttpSession session = request.getSession();
if (session.getAttribute("User") != null) {
	
	if("InsertContact".equals(request.getParameter("action"))){
		String brand_ID  = request.getParameter("Brand_ID");
		String Location_ID  = request.getParameter("Location_ID");
		String Contact_Name = request.getParameter("Contact_Name");
		String Contact_Details = request.getParameter("Contact_Details");
		DAO143.insertContact(brand_ID, Location_ID, Contact_Name, Contact_Details);
		System.out.println("Successfully inserted contact values");
		response.sendRedirect("./openContact?action=OpenResult");
			
	}else if("DeleteContact".equals(request.getParameter("action"))){
		String[] location_ID = request.getParameterValues("location_ID");
		DAO143.deleteContact(location_ID);
		System.out.println("Successfully deleted contacts");
		response.sendRedirect("./openContact?action=OpenResult");
			
	}else if("EditContact".equals(request.getParameter("action"))){
		String location_ID  = request.getParameter("Location_ID");
		String brand_ID  = request.getParameter("Brand_ID");
		String contact_Name = request.getParameter("Contact_Name");
		String contact_Details = request.getParameter("Contact_Details");
		DAO143.editContact(location_ID, brand_ID, contact_Name, contact_Details);
		System.out.println("Successfully update contact values");
		response.sendRedirect("./openContact?action=OpenResult");
		}
	}else{
		out.println("<script>window.open('./index.jsp?status=Your session has been expired please re-login', '_top');</script>");
		}
	}
}

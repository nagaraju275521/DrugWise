package com.drug.contact;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import com.drugs.brand.BrandDao;
import com.drugs.drug.DrugsDAO;
import com.drugs.location.LocationDao;

public class OpenContact extends HttpServlet{
	public void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException{
		
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
if (session.getAttribute("User") != null) {
	
		ContactDao DAO1223 = new ContactDao();
		BrandDao DAOBrand = new BrandDao();
		LocationDao DAOLocation = new LocationDao();
		DrugsDAO DAO = new DrugsDAO();
			
	if("OpenResult".equals(request.getParameter("action"))){
		request.setAttribute("BrandList", DAOBrand.listOfBrand());
		request.setAttribute("LocationList", DAOLocation.ResultOFlocation());
		request.setAttribute("contactList", DAO1223.resultOfContact());
		System.out.println("Successfully generate contact result");
		request.getRequestDispatcher("./jsp/contactResult.jsp").forward(request, response);
			
	}else if("editContacts".equals(request.getParameter("action"))){
		request.setAttribute("resultOfMultyloc", DAOLocation.ResultOFlocation());
		request.setAttribute("resultOfMultybrand", DAOBrand.listOfBrand());
		request.setAttribute("contact", DAO1223.resultOfEditContact(request.getParameter("edit_id")));
		System.out.println("geting result of multy contact :");
		request.getRequestDispatcher("./jsp/contact.jsp").forward(request, response);
	}else{
		request.setAttribute("resultOfMultybrand", DAO.resultOfMultyDrugs());
		request.setAttribute("resultOfMultyloc", DAOLocation.ResultOFlocation());
		System.out.println("geting result of multy contact  location:");
		request.getRequestDispatcher("./jsp/contact.jsp").forward(request, response);
		}
	}else{
		out.println("<script>window.open('./index.jsp?status=Your session has been expired please re-login', '_top');</script>");
	}
	}
}
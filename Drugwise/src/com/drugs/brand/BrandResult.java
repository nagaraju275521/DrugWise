package com.drugs.brand;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class BrandResult extends HttpServlet{
	
	BrandDao DAO = new BrandDao();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException{
		request.setAttribute("BrandList", DAO.listOfBrand());
		System.out.println("Successfully generate brand result");
		request.getRequestDispatcher("./jsp/brandResult.jsp").forward(request, response);
	}
}

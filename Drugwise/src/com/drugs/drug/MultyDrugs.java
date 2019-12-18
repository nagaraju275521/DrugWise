package com.drugs.drug;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class MultyDrugs extends HttpServlet{
	public void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException{
		DrugsDAO Dao123 = new DrugsDAO();
		request.setAttribute("resultOfMulty", Dao123.resultOfMultyDrugs());
		System.out.println("geting result of multy");
		request.getRequestDispatcher("./jsp/EnterDrugData.jsp").forward(request, response);
	}
}
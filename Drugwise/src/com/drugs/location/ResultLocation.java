package com.drugs.location;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.*;


public class ResultLocation extends HttpServlet{
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException{
		
		LocationDao dao123 = new LocationDao();
		request.setAttribute("location", dao123.ResultOFlocation());
		request.getRequestDispatcher("./jsp/LocationResult.jsp").forward(request, response);
	}
}

package com.drugs.location;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LocationAction extends HttpServlet{
	
	LocationDao DAO = new LocationDao();

public void doGet(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException{
	
	PrintWriter out = response.getWriter();
	HttpSession session = request.getSession();
	if (session.getAttribute("User") != null) {
		
		if("editRESULT".equals(request.getParameter("action"))){
			String location_id = request.getParameter("id");
			request.setAttribute("result", DAO.EditResult(location_id));
			request.getRequestDispatcher("./jsp/Location.jsp").forward(request, response);
			System.out.println("Successfully get edit result");
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
	
	if("InsertDATA".equals(request.getParameter("action"))){			// Here using code for insert data into location table.
		String location_id = request.getParameter("Location_ID");  
		String location_name = request.getParameter("Location_Name");  
		String active1 = request.getParameter("ACTIVE");
		int active = Integer.parseInt(active1);
		DAO.insertLocation(location_id, location_name, active);
		System.out.println("Successfully inserted location data");
		response.sendRedirect("./resultLocation");
			
	}else if("editDATA".equals(request.getParameter("action"))){		//Here using code for edit location table data.
		String location_id = request.getParameter("Location_ID");  
		String location_name = request.getParameter("Location_Name");  
		String active1 = request.getParameter("ACTIVE");
		int active = Integer.parseInt(active1);
		DAO.editLocation(location_id, location_name, active);
		System.out.println("Successfully edited location data");
		response.sendRedirect("./resultLocation");
			    
	}else if("DeleteLocation".equals(request.getParameter("action"))){		//Here using code for delete location table row data.
		String[] id = request.getParameterValues("location_ID");
		DAO.DeleteLocation(id);
		System.out.println("Successfully delete locarion");
		response.sendRedirect("./resultLocation");
		}
	}else{
		out.println("<script>window.open('./index.jsp?status=Your session has been expired please re-login', '_top');</script>");
	}
}
}

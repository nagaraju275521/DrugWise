package com.drugs.excel;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ExcelAction extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, FileNotFoundException {
		
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		if (session.getAttribute("User") != null) {
			ExcelDao DAOEx = new ExcelDao();
			DAOEx.uploadExcelFile(request);
			response.sendRedirect("./jsp/Menu.jsp");
			} else {
			out.println("<script>window.open('./index.jsp?status=Your session has been expired please re-login', '_top');</script>");
		}
	}
}

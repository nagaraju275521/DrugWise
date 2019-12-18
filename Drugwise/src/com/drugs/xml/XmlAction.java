package com.drugs.xml;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class XmlAction extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		if (session.getAttribute("User") != null) {
			XmlDao DAOXML = new XmlDao();
			if ("ExportXml".equals(request.getParameter("action"))) {
				DAOXML.exportXmlFile();
				response.sendRedirect("./drugsResult");
			}
		} else {
			//response.sendRedirect("./drugsResult");
			out.println("<script>window.open('./index.jsp?status=Your session has been expired please re-login', '_top');</script>");
		}
	}

}

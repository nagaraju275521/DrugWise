package com.drugs.brand;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class BrandAction extends HttpServlet {

	BrandDao DAO12 = new BrandDao();

public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	PrintWriter out = response.getWriter();
	HttpSession session = request.getSession();
	if (session.getAttribute("User") != null) {
			
		if ("EditRESULT".equals(request.getParameter("action"))) {
			String id = request.getParameter("edit_id");
			request.setAttribute("BrandEditList", DAO12.Editbrand(id));
			System.out.println("generate brand edit data");
			request.getRequestDispatcher("./jsp/brand.jsp").forward(request,
					response);
			}
		}else{
		out.println("<script>window.open('./index.jsp?status=your session has been expired please re-login', '_top');</script>");
		}
	}

public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		if (session.getAttribute("User") != null) {

			if ("InsertBrand".equals(request.getParameter("action"))) {
				String brand_ID = request.getParameter("Brand_ID");
				String brand_Name = request.getParameter("Brand_Name");
				DAO12.insertBrand(brand_ID, brand_Name);
				System.out.println("Successfully inserted brand values");
				response.sendRedirect("./brandResult");

			} else if ("DeleteBrand".equals(request.getParameter("action"))) {
				String[] id = request.getParameterValues("Brand_ID");
				DAO12.deleteBrand(id);
				System.out.println("Successfully  deleted brand row");
				response.sendRedirect("./brandResult");

			} else if ("EditBrand".equals(request.getParameter("action"))) {
				String brand_ID = request.getParameter("Brand_ID");
				String brand_Name = request.getParameter("Brand_Name");
				DAO12.editBrand(brand_ID, brand_Name);
				System.out.println("Successfully  edited  brand row data");
				response.sendRedirect("./brandResult");
			}
		} else {

			out.println("<script>window.open('./index.jsp?status=your session has been expired please re-login', '_top');</script>");
		}
	}
}

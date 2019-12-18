<%@page import="com.drugs.brand.Brand"%>
<%@page import="java.util.List"%>
<%@page import="com.drug.contact.Contact"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.drugs.location.Location"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>contact</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script
	src="http://ajax.microsoft.com/ajax/jquery.validate/1.7/jquery.validate.js"
	type="text/javascript"></script>
<script type="text/javascript" src="./js/jquery.sumoselect.js"></script>
<link rel="stylesheet" href="./css/sumoselect.css" />
<link rel="stylesheet" href="./css/pageStyle.css" />
<script type="text/javascript">
	(function($, W, D) {
		var JQUERY4U = {};
		JQUERY4U.UTIL = {
			setupFormValidation : function() {
				//form validation rules
				$("#register-form")
						.validate(
								{
									errorPlacement : function(error, element) {
										element.parent().append(error).css({
											"color" : "red",
											"margin-top" : "10px"
										});
									},
									rules : {
										Location_ID : "required",
										Brand_ID : "required",
										Contact_Name : "required",
										Contact_Details : "required",

									},
									messages : {
										Location_ID : "Please select  location id",
										Brand_ID : "Please select brand id",
										Contact_Name : "Please enter contact name",
										Contact_Details : "Please enter contact details",
									},
									submitHandler : function(form) {

										if (confirm('Are you sure you want to submit this data ?')) {
											form.submit();
										}
									}
								});
			}
		}

		//when the dom has loaded setup form validation rules
		$(D).ready(function($) {
			JQUERY4U.UTIL.setupFormValidation();
		});

	})(jQuery, window, document);
</script>
<script type="text/javascript">
	$(document).ready(function() {
		window.asd = $('.SlectBox').SumoSelect({
			csvDispCount : 3
		});
		window.test = $('.testsel').SumoSelect({
			okCancelInMulti : true
		});
		window.testSelAll = $('.testSelAll').SumoSelect({
			okCancelInMulti : true,
			selectAll : true
		});
		window.testSelAll2 = $('.testSelAll2').SumoSelect({
			selectAll : true
		});
	});
</script>
<script type="text/javascript">
	function sendback() {
		window.open("./openContact?action=OpenResult", "_self");
	}
	function sessionOut() {
		window.open("./index.jsp?status=Your session has been expired please re-login",
				"_top");
	}
</script>
</head>
<body>
	<%
		response.setHeader("Cache-Control", "no-cache");
			response.setHeader("Cache-Control", "no-store");
			response.setHeader("Pragma", "no-cache");
			response.setDateHeader("Expires", 0);

			String User = (String) session.getAttribute("User");
			if (session.getAttribute("User") != null) {
	%>
	<center>
		<c:forEach items="${contact}" var="list" varStatus="status">
			<c:set var="name" value="${list.contact_Name}" />
			<c:set var="details" value="${list.contact_Details}"></c:set>
			<c:set var="editID" value="${list.location_ID}"></c:set>
			<c:set var="brandID" value="${list.brand_ID}"></c:set>
		</c:forEach>
		<%
			String action = "InsertContact";
			String Backpath = "sendback()";
			String title = "Contact Details";
			String Details, Name, editid = null;
			if (pageContext.getAttribute("name") != null) {
				Name = (String) pageContext.getAttribute("name");
				Details = (String) pageContext.getAttribute("details");
				editid = (String) pageContext.getAttribute("editID");
				action = "EditContact";
				Backpath = "sendbackTwo()";
				title = "Update Contact";
			} else {
				Details = " ";
				Name = " ";
			}
		%>
		<form action="./contactAction" method="post" id="register-form"
			novalidate="novalidate">

			<h2><%=title%></h2>
			<table border="0">
				<tr>
					<th>Location Id</th>
					<td>
						<div class="select">
							<select name="Location_ID" class="SlectBox">
								<%
									if (pageContext.getAttribute("name") == null) {
								%>
								<option value="" selected>None</option>
								<c:forEach items="${resultOfMultyloc}" var="mlist">
									<option value="${mlist.location_ID}">${mlist.name}</option>
								</c:forEach>
								<%
									} else {
																ArrayList<Location> biglist = (ArrayList<Location>) request.getAttribute("resultOfMultyloc");
																ArrayList<Contact> list = (ArrayList<Contact>) request.getAttribute("contact");
																List<String> li = new ArrayList();
																for (Contact l : list) {
																	li.add(l.getLocation_ID());
																}
																out.println(li);
																for (Location s : biglist) {
																	if (li.contains(s.getLocation_ID())) {
								%>
								<option value="<%=s.getLocation_ID()%>" selected><%=s.getName()%></option>
								<%
									}
																}
															}
								%>
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<th>Brand Id</th>
					<td>
						<div class="select">
							<select name="Brand_ID" class="SlectBox">
								<%
									if (pageContext.getAttribute("name") == null) {
								%>
								<option value="" selected>None</option>
								<c:forEach items="${resultOfMultybrand}" var="brand">
									<option value="${brand.brand_ID}">${brand.brand_Name}</option>
								</c:forEach>
								<%
									} else {
																ArrayList<Brand> brandList = (ArrayList<Brand>) request.getAttribute("resultOfMultybrand");
																ArrayList<Contact> contactBrand = (ArrayList<Contact>) request.getAttribute("contact");
																List<String> brandID_list = new ArrayList();
																for (Contact l : contactBrand) {
																	brandID_list.add(l.getBrand_ID());
																}
																out.println(brandID_list);
																for (Brand s : brandList) {
																	if (brandID_list.contains(s.getBrand_ID())) {
								%>
								<option value="<%=s.getBrand_ID()%>" selected><%=s.getBrand_Name()%></option>
								<%
									} else {
								%>
								<option value="<%=s.getBrand_ID()%>"><%=s.getBrand_Name()%></option>
								<%
									}
																}
															}
								%>
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<th>Contact Name</th>
					<td>
						<div class="aaa">
							<input type="text" name="Contact_Name" value="<%=Name%>" />
						</div>
					</td>
				</tr>
				<tr>
					<th>Details</th>
					<td>
						<div class="aaa">

							<textarea name="Contact_Details" rows="5" cols="30"><%=Details%></textarea>
						</div>
					</td>
				</tr>

				<tr>
					<th></th>
					<td>
						<button type="submit" value="<%=action%>" name="action"
							class="submit">Save</button>&nbsp;
						<button type="button" onclick="return sendback();">Cancel</button>
					</td>
				</tr>
			</table>
		</form>
	</center>
	<%
		} else {
	%>
	<script>
		sessionOut();
	</script>
	<%
		}
	%>
</body>
</html>
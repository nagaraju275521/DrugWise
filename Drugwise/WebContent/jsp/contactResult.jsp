<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/tableStyles.css">
<script type="text/javascript">
	function Checkboxchek() {
		var count = 0;
		for ( var i = 0; i < admin.location_ID.length; i++) {
			if (admin.location_ID[i].checked) {
				count++;
			}
		}
		if (count == 0) {
			alert("please select checkbox");
			//document.msgchbox.checkbox.focus();
			return false;
		} else {
			alert(count + ": rows selected for delete");
			return true;
		}
	}
	function sessionOut() {
		window.open("../index.jsp?status=Session timeout please login again", "_top");
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
	<a href="./openContact"><div class="addButton">Add</div></a>
	<center>
		<h2>Contact Details</h2>
		<form action="./contactAction" method="post" name="admin"
			target="_self">
			<table border="1" class="TFtable">
				<tr>
					<th style="border-right-style: hidden;"></th>
					<th style="border-right-style: hidden;">Location</th>
					<th style="border-right-style: hidden;">Brand Name</th>
					<th style="border-right-style: hidden;">Contact Name</th>
					<th>Details</th>
				</tr>
				<c:forEach items="${contactList}" var="list">
					<tr>
						<td style="border-right-style: hidden;"><input
							type="checkbox" name="location_ID" value="${list.location_ID}"
							style="width: 20px;" /></td>
						<c:forEach items="${LocationList}" var="b">
							<c:if test="${b.location_ID eq list.location_ID}">
								<td style="border-right-style: hidden;"><a
									href="./openContact?action=editContacts&edit_id=${list.location_ID}">${b.name}</a>
								</td>
							</c:if>
						</c:forEach>
						<c:forEach items="${BrandList}" var="b">
							<c:if test="${b.brand_ID eq list.brand_ID}">
								<td style="border-right-style: hidden;">${b.brand_Name}</td>
							</c:if>
						</c:forEach>
						<td style="border-right-style: hidden;">${list.contact_Name}</td>
						<td>${list.contact_Details}</td>
					</tr>
				</c:forEach>
			</table>
			<button type="submit" name="action" value="DeleteContact"
				onclick="return Checkboxchek()" class="deleteButton">Delete</button>
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
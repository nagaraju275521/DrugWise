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
		for ( var i = 0; i < admin.Brand_ID.length; i++) {
			if (admin.Brand_ID[i].checked) {
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
		window.open("./index.jsp?status=Your session has been expired please re-login", "_top");
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
	<a href="./jsp/brand.jsp"><div class="addButton">Add</div></a>
	<center>
		<form action="./brandAction" method="post" name="admin" target="_self">
			<h2>Brand Details</h2>
			<table border="1" class="TFtable">
				<tr>
					<th style="border-right-style: hidden;"></th>
					<th style="border-right-style: hidden;">Brand Id</th>
					<th>Brand Name</th>
				</tr>
				<c:forEach items="${BrandList}" var="list">
					<tr>
						<td style="border-right-style: hidden;"><input
							type="checkbox" name="Brand_ID" value="${list.brand_ID}" /></td>
						<td style="border-right-style: hidden;"><a
							href="./brandAction?action=EditRESULT&edit_id=${list.brand_ID}">${list.brand_ID}</a></td>
						<td>${list.brand_Name}</td>
					</tr>
				</c:forEach>
			</table>
			<button type="submit" name="action" value="DeleteBrand"
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
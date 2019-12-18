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
		for ( var i = 0; i < admin.Email_ID.length; i++) {
			if (admin.Email_ID[i].checked) {
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
	<center>
		<form action="./signupAction" method="post" name="admin"
			target="_self">
			<h2>User Details</h2>
			<table border="1" class="TFtable">
				<tr>
					<th style="border-right-style: hidden;"></th>
					<th style="border-right-style: hidden;">First name</th>
					<th style="border-right-style: hidden;">Last name</th>
					<th style="border-right-style: hidden;">email</th>
					<th>password</th>
				</tr>
				<c:forEach items="${SignUpList}" var="list">
					<tr>
						<td style="border-right-style: hidden;"><input
							type="checkbox" name="Email_ID" value="${list.email}"
							style="width: 20px;" /></td>
						<td style="border-right-style: hidden;">${list.first_Name}</td>
						<td style="border-right-style: hidden;">${list.last_Name}</td>
						<td style="border-right-style: hidden;"><a
							href="./signupAction?action=EditUser&edit_id=${list.email}">${list.email}</a></td>
						<td>${list.password}</td>
					</tr>
				</c:forEach>
			</table>
			<button type="submit" name="action" value="DeleteUser"
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
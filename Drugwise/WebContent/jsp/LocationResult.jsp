<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Drugs location</title>
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
		window.open("./index.jsp?status=Your session has been expired please re-login", "_top");
	}
</script>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
<script type="text/javascript" src="./js/paging.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#tableData').paging({
			limit : 7
		});
	});
</script>
<script type="text/javascript">
	var _gaq = _gaq || [];
	_gaq.push([ '_setAccount', 'UA-36251023-1' ]);
	_gaq.push([ '_setDomainName', 'jqueryscript.net' ]);
	_gaq.push([ '_trackPageview' ]);

	(function() {
		var ga = document.createElement('script');
		ga.type = 'text/javascript';
		ga.async = true;
		ga.src = ('https:' == document.location.protocol ? 'https://ssl'
				: 'http://www')
				+ '.google-analytics.com/ga.js';
		var s = document.getElementsByTagName('script')[0];
		s.parentNode.insertBefore(ga, s);
	})();
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
	<a href="./jsp/Location.jsp"><div class="addButton">Add</div></a>
	<center>
		<h2>Location Details</h2>
		<form action="./locationAction" method="post" name="admin"
			target="_self">
			<table border="1" id="tableData" class="TFtable">
				<thead>
					<tr>
						<th style="border-right-style: hidden;"></th>
						<th style="border-right-style: hidden;">Location Id</th>
						<th style="border-right-style: hidden;">Name</th>
						<th>Active</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${location}" var="list">
						<tr>
							<td style="border-right-style: hidden;"><input
								type="checkbox" name="location_ID" value="${list.location_ID}"
								style="width: 20px;" /></td>
							<td style="border-right-style: hidden;"><a
								href="./locationAction?action=editRESULT&id=${list.location_ID}">${list.location_ID}</a></td>
							<td style="border-right-style: hidden;">${list.name}</td>
							<td style="text-align: center;"><c:if
									test="${list.active eq '1'}">
									<div style="color: green;">Active</div>
								</c:if> <c:if test="${list.active eq '0' }">Pause</c:if></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<button type="submit" name="action" value="DeleteLocation"
				onclick="return Checkboxchek();" class="deleteButton">Delete</button>
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
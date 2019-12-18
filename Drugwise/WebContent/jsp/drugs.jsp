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
		for ( var i = 0; i < admin.drugID.length; i++) {
			if (admin.drugID[i].checked) {
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
	<a href="./multydrugs"><div class="addButton">Add</div></a>
	<center>
		<h2>Drug Details</h2>
		<form action="./drugsResult" method="post" name="admin"
			target="_parent">
			<table border="1" id="tableData" class="TFtable">
				<thead>
					<tr>
						<th></th>
						<th>Drug Id</th>
						<th>Drug Name</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${resultOfDrug}" var="list">
						<tr>
							<td><input type="checkbox" name="drugID"
								value="${list.drug_ID}" /></td>
							<td><a
								href="./drugsResult?action=editDrugs&edit_id=${list.drug_ID}">${list.drug_ID}</a>
							</td>
							<td><a
								href="./drugsResult?action=moreDrugs&more_id=${list.drug_ID}">${list.drug_Name}</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<button type="submit" name="action" value="DeleteDrug"
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
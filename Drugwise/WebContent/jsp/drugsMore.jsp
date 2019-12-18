<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/drugMoreStyles.css">
<script type="text/javascript">
	function sessionOut() {
		window.open("./index.jsp?status=Session timeout please login again", "_top");
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
		<h2>Drug Information</h2>
		<table border="0" class="TFMoretable">
			<c:forEach items="${resultOfMoreDrug}" var="list">
				<tr>
					<td><table border="0">
							<tr>
								<th>Drug Id</th>
								<td>${list.drug_ID}</td>
								<th>Drug Name</th>
								<td>${list.drug_Name}</td>
							</tr>
						</table></td>
				</tr>
				<tr>
					<th>Drug brand</th>
				</tr>
				<tr>
					<td><c:forEach items="${resultBrand}" var="R">
							<c:forEach items="${existBrand}" var="E">
								<c:if test="${E.brand_ID eq R.brand_ID}">
					${R.brand_Name}, 
				</c:if>
							</c:forEach>

						</c:forEach></td>
				</tr>
				<tr>
					<th>Pharmacological Class</th>
				</tr>
				<tr>
					<td>${list.pharmacological_Class}</td>
				</tr>
				<tr>
					<th>Mechanism Of Action</th>
				</tr>
				<tr>
					<td>${list.mechanismOFAction}</td>
				</tr>
				<tr>
					<th>Uses</th>
				</tr>
				<tr>
					<td>${list.uses}</td>
				</tr>
				<tr>
					<th>Dosage</th>
				</tr>
				<tr>
					<td>${list.dosage}</td>
				</tr>
				<tr>
					<th>Adverse Effects</th>
				</tr>
				<tr>
					<td>${list.adverse_Effects}</td>
				</tr>
				<tr>
					<th>Contra Indication</th>
				</tr>
				<tr>
					<td>${list.contra_Indication}</td>
				</tr>
				<tr>
					<th>Drug Interaction</th>
				</tr>
				<tr>
					<td>${list.drug_Interaction}</td>
				</tr>
				<tr>
					<th>Precaution</th>
				</tr>
				<tr>
					<td>${list.precaution}</td>
				</tr>
				<tr>
					<th>PharmaCare Information</th>
				</tr>
				<tr>
					<td>${list.pharmaCare_Information}</td>
				</tr>
			</c:forEach>
		</table>
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
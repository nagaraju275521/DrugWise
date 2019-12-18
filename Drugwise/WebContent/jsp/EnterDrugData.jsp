<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="com.drugs.drug.Drugs"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.drugs.drug.DrugMulty"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Drugwise</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="./js/jquery.validate.min.js"></script>
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
										element.parent().append(error);
									},
									rules : {
										Drug_ID : "required",
										Drug_Name : "required",
										Drug_Brand : "required",
										Pharmacological_Class : "required",
										MechanismOFAction : "required",
										Uses : "required",
										Dosage : "required",
										Adverse_Effects : "required",
										Contra_Indication : "required",
										Drug_Interaction : "required",
										Precaution : "required",
										PharmaCare_Information : "required",
									},
									messages : {
										Drug_ID : "Please enter  drug id",
										Drug_Name : "Please enter drug name",
										Drug_Brand : "Please select drug brand",
										Pharmacological_Class : "Please enter  Pharmacological Class",
										MechanismOFAction : "Please enter  Mechanism Of Action",
										Uses : "Please enter  uses",
										Dosage : "Please enter  dosage",
										Adverse_Effects : "Please enter  Adverse Effects",
										Contra_Indication : "Please enter  Contra Indication",
										Drug_Interaction : "Please enter  Drug Interaction",
										Precaution : "Please enter  Precaution",
										PharmaCare_Information : "Please enter PharmaCare Information",
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
<script>
	function sendback() {
		window.open("./drugsResult", "_self");
	}
	function sessionOut() {
		window.open("./index.jsp?status=Your session has been expired please re-login",
				"_top");
	}
</script>
<style type="text/css">
input {
	margin-bottom: 10px;
}

textarea {
	margin-bottom: 10px;
}

#register-form {
	width: 950px;
}
</style>
</head>
<body topmargin="5px">
	<%
		response.setHeader("Cache-Control", "no-cache");
			response.setHeader("Cache-Control", "no-store");
			response.setHeader("Pragma", "no-cache");
			response.setDateHeader("Expires", 0);

			String User = (String) session.getAttribute("User");
			if (session.getAttribute("User") != null) {
	%>
	<center>
		<c:forEach items="${editDrug}" var="list" varStatus="status">
			<c:set var="drug_ID" value="${list.drug_ID }" />
			<c:set var="drug_Name" value="${list.drug_Name}" />
			<c:set var="pharmacological_Class"
				value="${list.pharmacological_Class}" />
			<c:set var="mechanismOFAction" value="${list.mechanismOFAction}" />
			<c:set var="uses" value="${list.uses}" />
			<c:set var="dosage" value="${list.dosage}" />
			<c:set var="adverse_Effects" value="${list.adverse_Effects}" />
			<c:set var="contra_Indication" value="${list.contra_Indication}" />
			<c:set var="drug_Interaction" value="${list.drug_Interaction}" />
			<c:set var="precaution" value="${list.precaution}" />
			<c:set var="pharmaCare_Information"
				value="${list.pharmaCare_Information}" />
		</c:forEach>
		<%
			String Path = "./drugsResult";
			String Value = "InsertData";
			String Read = " ";
			String title = "Drug Details";
			String drugid, name, phrma, mechan, uses, dosage, adver, contra, drug, prec, care;
			if (pageContext.getAttribute("drug_ID") != null) {
				drugid = (String) pageContext.getAttribute("drug_ID");
				name = (String) pageContext.getAttribute("drug_Name");
				phrma = (String) pageContext
						.getAttribute("pharmacological_Class");
				mechan = (String) pageContext.getAttribute("mechanismOFAction");
				uses = (String) pageContext.getAttribute("uses");
				dosage = (String) pageContext.getAttribute("dosage");
				adver = (String) pageContext.getAttribute("adverse_Effects");
				contra = (String) pageContext.getAttribute("contra_Indication");
				drug = (String) pageContext.getAttribute("drug_Interaction");
				prec = (String) pageContext.getAttribute("precaution");
				care = (String) pageContext
						.getAttribute("pharmaCare_Information");
				Path = "./drugsResult";
				Value = "Edit_Drug";
				Read = "readonly";
				title = "Update Drug Details";
			} else {
				drugid = " ";
				name = " ";
				phrma = " ";
				mechan = " ";
				uses = " ";
				dosage = " ";
				adver = " ";
				contra = " ";
				drug = " ";
				prec = " ";
				care = " ";
			}
		%>
		<form action="<%=Path%>" method="post" target="_parent"
			id="register-form" novalidate="novalidate">
			<h2><%=title%></h2>
			<table border="0">
				<tr>
					<th>Drug Id</th>
					<td><div class="aaa">
							<input type="text" name="Drug_ID" value="<%=drugid%>" <%=Read%>>
						</div></td>

					<th>Drug Name</th>
					<td><div class="aaa">
							<input type="text" name="Drug_Name" value="<%=name%>">
						</div></td>
				</tr>
				<tr>
					<th>Select brand</th>
					<td>
						<%
							if (pageContext.getAttribute("drug_ID") != null) {
						%>
						<div class="select">
							<select name="Drug_Brand" multiple="multiple" class="testSelAll">
								<%
									ArrayList<DrugMulty> biglist = (ArrayList<DrugMulty>) request.getAttribute("resultOfMulty");
															ArrayList<DrugMulty> tinylist = (ArrayList<DrugMulty>) request.getAttribute("existMulty");
																Map<String, String> map = new HashMap<String, String>();
																Map<String, String> map2 = new HashMap<String, String>();
																for (DrugMulty ti : tinylist) {
																	map2.put(ti.getBrand_ID(), ti.getBrand_Name());
																}
																for (DrugMulty b : biglist) {
																	if (map2.containsKey(b.getBrand_ID())) {
								%><option value="<%=b.getBrand_ID()%>" selected><%=b.getBrand_Name()%></option>
								<%
									} else {
								%>
								<option value="<%=b.getBrand_ID()%>"><%=b.getBrand_Name()%></option>
								<%
									}
																}
								%>
							</select>
						</div> <%
 	} else {
 %>
						<div class="select">
							<select name="Drug_Brand" multiple="multiple" class="testSelAll">
								<c:forEach items="${resultOfMulty}" var="list">
									<option value="${list.brand_ID}">${list.brand_Name}</option>
								</c:forEach>
							</select>
						</div> <%
 	}
 %>
					</td>
				</tr>
				<tr>
					<th>Pharmacological Class</th>
					<td><div class="aaa">
							<textarea name="Pharmacological_Class" rows="3" cols="30"><%=phrma%></textarea>
						</div></td>
					<th>Mechanism Of Action</th>
					<td><div class="aaa">
							<textarea name="MechanismOFAction" rows="3" cols="30"><%=mechan%></textarea>
						</div></td>
				</tr>
				<tr>
					<th>Uses</th>
					<td><div class="aaa">
							<textarea name="Uses" rows="3" cols="30"><%=uses%></textarea>
						</div></td>

					<th>Dosage</th>
					<td><div class="aaa">
							<textarea name="Dosage" rows="3" cols="30"><%=dosage%></textarea>
						</div></td>
				</tr>
				<tr>
					<th>Adverse Effects</th>
					<td><div class="aaa">
							<textarea name="Adverse_Effects" rows="3" cols="30"><%=adver%></textarea>
						</div></td>

					<th>Contra Indication</th>
					<td><div class="aaa">
							<textarea name="Contra_Indication" rows="3" cols="30"><%=contra%></textarea>
						</div></td>
				</tr>
				<tr>
					<th>Drug Interaction</th>
					<td><div class="aaa">
							<textarea name="Drug_Interaction" rows="3" cols="30"><%=drug%></textarea>
						</div></td>

					<th>Precaution</th>
					<td><div class="aaa">
							<textarea name="Precaution" rows="3" cols="30"><%=prec%></textarea>
						</div></td>
				</tr>
				<tr>
					<th>PharmaCare Information</th>
					<td><div class="aaa">
							<textarea name="PharmaCare_Information" rows="3" cols="30"><%=care%></textarea>
						</div></td>
				</tr>

				<tr>
					<th></th>
					<td><button type="submit" name="action" value="<%=Value%>">Save</button>&nbsp;
						<button type="button" onclick="return sendback()">Cancel</button></td>
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
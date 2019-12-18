
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>DrugWise</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.validate.min.js"></script>
<link rel="stylesheet" href="css/indexStyle.css" />
<script type="text/javascript">
	(function($, W, D) {
		var JQUERY4U = {};

		JQUERY4U.UTIL = {
			setupFormValidation : function() {
				//form validation rules
				$("#register-form").validate({
					rules : {

						user_name : {
							required : true,
							email : true
						},
						password : {
							required : true,

						},

					},
					messages : {
						user_name : "Please enter a valid email address",
						password : "Please enter password",
					},
					submitHandler : function(form) {
						form.submit();
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


</head>
<body>
	<div id="Header">
		<table>
			<tr>
				<td><img src="image/DavisDrug.png" height="90px" /></td>
				<td></td>

			</tr>
		</table>


	</div>
	<%
		String status = request.getParameter("status");
		String Error = request.getParameter("error");
	%>
	<center>
		<form action="./loginAction" method="post" id="register-form"
			novalidate="novalidate">
			<h3>User Login</h3>
			<table>
				<tr>
					<th>User Name:</th>
					<td>
						<div class="aaa">
							<input type="text" name="user_name">
						</div>
					</td>
				</tr>

				<tr>
					<th>Password:</th>
					<td>
						<div class="aaa">
							<input type="password" name="password">
						</div>
					</td>
				</tr>

				<tr>
					<td></td>
					<td><button type="submit">Login</button></td>
				</tr>
			</table>
			<br>
			<%
				if (status != null) {
			%><h4 style="color: red;"><%=status%></h4>
			<%
				}
			%>
			<%
				if (Error != null) {
			%><h4 style="color: red;"><%=Error%></h4>
			<%
				}
			%>
			<a href="jsp/SignUp.jsp">SignUp Here</a>
		</form>
	</center>
	<div id="Footer">
		<center>
			<p>Copyright ©2015 VIVO Professional Services All Rights Reserved</p>
		</center>
	</div>
</html>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>signup here</title>
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script
	src="http://jqueryvalidation.org/files/dist/jquery.validate.min.js"></script>
<link rel="stylesheet" href="../css/indexStyle.css" />
<link rel="stylesheet" href="./css/pageStyle.css" />
<script type="text/javascript">

(function($,W,D)
{
    var JQUERY4U = {};

    JQUERY4U.UTIL =
    {
        setupFormValidation: function()
        {
            //form validation rules
            $("#register-form").validate({
                rules: {
                	First_Name: "required",
                	Last_Name: "required",
				 	Email: {
                        required: true,
                        email: true
                    },
                    Password: {
                        required: true,
                        minlength: 5
                    },
                    Con_Password: {
                    	
                    	required: true,
                    	equalTo: "#Password"
					},
                },
                messages: {
                	First_Name: "Please enter  first name name",
                	Last_Name: "Please enter second name",
                	Con_Password:{
                       
                		 required: "Please provide a  confirm password",
                        equalTo: "Please re enter the same password again"
                    },
                    Password: {
                        required: "Please provide a password",
                        minlength: "Your password must be at least 5 characters long"
                    },
                    Email: "Please enter a valid email address",
                },
                submitHandler: function(form) {
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
function sendback(){
	window.open("../index.jsp","_self");
	}
function sendbackTwo(){
	window.open("./signupResult","_self");
	}
</script>
</head>
<body>
	<c:forEach items="${SignUpList}" var="list" varStatus="status">
		<c:set var="first_name" value="${list.first_Name}" />
		<c:set var="last_name" value="${list.last_Name}"></c:set>
		<c:set var="email" value="${list.email}"></c:set>
		<c:set var="password" value="${list.password}"></c:set>
	</c:forEach>
	<%
		if (pageContext.getAttribute("email") == null) {
	%>
	<div id="Header">
		<table>
			<tr>
				<td><img src="../image/DavisDrug.png" height="90px" /></td>
				<td></td>
			</tr>
		</table>
	</div>
	<%
		}
	%>
	<center>

		<%
			String action = "InsertSignup";
			String Backpath = "sendback()";
			String path = "../signupAction";
			String title = "User Registration";
			String f_Name, l_name, e_mail, p_word;
			if (pageContext.getAttribute("email") != null) {

				f_Name = (String) pageContext.getAttribute("first_name");
				l_name = (String) pageContext.getAttribute("last_name");
				e_mail = (String) pageContext.getAttribute("email");
				p_word = (String) pageContext.getAttribute("password");
				action = "EditSignUp";
				Backpath = "sendbackTwo()";
				path = "./signupAction";
				title ="Update user";
			} else {

				f_Name = "";
				l_name = "";
				e_mail = "";
				p_word = "";

			}
		%>
		<form action="<%=path%>" method="post" id="register-form"
			novalidate="novalidate">
			<h2><%=title%></h2>
			<table>
				<tr>
					<th>First Name</th>
					<td><div class="aaa">
							<input type="text" name="First_Name" value="<%=f_Name%>">
						</div></td>
				</tr>
				<tr>
					<th>Last Name</th>
					<td><div class="aaa">
							<input type="text" name="Last_Name" value="<%=l_name%>">
						</div></td>
				</tr>
				<tr>
					<th>Email</th>
					<td><div class="aaa">
							<input type="text" name="Email" value="<%=e_mail%>">
						</div></td>
				</tr>
				<tr>
					<th>Password</th>
					<td>
						<div class="aaa">
							<input type="password" name="Password" id="Password"
								value="<%=p_word%>">
						</div>
					</td>
				</tr>
				<tr>
					<th>Con Password</th>
					<td>
						<div class="aaa">
							<input type="password" name="Con_Password" id="Con_Password">
						</div>
					</td>
				</tr>
				<tr>
					<th></th>

					<td>
						<button type="submit" value="<%=action%>" name="action"
							class="submit">Submit</button>&nbsp;
						<button type="button" onclick="return <%=Backpath%>;">cancel</button>
					</td>
				</tr>
			</table>
			<%
				if (pageContext.getAttribute("email") == null) {
			%>
			<p>
				Already registered? <a href="../index.jsp">Sign in</a>
			</p>
			<%
				}
			%>
		</form>
	</center>
	<%
		if (pageContext.getAttribute("email") == null) {
	%>
	<div id="Footer">
		<center>
			<p>Copyright ©2015 VIVO Professional Services All Rights Reserved</p>
		</center>
	</div>
	<%
		}
	%>
</body>
</html>
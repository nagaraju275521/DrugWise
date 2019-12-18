<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="./js/jquery.validate.min.js"></script>
<script type="text/javascript" src="./js/jquery.sumoselect.js"></script>
<link rel="stylesheet" href="./css/sumoselect.css" />
<link rel="stylesheet" href="./css/pageStyle.css" />
<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
<script type="text/javascript" src="../js/jquery.sumoselect.js"></script>
<link rel="stylesheet" href="../css/sumoselect.css" />
<link rel="stylesheet" href="../css/pageStyle.css" />
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
                	Location_ID: "required",
                	Location_Name: "required",
                	ACTIVE:	"required",
				},
                messages: {
                	Location_ID: "Please enter  location id",
                	Location_Name: "Please enter location name",
                	ACTIVE:	"Please select location name",
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
	window.open("../resultLocation","_self");
	}
function sendbackTwo(){
	window.open("./resultLocation","_self");
	}
function sessionOut() {
	window.open("../index.jsp?status=Your session has been expired please re-login", "_top");
}
</script>
<script type="text/javascript">
        $(document).ready(function () {
            window.asd = $('.SlectBox').SumoSelect({ csvDispCount: 3 });
            window.test = $('.testsel').SumoSelect({okCancelInMulti:true });
            window.testSelAll = $('.testSelAll').SumoSelect({okCancelInMulti:true, selectAll:true });
            window.testSelAll2 = $('.testSelAll2').SumoSelect({selectAll:true });
        });
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
		<c:forEach items="${result}" var="list" varStatus="status">
			<c:set var="Name" value="${list.name}" />
			<c:set var="Location" value="${list.location_ID }"></c:set>
		</c:forEach>

		<%
			String path = "../locationAction";
				String action = "InsertDATA";
				String function = "sendback()";
				String Read = " ";
				String loca, name;
				String title = "Location Details";
				if (pageContext.getAttribute("Location") != null) {

					loca = (String) pageContext.getAttribute("Location");
					name = (String) pageContext.getAttribute("Name");
					path = "./locationAction";
					action = "editDATA";
					function = "sendbackTwo()";
					Read = "readonly";
					title = "Update Location";
				} else {

					loca = " ";
					name = " ";

				}
		%>
		<form action="<%=path%>" method="post" name="myForm"
			onsubmit="return validate()" id="register-form"
			novalidate="novalidate">
			<h2><%=title%></h2>
			<table border="0">
				<tr>
					<th>location Id</th>
					<td>
						<div class="aaa">
							<input type="text" name="Location_ID" value="<%=loca%>" <%=Read%>>
						</div>
					</td>
				</tr>
				<tr>
					<th>Name</th>
					<td>
						<div class="aaa">
							<input type="text" name="Location_Name" value="<%=name%>" />
						</div>
					</td>
				</tr>
				<tr>
					<th>Active</th>
					<td>
						<div class="select">
							<select name="ACTIVE" class="SlectBox">
								<option value="1">Active</option>
								<option value="0">Pause</option>
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<td></td>
					<td><button type="submit" name="action" value="<%=action%>">Save</button>&nbsp;
						<button type="button" onclick="return <%=function%>">Cancel</button></td>
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
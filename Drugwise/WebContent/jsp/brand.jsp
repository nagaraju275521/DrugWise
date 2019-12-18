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
                	Brand_ID: "required",
                	Brand_Name: "required",
				},
                messages: {
                	Brand_ID: "Please enter  brand id",
                	Brand_Name: "Please enter brand name",
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
	window.open("../brandResult","_self");
	}
function sendbackTwo(){
	window.open("./brandResult","_self");
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
		<c:forEach items="${BrandEditList}" var="list" varStatus="status">
			<c:set var="id" value="${list.brand_ID}" />
			<c:set var="name" value="${list.brand_Name}"></c:set>
		</c:forEach>
		<%
			String path = "../brandAction";
				String action = "InsertBrand";
				String Backpath = "sendback()";
				String Read = " ";
				String Id, Name;
				String title = "Brand Details";
				if (pageContext.getAttribute("id") != null) {

					Id = (String) pageContext.getAttribute("id");
					Name = (String) pageContext.getAttribute("name");
					path = "./brandAction";
					action = "EditBrand";
					Backpath = "sendbackTwo()";
					Read = "readonly";
					title = "Update Brand";
				} else {

					Id = " ";
					Name = " ";

				}
		%>
		<form action="<%=path%>" method="post" id="register-form"
			novalidate="novalidate">
			<h2><%=title%></h2>
			<table border="0">
				<tr>
					<th>Brand Id</th>
					<td>
						<div class="aaa">
							<input type="text" name="Brand_ID" value="<%=Id%>" <%=Read%>>
						</div>
					</td>
				</tr>
				<tr>
					<th>Name</th>
					<td>
						<div class="aaa">
							<input type="text" name="Brand_Name" value="<%=Name%>" />
						</div>
					</td>
				</tr>
				<tr>
					<td></td>
					<td><button type="submit" name="action" value="<%=action%>">Save</button>&nbsp;
						<button type="button" onclick="return <%=Backpath%>">Cancel</button></td>
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
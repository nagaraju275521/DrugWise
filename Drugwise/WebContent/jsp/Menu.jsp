<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Drugwise</title>
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/uploadPopUp.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('a.login-window').click(function() {

			// Getting the variable's value from a link 
			var loginBox = $(this).attr('href');

			//Fade in the Popup and add close button
			$(loginBox).fadeIn(300);

			//Set the center alignment padding + border
			var popMargTop = ($(loginBox).height() + 24) / 2;
			var popMargLeft = ($(loginBox).width() + 24) / 2;

			$(loginBox).css({
				'margin-top' : -popMargTop,
				'margin-left' : -popMargLeft
			});

			// Add the mask to body
			$('body').append('<div id="mask"></div>');
			$('#mask').fadeIn(300);

			return false;
		});

		// When clicking on the button close or the mask layer the popup closed
		$('a.close, #mask').live('click', function() {
			$('#mask , .login-popup').fadeOut(300, function() {
				$('#mask').remove();
			});
			return false;
		});
	});

	function callId(clicked) {

		var ID = clicked.id;
		alert(clicked.id);

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
	<div id="Header">
		<table
			style="width: 300px; height: 98px; margin-left: 100px; border: 0px solid red;">
			<tr>
				<td><img src="../image/DavisDrug.png" height="96px" /></td>
				<td></td>
			</tr>
		</table>
	</div>
	<iframe src="../drugsResult" name="menu" class="menuFrame"
		scrolling="auto"> </iframe>
	<nav style="position:absolute;right:20px;top:66px;">
	<ul class="nav">
		<li><a href="../drugsResult" class="icon home" target="menu"><span>Home</span></a></li>
		<li><a href="../drugsResult" target="menu">Drug</a></li>
		<li><a href="../brandResult" target="menu">Brand</a></li>
		<li><a href="../openContact?action=OpenResult" target="menu">Contact</a></li>
		<li><a href="../resultLocation" target="menu">Locaton</a></li>
		<li class="dropdown"><a href="#">Export</a>
			<ul class="large">
				<li><a href="../exportXml?action=ExportXml" target="menu">Export
						XML</a></li>
				<li><a href="#login-box" class="login-window" target="menu">Import
						Excel</a></li>
			</ul></li>
		<li><a href="logout.jsp">LogOut</a></li>
	</ul>
	</nav>
	<div style="position: absolute; top: 10px; right: 40px;">
		<h4 style="color: black;">
			Hi
			<%=User%>
			| <a href="../signupResult" target="menu">Settings</a>
		</h4>
	</div>
	<div id="login-box" class="login-popup">
		<div class="modal-header">
			<h5>Upload Xls File</h5>
		</div>
		<a href="" class="close"><img src="../image/close_pop.png"
			class="btn_close" title="Close Window" alt="Close" /></a>
		<div class="fform">
			<form method="post" action="../excelAction"
				enctype="multipart/form-data">
				<h4>User Upload file</h4>
				<input name="file" type="file" /> <br> <br>
				<div class="footerSub">
					<button class="button">Submit</button>
				</div>
			</form>
		</div>
	</div>
	<div id="Footer">
		<center>
			<p>Copyright ©2015 VIVO Professional Services All Rights Reserved</p>
		</center>
	</div>
<%
		}else {
			response.sendRedirect("../index.jsp?status=Your session has been expired please re-login");
		}
%>
</body>
</html>
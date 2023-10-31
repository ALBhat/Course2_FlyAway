<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Page</title>
</head>
<body >
<center>
	<h2>Admin Login</h2>
	<%
		String message=(String)session.getAttribute("message");
		if(message!=null){
	%>
	<p style="color:red;text-align:center"><%=message %></p>
	<%
			session.setAttribute("message", null);
		}
	%>
	<div style="border:3px solid black;width:25%;border-radius:20px;padding:20px" align="center">
	<form action=AdminLogin method=post>
		<label for=email>Email :-</label> <input type="email" name=email id=email /><br><br>
		<label for=pass>Password :-</label> <input type="password" name=password id=pass /><br><br>
		<input type=submit value=Submit /> <input type=reset />
	</form>
	</div>
	<a href=ForgotPassword.jsp style="font-size:25;color:red;">Forgot Password</a><br><br>
	<a href=index.jsp style="color:red;font-size:25;">Go Back to Home Page</a>
</center>
</body>
</html>
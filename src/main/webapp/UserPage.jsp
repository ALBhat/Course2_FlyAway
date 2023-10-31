<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Login Page</title>
</head>
<body >
	<center>
		<h2>User Login</h2>
		<%
			String message=(String)session.getAttribute("message");
			if(message!=null){
		%>
		<p style="color:red;"><%=message %></p>
		<%
				session.setAttribute("message", null);
			}
		%>
		<div style="border:2px solid black;width:25%;border-radius:20px;padding:20px" align="center">
		<form action=UserLogin method=post >
		    <table >
		    <tr>
		    <td><label for=email>Email</label><br></td>
		    <td><input type="email" name=email id=email /><br></td>
		    </tr>
		    <tr>
		    <td><label for=pass>Password</label><br></td>
		    <td><input type="password" name=password id=pass /><br></td>
		    </tr>
		    <tr>
		    <td><input type=submit value=Submit /></td>
		    <td><input type=reset /><br></td>
		    </tr>
		    </table>
			
		</form>
		</div>
		<br>
		<a href=UserRegistration.jsp style="font-size:25;color:red;">Create Account</a><br><br>
		<a href=index.jsp  style="font-size:25;color:red;">Go Back to Home Page</a>
</center>
</body>
</html>
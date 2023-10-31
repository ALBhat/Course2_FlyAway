<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Admin Home</title>
</head>
<body >
<center>
<h1>Welcome to Admin Page</h1>
<h3>Insert New Flight Details</h3>
<%
	String message=(String)session.getAttribute("message");
	if(message!=null){
%>
<p style="color:blue;"><%=message %></p>
<%
		session.setAttribute("message", null);
	}
%>
<div style="border:3px solid black;width:25%;border-radius:20px;padding:20px" align="center">
<form action=InsertFlight method=post>
	<label for=name>Name :-</label> <input type="text" name=name id=name /><br><br>
	<label for=from>From :-</label> <input type="text" name=from id=from /><br><br>
	<label for=to>To :-</label> <input type="text" name=to id=to /><br><br>
	<label for=price>Price :-</label> <input type="text" name=price id=price /><br><br>
	<input type=submit value=Submit /> <input type=reset />
</form>
</div><br>
<a href=index.jsp  style="font-size:25;color:red;">Go Back to Home Page</a>
</center>
</body>
</html>
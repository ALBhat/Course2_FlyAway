<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>FlyAway</title>
		<style>
			.center{
				border:5px solid black;
				width: 25%;
				border-radius:20px;
				padding:20px;
				margin: 0px auto;
			}
		</style>
	</head>
<body >
	<%
	@SuppressWarnings("unchecked")
	HashMap<String,String> user=(HashMap<String,String>)session.getAttribute("user");
	if(user!=null){
%>
<p style="text-align:center;color:blue;font-size:20px; font-weight:bold">Welcome <%=user.get("name") %></p>
<%
	}else{
%>
<a href=UserPage.jsp>User Login</a>
<%
	}
%>
<center>
<div style="border:5px solid black;width:25%;border-radius:20px;padding:20px" align="center">
<form action=FlightList method=post>
	<label for=from>From :-</label> <input type=text name=from id=from/><br><br>
	<label for=to>To :-</label> <input type=text name=to id=to/><br><br>
	<label for=departure>Departure Date :-</label> <input type=date name=departure id=departure/><br><br>
	<label for=travellers>Travellers :-</label> <input type=number name=travellers id=travellers/><br><br>
	<input type=submit value=Search /> <input type=reset />
</form>
</div><br>
<a href="Logout">Logout</a>
</center>
</body>
</html>
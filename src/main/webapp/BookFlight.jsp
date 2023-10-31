<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>FlyAway</title>
</head>
<body >
	<%
		@SuppressWarnings("unchecked")
		HashMap<String,String> user=(HashMap<String,String>)session.getAttribute("user");
		if(user==null){
			response.sendRedirect("UserPage.jsp");
		}
	%>
	<center>
		<h1>Your booking confirmed...Thank you for booking with us...</h1>
	</center>
</body>
</html>

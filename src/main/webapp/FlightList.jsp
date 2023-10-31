<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.util.*" %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Flight List</title>
</head>
<body >
<br>
<a href=HomePage.jsp style="color:blue;font-size:18px;font-weight:bold;float: right;">Back</a>
<br><br>
<%
	@SuppressWarnings("unchecked")
	List<String[]> flights=(List<String[]>)session.getAttribute("flights");
	if(flights!=null){
%>
<center>
	<h1>Available Flights</h1>
	<h3>From : <%=session.getAttribute("from") %></h3>
	<h3>To : <%=session.getAttribute("to") %></h3>
	<h3>Number of Passengers: <%=session.getAttribute("travellers") %></h3>
	</center>
<center>
<table border="1">
<tr>
	<th>Flight Name</th>
	<th>Price(per person)</th>
	<th>Total Price</th>
</tr>


<%
	for(String[] flight:flights){
%>
<tr>
	<td><%=flight[0]%></td>
	<td><%=flight[1]%></td>
	<td><%=flight[2]%></td>
	<td><a href=BookFlight.jsp>Book Now</a></td>
</tr>
<%
	}
%>
</table>
</center><br><br>
<center>
<div style="border:5px solid black;width:25%;border-radius:20px;padding:20px" align="center">
	<h1>Card Details</h1>
	<form>
		<label>Name on Card :-</label> <input type=text/><br><br>
		<label>Card Number :-</label> <input type=number/><br><br>
		<label>Date of Expiry:-</label> <input type=date />
	</form>
</div>
</center>
<%
	}
	else{
%>

<h1>There are no available flights</h1>
<%
	}
%>
</body>
</html>
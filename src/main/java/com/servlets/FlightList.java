package com.servlets;


import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.database.Dao;

@WebServlet("/FlightList")
public class FlightList extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String from=request.getParameter("from");
		String to=request.getParameter("to");
		String depDate = request.getParameter("departure").toString();
		int noOfTraveller = Integer.parseInt(request.getParameter("travellers"));
		try {
			Dao dao = new Dao();
			List<String[]> flights=dao.getAvailableFlights(from, to, depDate, noOfTraveller);			
			HttpSession session=request.getSession();
			session.setAttribute("from", from);
			session.setAttribute("to", to);
			session.setAttribute("travellers", noOfTraveller);
			session.setAttribute("flights", flights);
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("FlightList.jsp");
	}
}

package com.servlets;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.database.Dao;


@WebServlet("/InsertFlight")
public class InsertFlight extends HttpServlet {
	private static final long serialVersionUID = 1L;
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name=request.getParameter("name");
		String from=request.getParameter("from");
		String to=request.getParameter("to");
		String price=request.getParameter("price");
		
		HashMap<String,String> flight=new HashMap<>();
		flight.put("name", name);
		flight.put("from", from);
		flight.put("to", to);
		flight.put("price", price);
		
		try {
			Dao dao=new Dao();
			HttpSession session=request.getSession();
			if(dao.insertFlight(flight)) {
				
				session.setAttribute("message", "Flight Added Successfully");
			}
			else {
				session.setAttribute("message", "Invalid Details");
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		response.sendRedirect("AdminHome.jsp");
		
	}

}

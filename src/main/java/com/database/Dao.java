package com.database;

import java.sql.Connection;
import java.sql.DriverManager;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.simplilearn.workshop.util.StringUtil;


public class Dao {
	public Connection con=null;
	public Statement st=null;

	public Dao() throws ClassNotFoundException, SQLException{
		Class.forName("com.mysql.cj.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/flyaway","ashwnini","Karki123*");
		st=con.createStatement();
	}
	public List<String[]> getAvailableFlights(String f, String t, String depDate, int noOfTravellers) {
		
		List<String[]> flights=new ArrayList<>();
		String query="SELECT * FROM flyaway.flight where source='" + f + "' and destination='" + t +"'";
		try {
			ResultSet rs=st.executeQuery(query);
			
			while(rs.next()) {
				String[] flight=new String[3];
				flight[0]=rs.getString("fname");
				flight[1]=rs.getString("price");
				double price = Double.parseDouble(rs.getString("price"));
				flight[2]=Double.toString(noOfTravellers * price);
				flights.add(flight);
			}
			return flights;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public HashMap<String, String> checkUser(String email, String password) {
		
		HashMap<String,String> user=null;
		String query="select * from user where email='"+email+"' and password='"+password+"'";
		try {
			ResultSet rs=st.executeQuery(query);
			if(rs.next()) {
				user=new HashMap<>();
				user.put("name", rs.getString("name"));
				user.put("email",rs.getString("email"));
				user.put("phno",rs.getString("phno"));
				user.put("adno",rs.getString("adno"));
			}
			return user;
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		return user;
	}

	public boolean insertUser(HashMap<String, String> user) {
	
		String query="INSERT INTO user (email, password, name, phno, adno) values('"+user.get("email")+"','"+user.get("password")+"','"+user.get("name")+"','"+user.get("phno")+"','"+user.get("adno")+"')";                   
		
		try {
			st.execute(query);
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public boolean checkAdmin(String email, String password) {
		
		try {
			ResultSet rs=st.executeQuery("select * from admin where email='"+email+"' and password='"+password+"'");
			if(rs.next())
				return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public boolean changeAdminPassword(String email, String password) {
	
		try {
			ResultSet rs=st.executeQuery("select * from admin where email='"+email+"'");
			if(!rs.next()) {
				return false;
			}
			st.execute("update admin set password='"+password+"' where email='"+email+"'");
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public boolean insertFlight(HashMap<String, String> flight) throws SQLException {
		String query1 = "INSERT INTO flight (fname, source, destination, price) VALUES" + " ('"
				+ StringUtil.fixSqlFieldValue(flight.get("name")) + "'," + " '" + StringUtil.fixSqlFieldValue(flight.get("from")) + "'," + " '"
				+ StringUtil.fixSqlFieldValue(flight.get("to")) + "'," + " '" + StringUtil.fixSqlFieldValue(flight.get("price")) + "')";
		System.out.println(query1);
		try {
			st.execute(query1);
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
}

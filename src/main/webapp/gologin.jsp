<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
	String email = request.getParameter("mess");
	String[] arr = email.split(",");
	out.println(email);
	email = arr[0];
	String id = arr[1];

	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/new_schema", "root", "root");
		Statement st = conn.createStatement();
		ResultSet rs = st.executeQuery("SELECT * from gosignup where '" + email + "' in (email) and '" + id + "' in (pwdid)  ");
		ResultSetMetaData rsmd = rs.getMetaData();
		int columnsNumber = rsmd.getColumnCount();
		int c = 0;
		while (rs.next()) {
			for (int i = 1; i <= columnsNumber; i++) {
				if (i > 1)
					c = c + 1;
			}
		}
		int i = c;

		if (i > 0) {
			response.sendRedirect("http://localhost:8095/first/alertls.html");
		} else {
			response.sendRedirect("http://localhost:8095/first/alertln.html");
		}
	} catch (Exception e) {
		System.out.print(e);
		e.printStackTrace();
	}
%>
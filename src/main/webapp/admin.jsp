<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<%
	String email = request.getParameter("email");
	String password = request.getParameter("pwd");
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/new_schema", "root", "root");
		Statement st = conn.createStatement();
		ResultSet rs = st.executeQuery("SELECT * from ADMIN where '" + email + "' in (EMAIL) and '" + password + "' in (PWD) ");
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
			response.sendRedirect("http://localhost:8095/first/welcomeadmin.jsp");
		}
	} catch (Exception e) {
		System.out.print(e);
		e.printStackTrace();
	}
%>
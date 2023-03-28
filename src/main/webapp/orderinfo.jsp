<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
String id = request.getParameter("email");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "new_schema";
String userId = "root";
String password = "root";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>

<body style="background-image: url(spikes.png); background-repeat: repeat;">
<h1 style="text-align:center; color:teal;"><font><strong>ORDERS INFORMATION</strong></font></h1>
<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>

</tr>
<tr bgcolor="Turquoise">
<td><b>EMAIL</b></td>
<td><b>NAME</b></td>
<td><b>CONTACT NO</b></td>
<td><b>ADDRESS</b></td>
<td><b>DELIVERY DATE</b></td>
<td><b>DELIVERY TIME</b></td>
<td><b>ITEM 1</b></td>
<td><b>QUANTITY 1</b></td>
<td><b>ITEM 2</b></td>
<td><b>QUANTITY 2</b></td>
<td><b>ITEM 3</b></td>
<td><b>QUANTITY 3</b></td>
<td><b>ITEM 4</b></td>
<td><b>QUANTITY 4</b></td>
<td><b>ITEM 5</b></td>
<td><b>QUANTITY 5</b></td>
</tr>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM ORDERS";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr bgcolor="LightCyan">

<td><%=resultSet.getString("email") %></td>
<td><%=resultSet.getString("name") %></td>
<td><%=resultSet.getString("contact") %></td>
<td><%=resultSet.getString("address") %></td>
<td><%=resultSet.getString("ddate") %></td>
<td><%=resultSet.getString("dtime") %></td>
<td><%=resultSet.getString("item1") %></td>
<td><%=resultSet.getString("quantity1") %></td>
<td><%=resultSet.getString("item2") %></td>
<td><%=resultSet.getString("quantity2") %></td>
<td><%=resultSet.getString("item3") %></td>
<td><%=resultSet.getString("quantity3") %></td>
<td><%=resultSet.getString("item4") %></td>
<td><%=resultSet.getString("quantity4") %></td>
<td><%=resultSet.getString("item5") %></td>
<td><%=resultSet.getString("quantity5") %></td>

</tr>

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</body>
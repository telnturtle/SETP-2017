<%@ page import="java.sql.*" contentType="text/html;charset=euc-kr"%>
<%
	Connection conn;
	Statement stmt;
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "system",
				"123123");
		conn.close();

		out.println("oracle jdbc test: connect ok!!");
	} catch (Exception e) {
		out.println(e.getMessage());
	}
%>
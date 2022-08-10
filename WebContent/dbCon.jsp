<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

Connection con = null;
Statement  stmt   = null;
ResultSet rs = null;
String sql=null;

try
 {
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "system","123123");

  }catch(SQLException e){out.println(e);}
%>



<%@page import="cs.dit.LoginDto" %>
<%@page import="cs.dit.LoginDao" %>
<%@page import="java.util.ArrayList" %>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*"%>
<%
//DBCP를 사용하여 DB 연동
	Context initCtx = new InitialContext();
	Context envCtx = (Context)initCtx.lookup("java:comp/env");
	DataSource ds = (DataSource)envCtx.lookup("jdbc/ljmdb");
	Connection con = ds.getConnection();
	
	LoginDao dao = new LoginDao();
	
	ArrayList<LoginDto> dtos = dao.list();
	
%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<title>DB 연결</title>
</head>
<body>
	<table class="table table-striped">
		<tr>
			<th>id</th>
			<th>name</th>
			<th>pwd</th>
		</tr>
		<tr>
<%
	for(LoginDto dto : dtos){
		%>
	<td><a href="updateForm.jsp?id=<%=dto.getId() %>"><%=dto.getId() %></a></td>
	<td><%=dto.getName() %></td>
	<td><%=dto.getPwd() %></td>
	</tr>
	
	<% 
		}	
	%>
	</table>
</body>
</html>
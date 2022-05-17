<%@page import="cs.dit.NoticeDto" %>
<%@page import="cs.dit.NoticeDao" %>
<%@page import="java.util.ArrayList" %>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*"%>
<%
	Context initCtx = new InitialContext();
	Context envCtx = (Context)initCtx.lookup("java:comp/env");
	DataSource ds = (DataSource)envCtx.lookup("jdbc/ljmdb");
	Connection con = ds.getConnection();
	
	NoticeDao dao = new NoticeDao();
	
	ArrayList<NoticeDto> dtos = dao.list();
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
<title>Insert title here</title>
</head>
<body>
	<table class="table table-striped">
		<tr>
			<th>작성자</th>
			<th>제목</th>
			<th>날짜</th>
		</tr>
		<tr>
<%
	for(NoticeDto dto : dtos){
		%>
	<td><%=dto.getId() %></td>
	<td><a href="boardupdateForm.jsp?id=<%=dto.getId()%>"><%=dto.getTitle() %></a></td>
	<td><%=dto.getDate()%></td>
	</tr>
	<% 
		}	
	%>
	</table>
</body>
</html>
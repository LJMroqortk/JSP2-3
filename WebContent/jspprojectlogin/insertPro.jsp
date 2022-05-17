<%@ page import = "cs.dit.LoginDao" %>
<%@ page import = "cs.dit.LoginDto" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<% 
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");	 	
	String name = request.getParameter("name");	 	
	String pwd = request.getParameter("pwd");
	
	LoginDto dto = new LoginDto(id,name,pwd);
	LoginDao dao = new LoginDao();
	
	dao.insert(dto);
	response.sendRedirect("list.jsp");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
<% 

 	
 
%>
</body>
</html>
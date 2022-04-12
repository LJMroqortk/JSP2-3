<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
 %>
 <% request.setCharacterEncoding("UTF-8");  %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	당신의 아이디는 <%=id %>이고<br>
	암호는는 <%=pwd %>입니다.
</body>
</html>
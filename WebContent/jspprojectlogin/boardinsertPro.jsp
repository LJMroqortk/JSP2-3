<%@page import="cs.dit.NoticeDto"%>
<%@page import="cs.dit.NoticeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<% 
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");	 	
	String date = request.getParameter("date");	 	
	String title = request.getParameter("title");
	String txtarea = request.getParameter("txtarea");
	
	NoticeDto dto = new NoticeDto(id,date,title,txtarea);
	NoticeDao dao = new NoticeDao();
	
	dao.insert(dto);
	response.sendRedirect("boardlist.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
</body>
</html>
<%@page import="cs.dit.NoticeDto"%>
<%@page import="cs.dit.NoticeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%
 	request.setCharacterEncoding("UTF-8");
	
		String id = "";
		String date = "";
		String title = "";
		String txtarea = "";
		
		id = request.getParameter("id");
		date = request.getParameter("date");
		title = request.getParameter("title");
		txtarea = request.getParameter("txtarea");
		
		NoticeDto dto = new NoticeDto(id,date,title,txtarea);
		new NoticeDao().update(dto);
		
	%>
<script type="text/javascript">
	let ans = alert("변경했습니다.");
	if(!ans){
		location.href='boardlist.jsp';
	}	
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
</body>
</html>
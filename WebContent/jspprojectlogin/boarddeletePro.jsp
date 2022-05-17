<%@page import="cs.dit.NoticeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%
	request.setCharacterEncoding("utf-8");
		
	String id = request.getParameter("id");
	NoticeDao dao = new NoticeDao();
	dao.delete(id);
%>
<script type="text/javascript">
	let ans = alert("삭제하였습니다.");
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
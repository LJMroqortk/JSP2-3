<%@ page import = "cs.dit.LoginDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%
	request.setCharacterEncoding("utf-8");
		
	String id = request.getParameter("id");
	LoginDao dao = new LoginDao();
	dao.delete(id);
%>
<script type="text/javascript">
	let ans = alert("삭제하였습니다.");
	if(!ans){
		location.href='list.jsp';
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
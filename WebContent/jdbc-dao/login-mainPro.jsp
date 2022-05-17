<%/*================================================================
       파일명 :
       변경이력 : 
       프로그램 내용 : 
   =================================================================*/%>
<%@ page import="cs.dit.LoginDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	    request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		LoginDao dao = new LoginDao();
		boolean check = dao.checkUser(id, pwd);
		
		if(check == true){
			session.setAttribute("id", id);
			out.println("유효한 사용자입니다. 환영합니다.");
		}
		else{
			out.println("유효하지 않는 사용자입니다.");
		}
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
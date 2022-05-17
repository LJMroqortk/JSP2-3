<%/*================================================================
       파일명 :
       변경이력 : 
       프로그램 내용 : 
   =================================================================*/%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = (String)session.getAttribute("id");
	if(id != null){
		out.println(id +"님 환영합니다.");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>로그인</h2>
	
	<form name="Login" action="login-mainPro.jsp" method="post">
		
			아이디 : <input type="text" name="id"><br>
			암호 : <input type="password" name ="pwd"><br>
			<input type="submit" value="회원가입">
	</form>	
</body>
</html>
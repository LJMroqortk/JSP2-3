<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 결과</title>
</head>
<body>
	<h2>회원가입 결과</h2>
	<% request.setCharacterEncoding("utf-8");

		String[] sw = request.getParameterValues("sw");
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String date = request.getParameter("date");
		String[] gender = request.getParameterValues("gender");
		String[] job = request.getParameterValues("Job");
	%>
	이름 :<%=name %> <br>
	생일 :<%=date %> <br>
	아이디 :<%=id %> <br>
	비밀번호:<%=pwd %> <br>
	성별 :
	<%
		for(int i = 0; i < gender.length; i++){
			out.println(gender[i] + " ");
		}
	%> <br>
	취미 :
	<%
		for(int i = 0; i < sw.length; i++){
			out.println(sw[i] + " ");
		}
	%> <br>
	직업 :
	<%
		for(int i = 0; i < job.length; i++){
			out.println(job[i] + " ");
		}
	%> <br>
</body>
</html>
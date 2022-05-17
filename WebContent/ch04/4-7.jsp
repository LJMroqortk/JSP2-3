<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		String[] Number = request.getParameterValues("Numbers");
		String[] seting = request.getParameterValues("seting");
	
		
	%>
	언어 :
	<%
		for(int i = 0; i < Number.length; i++){
		out.println(Number[i] + " ");
		}
	%>
	<br>
	취미 :
	<%
		for(int i = 0; i < seting.length; i++){
			out.println(seting[i] + " ");
		}
	%>
	<br>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결과창</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String[] hobby = request.getParameterValues("hobby");
		
		for(int i = 0; i < hobby.length;i++){
			out.println(hobby[i]);
		}
		for(String s : hobby){
			out.println(s);
		}
	%>
</body>
</html>
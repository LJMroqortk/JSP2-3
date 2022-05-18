<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세 과목 평균</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		
		int kor = Integer.parseInt(request.getParameter("국어"));
		int malt = Integer.parseInt(request.getParameter("수학"));
		int eng = Integer.parseInt(request.getParameter("영어"));
		
		int result = kor + malt + eng;
		float ave = (float)result / 3;
		
	%>
	국어 : <%=kor %> <br>
	수학 : <%=malt %> <br>
	영어 : <%=eng %> <br>
	총합 : <%=result %> <br>
	평균 : <%=String.format("%.2f", ave) %> <br>
</body>
</html>
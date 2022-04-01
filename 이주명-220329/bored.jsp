<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 등록</title>
</head>
<body style="background-color:GreenYellow;">
	<% request.setCharacterEncoding("UTF-8"); %>
<h2 align="center">게시판</h2>
	<table border="1" align="center" style="background-color:GhostWhite;" >
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>날짜</td>
		</tr>
		<tr>
			<td><p>190234</p></td>
			<td><p>알아보자! JSP의 모든 것을! (수정 날짜 2022/12/03)</p></td>
			<td><p>23/03/31</p></td>
		</tr>
		<tr>
			<td><p>190237</p></td>
			<td><p>정보 추천글 입니다 (업데이트 중 2023/04/23)</p></td>
			<td><p>23/04/23</p></td>
		</tr>
		<tr>
			<td><p>190235</p></td>
			<td><p>우리는 언제나 역사을 모르고 있습니다. </p></td>
			<td><p>22/05/12</p></td>
		</tr>
		<tr>
			<td><p>190236</p></td>
			<td><p>삼계탕이 어째서 맛있는지 레시피을 보고 알아보자.</p></td>
			<td><p>22/01/31</p></td>
		</tr>
		<tr>
			<td><p>190238</p></td>
			<td><%=request.getParameter("title")%>
			<td><p>22/01/31</p></td>
		</tr>
	</table> <br>
			<h2 align="center"><%=request.getParameter("title")%><h2>
			<p border="1" align="center" style="background-color:White;" width="500" height="500"><%=request.getParameter("area") %></p>
</body>
</html>
<%@page import="cs.dit.dto.FreeBoardDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cs.dit.dao.FreeBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %> 
<% 
	//자유게시판 Dao을 이용하여 DB의 정보를 리스트에 뿌려주는 코드입니다.
	FreeBoardDao dao = new FreeBoardDao();
	ArrayList<FreeBoardDto> dtos =  dao.list();
	//자유게시판의 정보를 세션에 저장시켜줍니다.
	pageContext.setAttribute("dtos", dtos);
	//유저의 데이터를 유지시키기위한 세션입니다.
	String id = (String)session.getAttribute("userid");
%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">	
  <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="../owlcarousel/assets/owl.carousel.min.css">
  <link rel="stylesheet" href="../owlcarousel/assets/owl.theme.default.css">
  <link rel="stylesheet" href="../css/styledata.css">
</head>
<body>
	<!-- 로그인 여부로 표시할 태그을 정하는 조건문 코드입니다. -->
	<%if(id != null) {%>
	 	<jsp:include page="/WEB-INF/view/login_out/logoutimg.jsp"/>
	<%} else {%>
	  	<jsp:include page="/WEB-INF/view/login_out/loginimg.jsp"/>
	<%} %>
	<img id="free_banner" src="../images/freeboardbanner.png">
	<div id="freeboard_list">
	<table class="w3-table-all w3-hoverable">
		<tr  class="w3-light-grey">
			<th>제목</th>
			<th>아이디</th>
			<th>날짜</th>
		</tr>
		<!-- 자유게시판의 데이터의 크기에 따라 데이터를 뿌러줍니다. -->
		<c:forEach var='dto' items='${dtos}'>
			<tr>
				<!-- 지유게시판 게시글의 제목을 클릭시 컨트롤러로 지정한 view.fr로 가져서 해당 조건에 있는 코드을 실행시킵니다.  -->
				<td><a href="view.fr?title=${dto.title}">${dto.title}</a></td>
				<td>${dto.id}</td>
				<td>${dto.date}</td>
			</tr>
		</c:forEach>
	</table>
	</div>
</body>
</html>
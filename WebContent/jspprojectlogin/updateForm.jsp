<%@page import="cs.dit.NoticeDao"%>
<%@page import="cs.dit.NoticeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	
	NoticeDto dto = new NoticeDto();
	NoticeDao dao = new NoticeDao();
	out.println(id);

	dto = dao.selectOne(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<title>글 작성</title>
<style type="text/css">
	h2 { text-align : center;}
</style>
</head>
<body>
<h2>게시글 수정</h2>
	<form action="noticeupdatePro.jsp" method="post">
	<table style="border: 1px solid; border-collapse:collapse; margin-left:auto; margin-right:auto;">
		<tr class="input-group mb-3" style="border:solid 1px;">
			<th class="input-group-text">작성자</th><td><input type="text" class="form-control" name="id" value="<%=dto.getId() %>"></input></td>
			<th class="input-group-text">제목</th><td><input type="text" class="form-control"style="width:100%" name="title" value="<%=dto.getTitle() %>"></input></td>
			<th class="input-group-text">날짜</th><td><input type="text" class="form-control"name="date" placeholder="예시)2022-xx-xx" value="<%=dto.getDate() %>"></input></td>
		</tr>	
	</table>
	<table style="border:1px solid; border-collapse:collapse; margin-left:auto; margin-right:auto;">
		<tr style="border : solid 1px;">
			<td style="border:1px solid;"	><textarea style="width:100%; border:0; resize:none;"rows="20" cols="104.7" name="txtarea"></textarea></td>
		</tr>
	</table>
	
	<div>
		<input type="submit" class="btn btn-primary"style="position:fixed;top:56%;left:42%;"value="변경"></input>
		<button type="button" class="btn btn-primary"style="position:fixed;top:56%;left:46%;" onclick="location.href='boarddeletePro.jsp?id=<%=id%>'">삭제</button>
		<button type="button" class="btn btn-primary"style="position:fixed;top:56%;left:50%;" onclick="location.href='boardlist.jsp'">돌아가기</button>
	</div>
	</form>
</body>
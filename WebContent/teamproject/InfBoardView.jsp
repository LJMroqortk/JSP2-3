<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    	//아이디 체크을 위한 세션을 불러옵니다.
    	String usercheck = (String)session.getAttribute("checkid"); 
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">	
  <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="../css/styledata.css">
</head>
<body>
<!-- 그 가져온 세션을 변수에 집어 넣고 비교하여 수정 삭제 버튼의 보여주기 여부을 판단합니다.  -->
<c:set var="checks" value="<%=usercheck%>"></c:set>
	<jsp:include page="/WEB-INF/view/login_out/logoutimg.jsp"/>
		<c:if test="${checks eq dto.id}">
			<div id="board_change_input">
		    	<input type="button" class ="btn btn-primary" value="수정" onclick ="location.href='updateview.in?title=${dto.title}'">
		    	<input type="button" class = "btn btn-primary" value="삭제" onclick ="location.href='delete.in?title=${dto.title}'">
		    </div>
		</c:if>
		<!-- 정보글에서 목록으로 넘어가기 위한 컨트롤러 부분입니다.  -->
		<!-- 데이터는 리스트에서 지정한 데이터를 세션으로 가져와 뿌려줍니다.  -->
	<form action="InfBoardList.in" method="post">
		
  	 <div>
  	 	<h2 id= "board_title">정보 게시글</h2>
  	 	<div>
			<span id = "title_pos_two">제목 : <span id="title_text_one">${dto.title}</span> 등록일 : <span id="title_text_two">${dto.date}</span></span>
			<span id = "title_id">작성자 : <span id="title_text_id">${dto.id}</span></span>
			<!--  <span id = "title_count"> 조회수 : <span id="title_text_count"></span></span> -->
		</div>
  	 </div>
  	 <span id="text_area_view">${dto.textarea}</span> 
		<input id="board_btn_back"type="submit" class="btn btn-primary" value="정보 게시판 목록 으로 돌아가기"></input>
		<div id="title_uploadfile">파일 : <a id="title_text_uplodfile" download href="/fileupload/uploadfiles/${dto.filename}">${dto.filename}</a></div>
	</form>
</body>
</html>
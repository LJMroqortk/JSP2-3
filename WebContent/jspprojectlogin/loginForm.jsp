<%/*================================================================
       파일명 :
       변경이력 : 
       프로그램 내용 : 
   =================================================================*/%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">	
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="../css/styledata.css">
</head>
<body>
	    <div>
        	<img id="webbanner" src="../images/Webben.png" alt="배너" width="800px" height="200px"/>
        </div>
        <div>
        	   <img id="searchicon" alt="검색" src="../images/search.png" width="50px" height="50px">
        	   <input id="searchinput" class="w3-input w3-border w3-round-large" type="text" placeholder="검색할 제목 혹은 아이디를 입력 하시오.">
        </div>
	<form name="Login" action="login-mainPro.jsp" method="post">
	<div id="login_box">
		<h2 style="font-family: 'Black Han Sans', sans-serif; font-size: 25px;">로그인</h2>
	</div>
		<div class="loginpage">
			<img id="side"alt="" src="../images/board.png" width="50px" height="50px">
			<h2 style="font-family: 'Black Han Sans', sans-serif; font-size: 25px;">ID 아이디</h2>
			<input id="side" type="text" name="id"><br>
			<h2 style="font-family: 'Black Han Sans', sans-serif; font-size: 25px;">PWD 비밀번호</h2>
			<input id="side" type="password" name ="pwd"><br>
			<input id="side"class="btn btn-warning" type="submit" value="로그인"> <br>
          	<button type="button" class="button-3d" onclick="location.href='insertForm.html'"> 회원가입</button> <br>
          	<button type="button" class="button-3d" onclick="location.href='index.html'"> 돌아가기</button> <br>
          	<button type="button" class="button-3d" onclick="location.href='#'"> 아이디 및 비밀번호 찾기</button>
       
		</div>
	
	</form>	
</body>
</html>
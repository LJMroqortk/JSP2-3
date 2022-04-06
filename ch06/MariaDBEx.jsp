<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB 연결</title>
</head>
<body>
	<%
	//1. jdbc driver 등록
	Class.forName("org.mariadb.jdbc.Driver");
	//2. db 와 연결 (Connection) 생성
	String url = "jdbc:mariadb://localhost:3306/LJMDB";
	String user = "leejumyeong";
	String pwd = "1111";
	
	Connection con = DriverManager.getConnection(url,user,pwd);
	//3. DB 연동
	Statement stmt = con.createStatement();
	//4. 연동 확인
	out.println("DB연결 성공!");
	//5. DB 연결 해지
	stmt.close();
	con.close();
	%>
</body>
</html>
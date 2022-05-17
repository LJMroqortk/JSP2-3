<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%
	request.setCharacterEncoding("utf-8");
		
	String id = request.getParameter("id");
	System.out.print(id);
	//1. jdbc driver 등록
		Class.forName("org.mariadb.jdbc.Driver");
	//2. db 와 연결 (Connection) 생성
		String url = "jdbc:mariadb://localhost:3306/LJMDB";
		String user = "leejumyeong";
		String password = "1111";
		
		Connection con = DriverManager.getConnection(url,user,password);
	//3. DB 연동
		String sql = "delete from login where id=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1,id);
		pstmt.executeUpdate();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		con.close();
		pstmt.close();
		
		response.sendRedirect("list.jsp");
	%>
</body>
</html>
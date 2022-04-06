<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
 %>
 <%
 	//1. jdbc 드라이버 로드
 		Class.forName("org.mariadb.jdbc.Driver");
 	//2. 커넥션 얻기
 		String url = "jdbc:mariadb://localhost:3306/LJMDB";
 		String user = "leejumyeong";
 		String password = "1111";
 		Connection con = DriverManager.getConnection(url,user,password);
 	//3. SQL 실행 준비
 		//String sql = "insert into login(id,pwd) values('" + id + "','"+ password + "')";
 		String sql = "insert into login(id,pwd) values(?,?)";
 		Statement stmt;
 		stmt = con.createStatement();
 	//4. SQL 실행
 		//int i = stmt.executeUpdate(sql);
 	PreparedStatement pstpmt = con.prepareStatement(sql);
 	pstpmt.setString(1, id);
 	pstpmt.setString(2, pwd);
 	pstpmt.executeUpdate();
 	//5. 객체 해체
 	stmt.close();
 	con.close();
 	
 	response.sendRedirect("DBlogin.jsp");
 %>
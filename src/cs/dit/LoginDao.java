package cs.dit;

import java.sql.*;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


/**============================================================
 * 패키지명 : cs.dit
 * 파일명 : LoginDao.java
 * 변경이력 :
 *  2022년 05월 02일 최초작성  / 이주명
 * 프로그램 설명 : DB 연동 기능 구현
 * list() = login 테이블의 내용을 화면에 출력할 있다.
 * checkUser() : 유효한 사용자면 1, 유효하지 않으면 0
 *=============================================================*/
public class LoginDao {
	private Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/ljmdb");
		Connection con = ds.getConnection();
		return con;
	}
	//DB 연동을 하여 login 테이블에서 레코드을 추출
	public ArrayList<LoginDto> list() {
		String sql = "select id, pwd, name from login";
		ArrayList<LoginDto> dtos = new ArrayList<LoginDto>();
		try(
				Connection con = getConnection();
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery(sql);
			){
			while(rs.next()) {
				LoginDto dto= new LoginDto();
				dto.setId(rs.getString("id"));
				dto.setPwd(rs.getString("pwd"));
				dto.setName(rs.getString("name"));
				
				dtos.add(dto);
			}
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return dtos;
	}
	//메소드 작성 시  고려해야 할 것
	//1. public / private 결정
	//2. 반환값  / 매개변수
	public boolean checkUser(String id,String pwd) {
		String sql = "select pwd from login where id=? and pwd=?";
		boolean check = true;
		try(
				Connection con = getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
			)
		{
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);

			
			try(ResultSet rs = pstmt.executeQuery();) {
				if(rs.next()) {
					check = true;
				}
				else {
					check = false;
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return check;
	}
	public void insert(LoginDto dto) {
		String sql = "insert into login(id,pwd,name)values(?,?,?)";
		try(
				Connection con = getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
			) 
		{
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			pstmt.setString(3, dto.getName());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public LoginDto selectone(String id) {
		String sql = "select * from login where id=?";
		LoginDto dto = new LoginDto();
		try(
				Connection con = getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
			) 
		{
			pstmt.setString(1, id);
			
			try(ResultSet rs = pstmt.executeQuery();) 
			{
				rs.next();
				
				dto.setId(id);
				dto.setName(rs.getString("name"));
				dto.setPwd(rs.getString("pwd"));
			}
			catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dto;
	}
	public void update(LoginDto dto) {
		String sql = "update login set name = ?,pwd = ? where id = ?";
		try(
				Connection con = getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
			) 
		{
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getPwd());
			pstmt.setString(3, dto.getId());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void delete(String id) {
		String sql = "delete from login where id = ?";
		try(
				Connection con = getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
			) 
		{
			pstmt.setString(1, id);	
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}

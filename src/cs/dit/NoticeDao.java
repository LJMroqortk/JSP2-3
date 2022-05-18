package cs.dit;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

/**============================================================
 * 패키지명 : cs.dit
 * 파일명 : NoticeDao.java
 * 변경이력 :
 *  2022년 05월 11일 최초작성  / 이주명
 * 프로그램 설명 : DB 연동 기능 구현
 * list() = board 테이블의 내용을 화면에 출력할 있다.
 *
 *=============================================================*/
public class NoticeDao {
	
	private Connection getConnection() throws Exception{
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/ljmdb");
		Connection con = ds.getConnection();
		
		return con;
	}
	
	public ArrayList<NoticeDto> list() {
		String sql ="select id,date,title,txtarea from board";
		ArrayList<NoticeDto> dtos = new ArrayList<NoticeDto>();	
		
		try(
			Connection con = getConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
				
			)	
		{
		
			while(rs.next()) {
				NoticeDto dto = new NoticeDto();
				
				dto.setId(rs.getString("id"));
				dto.setDate(rs.getString("date"));
				dto.setTitle(rs.getString("title"));
				dto.setTxtarea(rs.getString("txtarea"));
				
				dtos.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return dtos;
	}
	
	public NoticeDto selectOne(String id) {
		String sql = "select * From board where id=?";
		NoticeDto dto = new NoticeDto();
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
				dto.setDate(rs.getString("date"));
				dto.setTitle(rs.getString("title"));
				dto.setTxtarea(rs.getString("txtarea"));
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	
	public void insert(NoticeDto dto) {
		String sql = "insert into board(id, date, title, txtarea) values (?,?, ?, ?)";
		try(
				Connection con = getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
			) 
			{
				pstmt.setString(1, dto.getId());
				pstmt.setString(2, dto.getDate());
				pstmt.setString(3, dto.getTitle());
				pstmt.setString(4, dto.getTxtarea());
				
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}
	}
	public void update(NoticeDto dto) {
		String sql = "update board set date = ?, title = ?, txtarea = ? where id =?";
		try(
			Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
			)
		{

			pstmt.setString(1, dto.getDate());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getTxtarea());
			pstmt.setString(4, dto.getId());
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void delete(String id) {
		String sql = "delete from board where id=?";
		try(Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
		) 
		{
			pstmt.setString(1, id);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}

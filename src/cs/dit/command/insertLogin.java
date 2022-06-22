package cs.dit.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cs.dit.dao.MemberDao;
import cs.dit.dto.MemberDto;

public class insertLogin implements LogSerivce {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		// 입력한 데이터를 requset로 해당 name을 가진 데이터를 불러와 회원정보에 저장시켜줍니다.
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String hobby = request.getParameter("hobby");
		
		MemberDto dto = new MemberDto(id,pwd,name,email,hobby);
		MemberDao dao = new MemberDao();
		
		dao.insert(dto);
		
	}
	
}

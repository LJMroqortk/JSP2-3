package cs.dit.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cs.dit.dao.MemberDao;
import cs.dit.dto.MemberDto;

public class selectoneLogin implements LogSerivce {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		//현재 로그인 상태에서 저장해둔 세션을 불러와 그것에 맞춰 데이터를 불러와 세션에 저장 시켜줍니다.
		String id = (String)session.getAttribute("userid");
		
		MemberDto dto = new MemberDto();
		MemberDao dao = new MemberDao();
		
		dto = dao.selectone(id);
		
		session.setAttribute("dtos", dto);
	}	
}

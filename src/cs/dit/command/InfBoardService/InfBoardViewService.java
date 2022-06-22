package cs.dit.command.InfBoardService;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cs.dit.dao.InfBoardDao;
import cs.dit.dao.MemberDao;
import cs.dit.dto.InfBoardDto;

public class InfBoardViewService implements InfBoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		//자유게시판과 동일하게 데이터를 가져와 세션으로 저장한 뒤 View로 뿌려줍니다.
		String title = request.getParameter("title");
		
		InfBoardDao dao = new InfBoardDao();
		
		InfBoardDto dto = dao.view(title);
		
		request.setAttribute("dto",dto);
		// 이부분 도 자유게시판과 동일하게 유저 데이터가 null만 아니면 세션으로 아이디을 저장합니다.
		String id = (String)session.getAttribute("userid");
		
		MemberDao daos = new MemberDao();
		
		String checked = daos.getid(id);
		
		if(checked != null) {
			session.setAttribute("checkid", checked);
		}
	}

}

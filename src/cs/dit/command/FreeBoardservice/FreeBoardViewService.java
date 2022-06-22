package cs.dit.command.FreeBoardservice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cs.dit.dao.FreeBoardDao;
import cs.dit.dao.MemberDao;
import cs.dit.dto.FreeBoardDto;

public class FreeBoardViewService implements FreeBoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		// 데이터를 가져와 ViewForm에 뿌려주는 역할과 동시에 업데이트을 위한 dto도 세션에 저장시킵니다.
		String title = request.getParameter("title");
		
		FreeBoardDao dao = new FreeBoardDao();
		
		FreeBoardDto dto = dao.view(title);
		
		request.setAttribute("dto", dto);
		//게시판에서 아이디를 구별하기 위한 데이터 코드로 만약 null만 아니면 세션에 저장하도록 설정하였습니다.
		String id = (String)session.getAttribute("userid");
		
		MemberDao daos = new MemberDao();
		
		String checked = daos.getid(id);
		
		if(checked != null) {
			session.setAttribute("checkid", checked);
		}
	}

}

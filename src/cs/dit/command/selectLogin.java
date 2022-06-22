package cs.dit.command;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cs.dit.dao.MemberDao;

public class selectLogin implements LogSerivce {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		// id와 pwd을 가져와 로그인 여부를 판단하는 코드입니다.
		String id = request.getParameter("id_text");
		String pwd = request.getParameter("pwd_text");
		
		MemberDao dao = new MemberDao();
		boolean check = dao.checkUser(id, pwd);
		// 로그인여부을 판단할때 참이면 아이디와 체크 세션만 가져오고 아니면, 체크 세션만 들고 옵니다.
		if(check == true) {
			HttpSession session = request.getSession();
			session.setAttribute("userid", id);
			session.setAttribute("check", check);
		}
		else {
			HttpSession session = request.getSession();
			session.setAttribute("check", check);	
		}
		
	}
	
}

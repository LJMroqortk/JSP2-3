package cs.dit.command.FreeBoardservice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cs.dit.dao.FreeBoardDao;

public class FreeBoardDeleteService implements FreeBoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String title = request.getParameter("title");
		// 타이틀을 기준으로 DB에 저장된 자유게시판 데이터를 삭제합니다.
		FreeBoardDao dao = new FreeBoardDao();
		dao.delete(title);
	}

}

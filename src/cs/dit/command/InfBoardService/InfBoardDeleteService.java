package cs.dit.command.InfBoardService;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cs.dit.dao.InfBoardDao;

public class InfBoardDeleteService implements InfBoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String title = request.getParameter("title");
		//정보게시판의 해당 글을 삭제하는 코드입니다.
		InfBoardDao dao = new InfBoardDao();
		dao.delete(title);

	}

}

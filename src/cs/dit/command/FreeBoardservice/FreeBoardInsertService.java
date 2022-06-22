package cs.dit.command.FreeBoardservice;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cs.dit.dao.FreeBoardDao;
import cs.dit.dto.FreeBoardDto;

public class FreeBoardInsertService implements FreeBoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		// 날짜는 해당 날짜 기준으로 데이터를 넣기 위해서 Date 객체을 불러와 커스텀 하여 만들었습니다.
		Date date = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String nowdate = simpleDateFormat.format(date);
		// 내용을 다 작성하면 자유게시판 DB에 레코드 형식으로 데이터를 저장시킵니다.
		String title = request.getParameter("title");
		String textarea = request.getParameter("textarea");
		String id = (String)session.getAttribute("userid");
		
		FreeBoardDto dto = new FreeBoardDto(title,id,textarea,nowdate);
		FreeBoardDao dao = new FreeBoardDao();
		
		dao.insert(dto);
	}

}

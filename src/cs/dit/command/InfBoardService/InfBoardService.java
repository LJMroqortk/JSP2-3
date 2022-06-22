package cs.dit.command.InfBoardService;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface InfBoardService {
	//정보게시판 인터페이스입니다.
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;

}

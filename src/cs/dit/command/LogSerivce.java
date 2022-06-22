package cs.dit.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface LogSerivce {
	//Service 을 구현하기 위한 인터페이스 입니다.
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;	
}
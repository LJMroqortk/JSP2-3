package cs.dit.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cs.dit.command.deleteLogin;
import cs.dit.command.insertLogin;
import cs.dit.command.selectLogin;
import cs.dit.command.selectoneLogin;
import cs.dit.command.updateLogin;

@WebServlet("*.do")
public class Lcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String uri = request.getRequestURI().toString();
		String com = uri.substring(uri.lastIndexOf("/")+1, uri.lastIndexOf(".do"));
		String page = null;
		// 컨트롤러 부분입니다. 각 조건문 마다 해당 조건문에 맞으면 실행시키도록 만들어 두었습니다.
		// page라는 부분은 해당 조건문 이후 어느 페이지로 갈 지에 대한 경로 설정입니다.
				
		// 로그인 / 로그아웃 / 회원가입 / 회원정보 확인  / 회원정보 업데이트 / 회원탈퇴
		if(com != null && com.trim().equals("loginPro")) {
			selectLogin login = new selectLogin();
			login.execute(request, response);
			HttpSession session = request.getSession();
			if(session.getAttribute("userid") != null) {
				
				out.println("<script type='text/javascript'>alert('로그인 완료.')</script>");
				page="../teamproject/index.jsp";
			}
			else {
				out.println("<script type='text/javascript'>alert('로그인 실패.')</script>");
				page="../teamproject/loginForm.jsp";
			}
		}
		if(com != null && com.trim().equals("logout")) {
			HttpSession session = request.getSession();
			session.invalidate();
			
			page="../teamproject/index.jsp";
		}
		if(com != null && com.trim().equals("insert")) {
			insertLogin insert = new insertLogin();
			insert.execute(request, response);
			
			page="../teamproject/loginForm.jsp";
		}
		if(com != null && com.trim().equals("selectone")) {
			selectoneLogin select = new selectoneLogin();
			select.execute(request, response);
			
			page="../teamproject/Profile.jsp";
		}
		if(com != null && com.trim().equals("update")) {
			updateLogin update = new updateLogin();
			update.execute(request, response);
			
			page="../teamproject/index.jsp";
		}
		if(com != null && com.trim().equals("secession")) {
			deleteLogin delete = new deleteLogin();
			delete.execute(request, response);
			
			HttpSession session = request.getSession();
			session.invalidate();
			
			page="../teamproject/index.jsp";
		}
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

package kr.or.ddit.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.member.vo.MemberVO;


@WebServlet("/LogOut.do")
public class LogOut extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//session값
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO)session.getAttribute("loginok");
		
		if(vo!=null) { //로그인이 되어있는 상태
			session.removeAttribute("loginok");
			session.removeAttribute("check");
		
		
		}
		request.getRequestDispatcher("/member/logpro.jsp").forward(request, response);		
		
	}

}

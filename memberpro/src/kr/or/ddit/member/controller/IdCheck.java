package kr.or.ddit.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.dao.IMemberDao;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;

/**
 * Servlet implementation class IdCheck
 */
@WebServlet("/IdCheck.do")
public class IdCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//전송 데이터 받기
		String userId = request.getParameter("id");
		
		//service객체
		IMemberService service = MemberServiceImpl.getService();
		
		//메소드 실행
		String res = service.idCheck(userId);
		
		request.setAttribute("result", res); //name명은 임의로 설정
		
		request.getRequestDispatcher("/view/idcheck.jsp").forward(request, response);
		
	}

}

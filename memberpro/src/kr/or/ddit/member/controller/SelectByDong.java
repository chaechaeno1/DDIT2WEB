package kr.or.ddit.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.ZipVO;

/**
 * Servlet implementation class SelectByDong
 */
@WebServlet("/SelectByDong.do")
public class SelectByDong extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//post일때 무조건 설정
		request.setCharacterEncoding("UTF-8");
		
		//전송데이터 받기 - dong
		String dong = request.getParameter("dong");
		
		//service객체
		IMemberService service = MemberServiceImpl.getService();
		
		//service메소드 호출 - List
		List<ZipVO> list = service.selectByDong(dong);
		
		//List결과를 request에 저장
		request.setAttribute("result", list);
		
		//jsp view 페이지 설정(disp) -> forward
		request.getRequestDispatcher("/view/selectDong.jsp").forward(request, response);
		
		
		
	}

}

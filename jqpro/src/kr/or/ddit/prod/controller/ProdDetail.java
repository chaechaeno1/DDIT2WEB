package kr.or.ddit.prod.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.prod.service.IProdService;
import kr.or.ddit.prod.service.ProdServiceImpl;
import kr.or.ddit.prod.vo.ProdVO;

/**
 * Servlet implementation class ProdDetail
 */
@WebServlet("/ProdDetail.do")
public class ProdDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//클라이언트 요청 시 전송 데이터 받기 - pid
		String pid = request.getParameter("pid");
		
		//service 객체 얻기
		IProdService service = ProdServiceImpl.getService();
		
		//service메소드 호출 
		ProdVO vo = service.selectByIdDetail(pid);
		
		//결과값 request에 저장
		request.setAttribute("pid", vo);
		
		//jsp view페이지 설정
		request.getRequestDispatcher("/0927/prodDetail.jsp").forward(request, response);
		
		
		
		
	}

}

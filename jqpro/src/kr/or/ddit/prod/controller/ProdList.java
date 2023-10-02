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
 * Servlet implementation class ProdList
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/ProdList.do" })
public class ProdList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//클라이언트 요청 시 전송 데이터 받기 - lgu
		String lgu = request.getParameter("lgu");
		
		//service객체 얻기
		IProdService service = ProdServiceImpl.getService();
		
		//service메소드 호출 - list
		List<ProdVO> list = service.selectByLgu(lgu);
		
		//list결과값을 request에 저장
		request.setAttribute("lgu", list);
		
		//jsp view페이지 설정(disp) - //forward
		request.getRequestDispatcher("/0927/prodList.jsp").forward(request, response);
		
		
		
	}

}

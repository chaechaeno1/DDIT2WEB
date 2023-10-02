package kr.or.ddit.lprod.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.lprod.service.ILprodService;
import kr.or.ddit.lprod.service.LprodServiceImpl;
import kr.or.ddit.lprod.vo.LprodVO;

/**
 * Servlet implementation class LprodList
 */
@WebServlet("/LprodList.do")
public class LprodList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public LprodList() {
        super();
      
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//클라이언트 요청시 전송 데이터 받기
		
		//service객체 얻기
		ILprodService service = LprodServiceImpl.getService();
		//service메소드 호출 - List결과값
		List<LprodVO> list = service.selectLprod();
		//list결과값을 request에 저장
		request.setAttribute("aaaa", list); //lprodList.jsp에서 aaaa 네임 사용...
		//jsp view페이지 설정 - disp 객체
		RequestDispatcher disp = 
				request.getRequestDispatcher("/0927/lprodList.jsp");
		//forward
		disp.forward(request, response);
		
	}

}

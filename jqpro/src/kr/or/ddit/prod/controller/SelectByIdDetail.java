package kr.or.ddit.prod.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.buyer.service.BuyerServiceImpl;
import kr.or.ddit.buyer.service.IBuyerService;
import kr.or.ddit.buyer.vo.BuyerVO;
import kr.or.ddit.prod.service.IProdService;
import kr.or.ddit.prod.service.ProdServiceImpl;
import kr.or.ddit.prod.vo.ProdVO;

/**
 * Servlet implementation class SelectByIdDetail
 */
@WebServlet("/SelectByIdDetail.do")
public class SelectByIdDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SelectByIdDetail() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 클라이언트 요청시 전송데이터 받기
		String bId = request.getParameter("pid");

		// service객체 얻기
		IProdService service = ProdServiceImpl.getService();

		// service메소드 호출 - 결과값 얻기
		ProdVO vo = service.selectByIdDetail(bId);
		// request에 저장
		request.setAttribute("vo", vo);

		// forward를 위한 객체 얻기 - view페이지 설정
		RequestDispatcher disp = request.getRequestDispatcher("...");

		// forward
		disp.forward(request, response);

	}

}

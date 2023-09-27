package kr.or.ddit.prod.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.buyer.vo.BuyerVO;
import kr.or.ddit.prod.service.IProdService;
import kr.or.ddit.prod.service.ProdServiceImpl;
import kr.or.ddit.prod.vo.ProdVO;

/**
 * Servlet implementation class SelectByLgu
 */
@WebServlet("/SelectByLgu.do")
public class SelectByLgu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public SelectByLgu() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//String bId = request.getParameter("lgu");
		
		IProdService service = ProdServiceImpl.getService();
		
		List<ProdVO> list = service.selectByLgu("lgu");
		
		request.setAttribute("selectByLgu", list);
		
		RequestDispatcher disp = request.getRequestDispatcher("/0926/buyerNames.jsp");
		
		disp.forward(request, response);
		
	}

}

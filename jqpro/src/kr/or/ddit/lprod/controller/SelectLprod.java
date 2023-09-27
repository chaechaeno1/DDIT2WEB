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
 * Servlet implementation class SelectLprod
 */
@WebServlet("/SelectLprod.do")
public class SelectLprod extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public SelectLprod() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ILprodService service = LprodServiceImpl.getService();
		List<LprodVO> list = service.selectLprod();
		
		request.setAttribute("SelectLprod", list);
		
		RequestDispatcher disp = request.getRequestDispatcher("...");
		
		disp.forward(request, response);
	}

}

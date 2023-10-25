package kr.or.ddit.pay.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import kr.or.ddit.pay.service.IPayService;
import kr.or.ddit.pay.service.PayServiceImpl;
import kr.or.ddit.vo.PayVO;

@WebServlet("/insertPayInfo.do")
public class InsertPayInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=utf-8");
		
		int rsvNo = Integer.parseInt(request.getParameter("rsv_no"));
		String payName = request.getParameter("pay_name");
		int payAmt = Integer.parseInt(request.getParameter("pay_amt"));
	    
	    
	    PayVO vo = new PayVO();
	    vo.setRsv_no(rsvNo);
	    vo.setPay_name(payName);
	    vo.setPay_amt(payAmt);
	    
	    IPayService service = PayServiceImpl.getInstance();
	    
	    // service 메소드 호출 - int
	    int res = service.insertPayInfo(vo);
	    
	    Gson gson = new Gson();
	    String jsonData = null;
	    
	    if (res > 0) {
	        jsonData = gson.toJson("결제성공");
	    } else {
	        jsonData = gson.toJson("결제실패");
	    }
	    
	    response.getWriter().write(jsonData);
	    response.flushBuffer();
	}

}

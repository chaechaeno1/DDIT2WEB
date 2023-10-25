package kr.or.ddit.pay.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.or.ddit.pay.service.IPayService;
import kr.or.ddit.pay.service.PayServiceImpl;
import kr.or.ddit.rsv.service.IRsvService;
import kr.or.ddit.rsv.service.RsvServiceImpl;


@WebServlet("/Refund.do")
public class Refund extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=utf-8");
		
		// 전송 데이터 받기 - int 저장
		int rsvno = Integer.parseInt(request.getParameter("rsvno"));
		
		//service 객체 얻기
		IPayService service1 = PayServiceImpl.getInstance();
		IRsvService service2 = RsvServiceImpl.getInstance();
				
		//service 메소드 호출 - int
		
		 int res1 = service1.updateRefundInfo(rsvno); 
		 int res2 = service2.updateRsvInfo(rsvno);
		 
		 Gson gson = new Gson();
		 String jsonData = null;
		 
			if(res1>0 && res2>0) { 
				jsonData = gson.toJson("성공");

			} else { 
				jsonData = gson.toJson("실패");
			}
		 
			response.getWriter().write(jsonData);
			response.flushBuffer();
	}

}

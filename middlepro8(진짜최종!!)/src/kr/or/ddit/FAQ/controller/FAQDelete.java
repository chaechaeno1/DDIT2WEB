package kr.or.ddit.FAQ.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.or.ddit.FAQ.service.FAQServiceImpl;
import kr.or.ddit.FAQ.service.IFAQService;


@WebServlet("/faqDelete.do")
public class FAQDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=utf-8");
		
		//전송데이타 받기 
		int num = Integer.parseInt(request.getParameter("faq_no"));
		
		//service객체 얻기 
		IFAQService  service = FAQServiceImpl.getService();
		
		//service메소드 호출 -결과값 - int
		int res = service.deleteFAQ(num);
		
		Gson gson = new Gson();
		String jsonData = null;
		
		if(res > 0) {
			jsonData = gson.toJson("성공");
		} else {
			jsonData = gson.toJson("실패");
		}
		
		response.getWriter().write(jsonData);
		response.flushBuffer();
	}

}

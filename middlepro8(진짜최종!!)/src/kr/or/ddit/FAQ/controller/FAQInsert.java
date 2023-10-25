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
import kr.or.ddit.vo.FAQVO;


@WebServlet("/faqInsert.do")
public class FAQInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=utf-8");
		
		//전송데이타 받기 
		String title = request.getParameter("faq_title");
		String content = request.getParameter("faq_content");
		
		
		//vo에 설정 
		FAQVO  vo = new FAQVO();
		vo.setFaq_title(title);
		vo.setFaq_content(content);

		//service객체 
		IFAQService  service = FAQServiceImpl.getService();
				
		//메소드 호출 - 결과값 int  -- 글쓰기 저장
		int res = service.insertFAQ(vo);
		
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

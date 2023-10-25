package kr.or.ddit.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.or.ddit.notice.service.INoticeService;
import kr.or.ddit.notice.service.NoticeServiceImpl;

@WebServlet("/noticeDelete.do")
public class NoticeDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=utf-8");
		
		// 전송 데이터 받기
		int bno = Integer.parseInt(request.getParameter("num"));
		
		// service 객체 얻기
		INoticeService service = NoticeServiceImpl.getInstance();
		
		// service 메소드 호출 - 결과값 int
		int res = service.deleteNotice(bno);
		System.out.println(res);
		
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

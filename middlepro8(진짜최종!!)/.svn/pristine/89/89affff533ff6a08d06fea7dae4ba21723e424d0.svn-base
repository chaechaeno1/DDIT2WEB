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
import kr.or.ddit.vo.NoticeVO;

@WebServlet("/noticeInsert.do")
public class NoticeInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=utf-8");
		
		// 전송 데이터 받기
		String title = request.getParameter("notice_title");
		String cont = request.getParameter("notice_content");
		
		
		// VO에 설정
		NoticeVO vo = new NoticeVO();
		vo.setNotice_title(title);
		vo.setNotice_content(cont);
		
		// service객체
		INoticeService service = NoticeServiceImpl.getInstance();
		
		// 메소드 호출 - 결과값 int
		int res = service.insertNotice(vo);
		
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

package kr.or.ddit.reply.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.reply.service.IReplyService;
import kr.or.ddit.reply.service.ReplySerivceImpl;
import kr.or.ddit.reply.vo.ReplyVO;

/**
 * Servlet implementation class ReplyList
 */
@WebServlet("/ReplyList.do")
public class ReplyList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//전송데이터 가져오기
		int bonum = Integer.parseInt(request.getParameter("bonum"));
		
		//service객체 
		IReplyService service = ReplySerivceImpl.getService();
		
		//메소드 호출 - List
		List<ReplyVO> list = service.listReply(bonum);
		
		//저장
		request.setAttribute("list", list);
		
		//view 페이지 설정 - forword
		request.getRequestDispatcher("/boardview/replyList.jsp")
		.forward(request, response);
		
		
		
		
	}

}

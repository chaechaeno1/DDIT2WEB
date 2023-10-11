package kr.or.ddit.reply.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.reply.service.IReplyService;
import kr.or.ddit.reply.service.ReplySerivceImpl;
import kr.or.ddit.reply.vo.ReplyVO;

/**
 * Servlet implementation class ReplyInsert
 */
@WebServlet("/ReplyInsert.do")
public class ReplyInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		//전송데이터 받기 - name, bonum, cont
		
		int bonum = Integer.parseInt(request.getParameter("bonum"));
		String name = request.getParameter("name");
		String cont = request.getParameter("cont");
		
		ReplyVO vo = new ReplyVO();
		vo.setBonum(bonum);
		vo.setName(name);
		vo.setCont(cont);
		
		//service객체 얻기
		IReplyService service = ReplySerivceImpl.getService();
		
		//service메소드 호출 - 결과값 int
		int res = service.insertReply(vo);
		System.out.println(res);
		
		//결과를 request에 저장
		request.setAttribute("res", res);
		
		//view페이지 설정 = forward
		request.getRequestDispatcher("/boardview/result.jsp")
		.forward(request, response);
	}

}

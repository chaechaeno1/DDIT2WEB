package kr.or.ddit.reply.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.reply.service.IReplyService;
import kr.or.ddit.reply.service.ReplySerivceImpl;

/**
 * Servlet implementation class ReplyDelete
 */
@WebServlet("/ReplyDelete.do")
public class ReplyDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//전송데이터 받기 - renum (정수로 받기)
		int renum = Integer.parseInt(request.getParameter("renum"));
		
		//service 객체 
		IReplyService service = ReplySerivceImpl.getService();
		
		//service 메소드 호출 - int 결과
		int res = service.deleteReply(renum);
		
		//결과를 request에 저장
		request.setAttribute("res", res);
		
		//view페이지 설정 - forword
		request.getRequestDispatcher("/boardview/result.jsp")
		.forward(request, response);
		

	}

}

package kr.or.ddit.reply.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.reply.service.IReplyService;
import kr.or.ddit.reply.service.ReplySerivceImpl;
import kr.or.ddit.reply.vo.ReplyVO;


@WebServlet("/ReplyUpdate.do")
public class ReplyUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("utf-8");
		
		//전송 데이터 받기 - cont, renum
		ReplyVO vo = new ReplyVO();
		try {
			BeanUtils.populate(vo, request.getParameterMap());
		} catch (IllegalAccessException e) {	
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		
		//service 객체 얻기
		IReplyService service = ReplySerivceImpl.getService();
		
		//service호출 - 결과값 int
		int res = service.updateReply(vo);
		
		//request에 결과값 저장
		request.setAttribute("res", res);
		
		//view페이지 설정(result.jsp) - forward
		request.getRequestDispatcher("/boardview/result.jsp").forward(request, response);
		
		
		
		
	}

}

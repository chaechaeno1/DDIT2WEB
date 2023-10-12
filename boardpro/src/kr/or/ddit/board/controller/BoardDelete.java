package kr.or.ddit.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.exceptions.IbatisException;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;


@WebServlet("/BoardDelete.do")
public class BoardDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//전송데이터 받기
		int num = Integer.parseInt(request.getParameter("num"));
		
		//service객체 얻기
		IBoardService service = BoardServiceImpl.getService();
		
		//service메서드 호출 - 결과값 : int
		int res = service.deleteBoard(num);
		
		//결과값을 request에 저장
		request.setAttribute("res", res);
		
		
		//view페이지 설정 - forword
		request.getRequestDispatcher("/boardview/result.jsp").forward(request, response);
		
	}

}

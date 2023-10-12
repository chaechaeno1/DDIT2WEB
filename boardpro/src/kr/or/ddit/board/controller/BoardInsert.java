package kr.or.ddit.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.board.vo.BoardVO;


@WebServlet("/BoardInsert.do")
public class BoardInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		//전송데이터 받기
		String writer = request.getParameter("writer");
		String subject = request.getParameter("subject");
		String password = request.getParameter("password");
		String mail = request.getParameter("mail");
		String content = request.getParameter("content");
		
		//vo에 설정
		BoardVO vo = new BoardVO();
		vo.setWriter(writer);
		vo.setSubject(subject);
		vo.setMail(mail);
		vo.setPassword(password);
		vo.setContent(content);
		vo.setWip(request.getRemoteAddr()); //작성자의 IP 불러오기
		
		//service객체
		IBoardService service = BoardServiceImpl.getService();
		
		//메소드 호출 - 결과값 int
		int res = service.insertBoard(vo);
		
		//결과값을 request에 저장
		request.setAttribute("res", res);
		
		//view페이지 설정 - forword
		request.getRequestDispatcher("/boardview/result.jsp").forward(request, response);
		
		
	}

}

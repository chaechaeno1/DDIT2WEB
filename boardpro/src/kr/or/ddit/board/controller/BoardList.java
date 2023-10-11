package kr.or.ddit.board.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.PageVO;

/**
 * Servlet implementation class BoardList
 */
@WebServlet("/BoardList.do")
public class BoardList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		//전송데이터 받기
		int spage = Integer.parseInt(request.getParameter("page"));
		//최소 실행시에는 없음
		String stype = request.getParameter("stype");
		String sword = request.getParameter("sword");
		
		System.out.println("page = "+spage);
		System.out.println("stype = "+stype);
		System.out.println("sword = "+sword);
		
		IBoardService service = BoardServiceImpl.getService();
		
		//메소드 호출
		PageVO pvo = service.pageInfo(spage, stype, sword);
		//totalPage, startPage, endPage, start, end 결과를 vo객체로 리턴받음
		
		
		//확인용 출력하기
		System.out.println("totalPage = " +pvo.getTotalPage()); //7
		System.out.println("startPage = " +pvo.getStartPage()); //1
		System.out.println("endPage = " +pvo.getEndPage()); //2
		System.out.println("start = " +pvo.getStart()); //1
		System.out.println("end = " +pvo.getEnd()); //3
		
		
		
		
		//출력할 글 리스트 가져오기
		Map<String, Object> map = new HashMap<String, Object>();
		//board.xml 구문의 데이터 명과 키가 일치해야함
		map.put("start",pvo.getStart());
		map.put("end",pvo.getEnd());
		//위에서 선언했음
		map.put("stype",stype);
		map.put("sword",sword);
		
		List<BoardVO> list = service.selectBoardList(map);
		
		//List결과를 request에 저장
		request.setAttribute("boardList", list);
		request.setAttribute("startPage", pvo.getStartPage());
		request.setAttribute("endPage", pvo.getEndPage());
		request.setAttribute("totalPage", pvo.getTotalPage());
		
		
		//view페이지 설정 -> forward
		request.getRequestDispatcher("/boardview/boardList.jsp")
		.forward(request, response);
		
	}
	
	

}

package kr.or.ddit.board.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.board.vo.BoardVO;


@WebServlet("/BoardUpdate.do")
public class BoardUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//전송된 데이터 받기 - vo에 저장 하기 (requestgetparameter)
		BoardVO vo = new BoardVO();
		
		try { //beanutil.jar 적용 (vd와 form name속성이름과 같아야 적용)
			BeanUtils.populate(vo, request.getParameterMap());
		} catch (IllegalAccessException e) {
		
			e.printStackTrace();
		} catch (InvocationTargetException e) {
		
			e.printStackTrace();
		}
		
		vo.setWip(request.getRemoteAddr());
		
		//service 객체
		IBoardService service = BoardServiceImpl.getService();
				
		//service 메소드 호출
		int res = service.updateBoard(vo);
		
		//결과값을 request에 저장
		request.setAttribute("res", res);
		
		//view 페이지 설정 -> forward
		request.getRequestDispatcher("/boardview/result.jsp").forward(request, response);
		
		
		
		
		
		
	}

}

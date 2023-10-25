package kr.or.ddit.camp.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.or.ddit.camp.service.CampServiceImpl;
import kr.or.ddit.camp.service.ICampService;
import kr.or.ddit.vo.CampVO;

@WebServlet("/selectCampno.do")
public class SelectCampno extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		
		// 눌리는 버튼에 저장된 캠프 유형 값을 가져옴
		String campCode = request.getParameter("campCode");
		// JSON처리용 객체 생성
		Gson gson = new Gson();
		// JSON문자열로 변환된 데이터가 저장될 변수 선언
		String jsonData = null;
		
		ICampService service = CampServiceImpl.getInstance();
		
		List<CampVO> list = service.selectCampNo(campCode);
		
		jsonData = gson.toJson(list);
		
		response.getWriter().write(jsonData);
		
		response.flushBuffer();
		
//		request.setAttribute("result", list);
//		request.getRequestDispatcher("/view/calResult.jsp").forward(request, response);
		
    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package kr.or.ddit.rsv.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.or.ddit.rsv.service.IRsvService;
import kr.or.ddit.rsv.service.RsvServiceImpl;
import kr.or.ddit.vo.RsvVO;

@WebServlet("/RsvList.do")
public class RsvList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    response.setContentType("application/json; charset=utf-8");
	    
	    IRsvService service = RsvServiceImpl.getInstance();
	    
	    String mem_id = request.getParameter("mem_id");	  
	    
	    // 메소드 호출
	    List<RsvVO> list = service.selectRsvInfo(mem_id);
	    System.out.println(list);
	    
	    // JSON 응답 생성
	    Gson gson = new Gson();
	    String jsonData = gson.toJson(list);
	    
	    // JSON 데이터를 클라이언트로 출력
	    response.getWriter().write(jsonData);
	    response.flushBuffer();
	}
}
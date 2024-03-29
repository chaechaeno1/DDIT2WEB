package kr.or.ddit.member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;

@WebServlet("/idCheck.do")
public class IdCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=utf-8");
		
		// 전송 데이터 받기
		String userId = request.getParameter("id");
		
		// service
		IMemberService service = MemberServiceImpl.getInstance();
		
		// 메소드 실행
		String res = service.idCheck(userId);
		
		Gson gson = new Gson();
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		if(res==null) {
			resultMap.put("str", "사용 가능 ID");
			resultMap.put("flag", "성공");
		} else {
			resultMap.put("str", "사용 불가능 ID");
			resultMap.put("flag", "실패");
		}
		
		String jsonStr = gson.toJson(resultMap);
		
		response.getWriter().write(jsonStr);
		response.flushBuffer();
	}

}

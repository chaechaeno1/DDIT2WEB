package kr.or.ddit.member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;

@WebServlet("/withdrawalMember.do")
public class WithdrawalMember extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=utf-8");

		// 클라이언트 요청시 전송데이터 받기
		String userId = request.getParameter("mem_id");
		String userPass = request.getParameter("mem_pass");

		// service객체 얻기
		IMemberService service = MemberServiceImpl.getInstance();

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mem_id", userId);
		map.put("mem_pass", userPass);
		
		// service 메소드 호출 - int
		int res = service.withdrawalMember(map);
		
		Gson gson = new Gson();
		String jsonData = null;
		
		HttpSession session = request.getSession();

		
		if(res > 0) {
			jsonData = gson.toJson("성공");
			session.invalidate();	// 세션 삭제
			
		} else {
			jsonData = gson.toJson("실패");
		}
		
		response.getWriter().write(jsonData);
		response.flushBuffer();
		
	}

}

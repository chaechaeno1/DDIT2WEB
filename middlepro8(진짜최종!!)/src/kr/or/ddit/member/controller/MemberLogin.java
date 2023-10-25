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
import kr.or.ddit.vo.MemberVO;

@WebServlet("/memberLogin.do")
public class MemberLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		
		// service메소드 호출하기 - 결과값 받기 - MemberVO
		MemberVO vo = service.loginMember(map);
		
		// 세션 가져오기
		HttpSession session = request.getSession();
		
		// gson 사용해 결과값 담기
		Gson gson = new Gson();
		String jsonData = null;
		
		if(vo!=null) { // 계정이 있음
			if(vo.getIs_active() == 1) {	// 활성 상태
				jsonData = gson.toJson("성공");
				session.setAttribute("loginMember", vo);
			} else if(vo.getIs_active() == 0) {	// 비활성, 탈퇴 상태
				jsonData = gson.toJson("탈퇴");
			}

		} else { // 로그인 실패
			jsonData = gson.toJson("실패");
		}
		
		response.getWriter().write(jsonData);
		response.flushBuffer();
		
	}

}

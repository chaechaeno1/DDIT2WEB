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

@WebServlet("/memberIdFind.do")
public class MemberIdFind extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=utf-8");
		
		// 클라이언트 요청시 전송데이터 받기
		String username = request.getParameter("mem_name");
		String usermail = request.getParameter("mem_mail");
		
		MemberVO vo = new MemberVO();
		vo.setMem_name(username);
		vo.setMem_mail(usermail);
		// service객체 얻기
		IMemberService service = MemberServiceImpl.getInstance();
		
		String memId =service.idFind(vo);
		
		
		// gson 사용해 결과값 담기
		Gson gson = new Gson();
		String jsonData = null;
		
		if(memId != null) { //찾기성공
			jsonData = gson.toJson(memId);

		} else { // 찾기 실패
			jsonData = gson.toJson("실패");
		}
		
		response.getWriter().write(jsonData);
		response.flushBuffer();
		
	}

}

package kr.or.ddit.member.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.google.gson.Gson;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.vo.MemberVO;

@WebServlet("/insertMember.do")
public class InsertMember extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=utf-8");
		
		// 전송 데이터 받기
		MemberVO vo = new MemberVO();
		
		try {
			BeanUtils.populate(vo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// service 객체 얻기
		IMemberService service = MemberServiceImpl.getInstance();
		
		// service 메소드 호출 - int
		int res = service.insertMember(vo);
		
		Gson gson = new Gson();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		if(res > 0) {
			resultMap.put("str", vo.getMem_name()+"님 가입을 축하합니다.");
			resultMap.put("flag", "성공");
		} else {
			resultMap.put("str", "가입 실패, 다시 확인해주세요");
			resultMap.put("flag", "실패");
		}
		
		String jsonData = gson.toJson(resultMap);
		
		response.getWriter().write(jsonData);
		response.flushBuffer();
		
		
	}

}

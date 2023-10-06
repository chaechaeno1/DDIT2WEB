package kr.or.ddit.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;

/**
 * Servlet implementation class Insert
 */
@WebServlet("/Insert.do")
public class Insert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		//전송데이터 받기 - ajax의 vdata key값과 일치
		//serializeArray() 사용시에 파라미터값이 id가 아닌 name으로 들어가야함
		String id = request.getParameter("mem_id"); 
		String name = request.getParameter("mem_name"); 
		String bir = request.getParameter("mem_bir"); 
		String pwd = request.getParameter("mem_pass"); 
		String hp = request.getParameter("mem_hp"); 
		String email = request.getParameter("mem_mail"); 
		String zip = request.getParameter("mem_zip"); 
		String add1 = request.getParameter("mem_add1"); 
		String add2 = request.getParameter("mem_add2");
		
		//service객체얻기
		IMemberService service = MemberServiceImpl.getService();
		
		//vo변수에 입력내용 set
		MemberVO vo = new MemberVO();
		vo.setMem_id(id);
		vo.setMem_name(name);
		vo.setMem_bir(bir);
		vo.setMem_pass(pwd);
		vo.setMem_hp(hp);
		vo.setMem_mail(email);
		vo.setMem_zip(zip);
		vo.setMem_add1(add1);
		vo.setMem_add2(add2);
		
		//serivce 메소드 호출 -> int
		int res = service.insertMember(vo);
		
		//int 저장(name명 임의로 작성)
		request.setAttribute("res", res);
		request.setAttribute("name", name);
		 
		 		  
		//view페이지(/view/insert.jsp) 설정 - forward
		 request.getRequestDispatcher("/view/insert.jsp").forward(request, response);
		
		
		
	}

}

package kr.or.ddit.member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PageVO;

@WebServlet("/memberList.do")
public class MemberList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=utf-8");
		
		//전송데이타 받기 
		int spage = Integer.parseInt(request.getParameter("page"));
		//최초 실행시 없다
		String searchType = request.getParameter("searchType");
		String searchMem = request.getParameter("searchMem");
		int totalCnt = 0;
		
		System.out.println("page =  " + spage);
		System.out.println("searchType =  " + searchType);
		System.out.println("searchMem =  " + searchMem);
		
		IMemberService service = MemberServiceImpl.getInstance();
		
		//메소드 호출 
		PageVO  pvo = service.pageInfo(spage, searchType, searchMem);
		//totalPage, startpge, endPage start, end 결과를 vo객체로 리턴 받음 
		
		System.out.println("totalPage = " + pvo.getTotalPage());
		System.out.println("startpge = " + pvo.getStartPage());
		System.out.println("endPage = " + pvo.getEndPage());
		System.out.println("start = " + pvo.getStart());
		System.out.println("end = " + pvo.getEnd());
		// totalPage =7 , startpge = 1  endPage = 2
		//start = 1,  end = 3
		
		//출력할 글 리스트 가져오기
		Map<String, Object>  map = new HashMap<String, Object>();
		map.put("start", pvo.getStart());
		map.put("end", pvo.getEnd());
		map.put("searchType", searchType);
		map.put("searchMem", searchMem);
		map.put("totalCnt", totalCnt);
		
		List<MemberVO>  list = service.selectMemberList(map);
		int res = service.getTotalCont(map);
		
		// JSON 응답 생성 및 클라이언트로 전송
        JsonObject obj = new JsonObject();
        obj.addProperty("sp", pvo.getStartPage());
        obj.addProperty("ep", pvo.getEndPage());
        obj.addProperty("tp", pvo.getTotalPage());
        obj.addProperty("tc", res);

        Gson gson = new Gson();
        JsonElement jele = gson.toJsonTree(list);

        obj.add("datas", jele);

        // JSON 데이터를 클라이언트로 출력
        response.getWriter().write(obj.toString());
		response.flushBuffer();

	}
}

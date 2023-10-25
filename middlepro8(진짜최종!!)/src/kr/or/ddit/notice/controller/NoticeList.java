package kr.or.ddit.notice.controller;

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

import kr.or.ddit.notice.service.INoticeService;
import kr.or.ddit.notice.service.NoticeServiceImpl;
import kr.or.ddit.vo.NoticeVO;
import kr.or.ddit.vo.PageVO;

@WebServlet("/noticeList.do")
public class NoticeList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=utf-8");
		
		// 전송데이터 받기
		int spage = Integer.parseInt(request.getParameter("page"));
		
		// 최초 실행시 없음
		String stype = request.getParameter("stype");
		String sword = request.getParameter("sword");
		
		System.out.println("page = " + spage);
		System.out.println("stype = " + stype);
		System.out.println("sword = " + sword);
		
		INoticeService service = NoticeServiceImpl.getInstance();
		
		// 메소드 호출
		PageVO pvo = service.pageInfo(spage, stype, sword);
		// totalPage, startPage, endPage, start, end 결과를 vo객체로 리턴
		
		System.out.println("totalPage = " + pvo.getTotalPage());
		System.out.println("startPage = " + pvo.getStartPage());
		System.out.println("endPage = " + pvo.getEndPage());
		System.out.println("start = " + pvo.getStart());
		System.out.println("end = " + pvo.getEnd());
		// totalPage = 7, startPage = 1, endPage = 2
		// start = 1, end = 3
		
		
		// 출력할 글 리스트 가져오기
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", pvo.getStart());
		map.put("end", pvo.getEnd());
		map.put("stype", stype);
		map.put("sword", sword);
		
		List<NoticeVO> list = service.selectNoticeList(map);
		
		// JSON 응답 생성 및 클라이언트로 전송
        JsonObject obj = new JsonObject();
        obj.addProperty("sp", pvo.getStartPage());
        obj.addProperty("ep", pvo.getEndPage());
        obj.addProperty("tp", pvo.getTotalPage());

        Gson gson = new Gson();
        JsonElement jele = gson.toJsonTree(list);

        obj.add("datas", jele);

        // JSON 데이터를 클라이언트로 출력
        response.getWriter().write(obj.toString());
		response.flushBuffer();

	}

}

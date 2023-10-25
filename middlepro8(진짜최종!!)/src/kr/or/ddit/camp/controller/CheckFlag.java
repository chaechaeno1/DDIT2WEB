package kr.or.ddit.camp.controller;

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

@WebServlet("/checkFlag.do")
public class CheckFlag extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");	
		
	    // 전송 데이터 받기
	    String currMonth = request.getParameter("currMonth");
	    String campCode = request.getParameter("campCode");
		
		RsvVO rvo = new RsvVO();
		
	    // currMonth와 campCode를 rvo에 설정
	    rvo.setRsv_start_date(currMonth);
	    rvo.setCampsite_no(campCode);
        
        IRsvService service = RsvServiceImpl.getInstance();
        
        List<RsvVO> resultList = service.selectRsvAll(rvo);

        Gson gson = new Gson();
        
        String responseData = gson.toJson(resultList);

        response.getWriter().write(responseData);
        
        response.flushBuffer();
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

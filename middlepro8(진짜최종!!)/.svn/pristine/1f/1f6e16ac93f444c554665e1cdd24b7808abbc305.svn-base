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


@WebServlet("/selectByRsv.do")
public class SelectByRsv extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        
	    String campsite_no = request.getParameter("campsite_no");
	    String rsv_start_date = request.getParameter("rsv_start_date");
		
		RsvVO vo = new RsvVO();
		
		vo.setCampsite_no(campsite_no);
		vo.setRsv_start_date(rsv_start_date);
		
		IRsvService service = RsvServiceImpl.getInstance();
		
		List<RsvVO> list = service.selectByRsv(vo);
		
		System.out.println(list);
		
		Gson gson = new Gson();
		
		String jsonData = gson.toJson(list);
		
		response.getWriter().write(jsonData);
		
		response.flushBuffer();
		
	}
}
package kr.or.ddit.rsv.controller;

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

import kr.or.ddit.rsv.service.IRsvService;
import kr.or.ddit.rsv.service.RsvServiceImpl;
import kr.or.ddit.vo.RsvVO;

@WebServlet("/insertRsv.do")
public class InsertRsv extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=utf-8");
		
		RsvVO vo = new RsvVO();
		
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
		IRsvService rsvService = RsvServiceImpl.getInstance();
		
		// service 메소드 호출 - int
		int res = rsvService.insertRsv(vo);
		
		Gson gson = new Gson();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		
		if(res > 0) {
			// 예약 번호 가져오기
			int rsvNo = rsvService.getRightRsvNo();
			resultMap.put("rsv_no", rsvNo);
			resultMap.put("flag", "예약성공");
		} else {
			resultMap.put("flag", "예약실패");
		}
		
		String jsonData = gson.toJson(resultMap);
		
		response.getWriter().write(jsonData);
		response.flushBuffer();
		
	}

}

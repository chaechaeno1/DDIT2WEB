package kr.or.ddit.FAQ.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.google.gson.Gson;

import kr.or.ddit.FAQ.service.FAQServiceImpl;
import kr.or.ddit.FAQ.service.IFAQService;
import kr.or.ddit.vo.FAQVO;


@WebServlet("/faqUpdate.do")
public class FAQUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=utf-8");
		
		//전송 데이타 받기 - vo에 저장 하기 
		FAQVO vo = new FAQVO();
		
		try {
			BeanUtils.populate(vo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		//service객체
		IFAQService  service = FAQServiceImpl.getService();
		
		//service메소드 호출 
		int res = service.updateFAQ(vo);
		
		
		
		// 
		Gson gson = new Gson();
		String jsonData = null;
		
		if(res > 0) { 
			jsonData = gson.toJson("성공");

		} else { 
			jsonData = gson.toJson("실패");
		}
		
		response.getWriter().write(jsonData);
		response.flushBuffer();
		
		
	}

}

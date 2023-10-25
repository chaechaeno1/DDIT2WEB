package kr.or.ddit.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import kr.or.ddit.admin.service.AdminServiceImpl;
import kr.or.ddit.admin.service.IAdminService;
import kr.or.ddit.vo.SaleVO;

@WebServlet("/adminDaySale.do")
public class AdminDaySale extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json"); // JSON 응답을 설정

        IAdminService service = AdminServiceImpl.getService();

        // 선택한 월을 파라미터에서 가져오기
        String currentYearAndMonth = request.getParameter("month");
        
        // 선택한 월의 일간 매출 데이터 가져오기
        List<SaleVO> daySales = service.SaleDay(currentYearAndMonth);

        // 매출 데이터를 JSON 형식으로 변환
        Gson gson = new Gson();
        JsonObject jsonData = new JsonObject();

        jsonData.add("list", gson.toJsonTree(daySales));

        System.out.println(jsonData);

        // JSON 응답 보내기
        PrintWriter out = response.getWriter();
        out.print(jsonData.toString());
        out.flush();
    }
}

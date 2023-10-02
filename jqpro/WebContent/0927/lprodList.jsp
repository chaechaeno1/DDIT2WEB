<%@page import="com.google.gson.Gson"%>
<%@page import="kr.or.ddit.lprod.vo.LprodVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//서블릿에서 저장한 데이터 꺼내기
	List<LprodVO> list = (List<LprodVO>)request.getAttribute("aaaa");
	
	Gson gson = new Gson();
	
	String result = gson.toJson(list);
	
	out.print(result);
	//자동으로 생성시 VO에 의존하여 리스트 출력
	
	

%>
<%-- [
<%
for(int i=0; i<list.size(); i++){
	LprodVO vo = list.get(i);
	if(i>0) out.print(",");
%>	
	{
		"lprod_gu" : "<%= vo.getLprod_gu() %>",
		"lprod_nm" : "<%= vo.getLprod_nm() %>"
	}
<%	
}
%>
] --%>
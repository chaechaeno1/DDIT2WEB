<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
//서블릿에서 저장한 데이터 꺼내기

int res = (Integer)request.getAttribute("res"); 
//서블릿에서 저장한 request.setAttribute("res", res);과 이름 일치
String name = (String)request.getAttribute("name");

if(res>0){
%>	
	{
		"sw"	: "<%=name%>님, 가입을 축하합니다!"
	}
<%}else{%>
	
	{
		"sw"	: "가입 실패..."
	}
	
<% 	
}
%>
	
	









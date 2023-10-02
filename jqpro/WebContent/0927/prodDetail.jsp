<%@page import="kr.or.ddit.prod.vo.ProdVO"%>
<%@page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
//서블릿에서 저장한 데이터 꺼내기

ProdVO vo = (ProdVO)request.getAttribute("pid");
Gson gson = new Gson();
String result = gson.toJson(vo);  
out.print(result);
    
 %>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//클라이언트에서 전송 되는 값을 받는다 - id, pass
	String userId = request.getParameter("id");
	String userPass = request.getParameter("pass");
	
	//db에서 member테이블에서 id와 pass가 일치 하는 사람 검색
	
	

%>
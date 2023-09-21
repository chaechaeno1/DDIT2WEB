<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <!-- jsp설정 코드이므로 지우면 안됨 -->

<!-- xml, json, text, html...
주로 xml, json을 쓰는데 오류가 날 수 있으므로 기존에 생성된 html 코드 다 지워줌 -->

<%
	request.setCharacterEncoding("UTF-8");
	String userName = request.getParameter("name");
	String userAddr = request.getParameter("addr");
	String userPass = request.getParameter("pass");
%>
	<p> <%= userName%></p>
	<p> <%= userAddr%></p>
	<p> <%= userPass%></p>
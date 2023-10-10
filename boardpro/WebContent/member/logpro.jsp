<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//로그인 체크 - session값을 얻어 온다.
	//jsp에서는 session객체가 이미 선언되어있음
	//request - 한 페이지에서만 적용
	//session - 로그아웃하기 전까지는 다른 페이지에서도 로그인 상태가 적용
	MemberVO vo = (MemberVO)session.getAttribute("loginok");
	String check = (String)session.getAttribute("check");
	
	if(vo == null){ // 로그인 안했을 때 -> 로그인폼 보여줘야함
%>
	<input type="text" id="id" placeholder="id">
	<input type="password" placeholder="pass">
	<button type="button" id="login">로그인</button><br>	

		
<%	}else if(vo != null){ // 로그인 되어있을 때 -> 로그아웃폼 보여줘야함%>
	<span><%= vo.getMem_id()%>님 환영합니다!</span>
	<button type="button" id="logout">로그아웃</button><br>	

<%		
	}
		
	if(check == "false"){ // 로그인 오류일 때
%>	
	<span id="check">로그인 오류 또는 비회원입니다.</span>

	
<%		
	}
%>
</body>
</html>
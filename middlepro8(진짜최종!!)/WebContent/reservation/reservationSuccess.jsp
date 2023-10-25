<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<title>메인페이지</title>
<link rel="icon" href="<%=request.getContextPath()%>/images/favicon.ico">
<script src="../js/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="../css/reservationSuccess.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>


</head>
<body>
			<%
    		// 로그인 체크 - 서블릿에서 저장한 session값을 얻어온다
    		MemberVO vo = (MemberVO)session.getAttribute("loginMember");
    		
    		%>

		<!-- 섹션에 만들었던 부분 넣어주시면 됩니다 -->
		<section>
					
			<div id="ressus">
				<h2><span id="name"><%=vo.getMem_name() %></span>님, <br>
				예약이 완료되었습니다.</h2>
				<br><br>
				<p>예약 정보는 <b>‘마이페이지-예약조회’</b>에서<br>
				확인하실 수 있습니다.
				</p>
			</div>
		
		</section>


</body>
</html>
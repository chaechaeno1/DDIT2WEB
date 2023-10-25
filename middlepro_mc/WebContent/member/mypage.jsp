<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<script src="../js/jquery-3.7.1.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="../css/basic.css">
<style>

/* 타이틀 CSS */
#titleImg{
  width: 100%;
  height: 300px;
  position: relative;
}
#titleImg > img {
  width: 100%;
  height: 300px;
  object-fit: cover;
  position: absolute;
  top: 0;
  left: 0;
  z-index: -1;
  opacity: 0.8;
}
#titleImg h1 {
  color: #ffffff;
  font-size: 50px;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  margin: 0;
}

#mypageDiv {
	border: 3px groove #d6d46d;
	margin : 60px auto;
	min-width : 1140px;
	width : 70%;
	display: flex;
	flex-direction: row;
}

#left {
	border: 1px dotted #d6d46d;
	float : left;
	width : 30%;
}

#left ul {
	list-style: none;
	padding-left: 0px;
}

section#sectionIfr  {
	width : 70%;
}
#left li{
	border: 1px dotted #ffffff;
}
#left li:hover {
	background: #d6d46d;
	font-size: 22px;
}

iframe {
	border: 1px dotted #d6d46d;
	margin : 0 auto;
	width : 100%;
	height : 800px;
}
.list-group{
	margin: 30px;
}

.list-group-item{
	height: 60px;
	display: flex;
    flex-wrap: wrap;
    align-content: center;
    font-size: 20px;
}
</style>
<script>
$(function() {
	$('#header').load("../main/header.jsp");
	$('#footer').load("../main/footer.jsp");
	
	<%
	// 로그인 체크 - 서블릿에서 저장한 session값을 얻어온다
	MemberVO vo = (MemberVO)session.getAttribute("loginMember");
	
	// 비로그인 시 마이페이지 접근 => main페이지로 보냄
	if(vo==null) {
	%>
		alert("잘못된 접근입니다.");
		location.href="<%=request.getContextPath()%>/main/mainPage.jsp";
	<%
	} 
	%>
	
})
</script>
</head>
<body>
<header id="header"></header>

  <div id="titleImg">
	<h1>마이페이지</h1>
	<img src="../images/camp04.jpg"alt="" />
  </div>

<section id="mypageDiv">


	<aside id="left">
	  <ul class="list-group">
	  	<li class="list-group-item"><a href="../member/selectMyinfo.jsp" target="ifr">내 정보 조회</a></li>
	  	<li class="list-group-item"><a href="../member/updateMyinfo.jsp" target="ifr">내 정보 수정</a></li>
	  	<ul>
		  	<li class="list-group-item">예약 내역</li>
		  	<li class="list-group-item"><a href="../member/reservationinfo.jsp" target="ifr">&nbsp;&nbsp;- 예약 조회</a></li>
		  	<li class="list-group-item"><a href="../member/reservationcancelinfo.jsp" target="ifr">&nbsp;&nbsp;- 취소 내역 조회</a></li>
	  	</ul>
	  	
	  	
	  	<li class="list-group-item"><a href="../member/deleteMyinfo.jsp" target="ifr">회원탈퇴</a></li>
	  </ul>
	</aside>
	<section id="sectionIfr">
	  	<iframe src="../member/selectMyinfo.jsp" name="ifr"></iframe>
	</section> 
</section>
<footer id="footer"></footer>

</body>
</html>
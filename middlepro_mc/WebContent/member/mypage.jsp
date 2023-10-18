<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.7.1.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="../css/basic.css">
<style>
#mypageDiv {
	border: 2px solid red;
	margin : 60px auto;
	min-width : 1140px;
	width : 70%;
	display: flex;
	flex-direction: row;
}

#left {
	border: 2px solid green;
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

#left li:hover {
	background: #d6d46d;
	font-size: 1.1em;
}

iframe {
	margin : 0 auto;
	width : 100%;
	height : 800px;
}
</style>
<script>
$(function() {
	$('#header').load("../main/header.jsp");
	$('#footer').load("../main/footer.jsp");
})
</script>
</head>
<body>
<header id="header"></header>
<section id="mypageDiv">
	<aside id="left">
	  <h4 style="margin-bottom : 50px;">마이페이지</h4>
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
	  	<iframe src="../member/selectMyinfo.jsp" id="ifr" name="ifr"></iframe>
	</section> 
</section>
<footer id="footer"></footer>

</body>
</html>
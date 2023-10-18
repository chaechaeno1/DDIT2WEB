<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인페이지</title>
<script src="<%=request.getContextPath()%>/js/jquery-3.7.1.min.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/basic.css" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
<script type="text/javascript">
	$(function() {
		/* 검색 input 이벤트 */
		$('#searchbtn').on('click', function() {
			$(this).prev().toggleClass("on");
		})
		/* 메뉴 마우스후버 이벤트 */
		$('.submenu>li').on('mouseover', function() { 
		    $(this).find('span').addClass("bck");
		});
		$('.submenu>li').on('mouseout', function() {
		    $(this).find('span').removeClass("bck");
		});
	})
</script>
<style type="text/css">
html {
	height: 100%;
}
body {
	height: 100%;
	box-sizing: border-box;
}
header {
	width: 100%;
	padding: 15px 10%;
	display: flex;
	flex-direction: row;
    justify-content: space-between;
    background: #d6d46d;
}
header * {
    color: #4d2222;
}
header>p {
	font-size: 25px;
	line-height: 50px;
}
header span {
	padding: 12px 0;
}
header #log {
	display: flex;
	flex-direction: row;
}
#logsearch {
	display: flex;
	flex-direction: row;
	position: relative;
}
#logsearch input {
	width: 0;
	visibility: hidden;
	margin: auto 3px;
	padding: 7px 10px;
	position: absolute;
	top: 13px;
	left: 150%;
	transform: translateX(-150%);
	transition: all 0.5s;
	border: 1px solid #9A4444;
	border-radius: 10px;
}
#logsearch input.on {
	width:  130px;
	visibility: visible;
	display: inline-block;
}
.symbol {
	cursor: pointer;
	margin-left: 20px;
}
header span.material-symbols-outlined {
	font-size: 30px;
}
#container {
	width: 100%;
	height: 100%;
	display: flex;
}
#sidemenu {
	height: 100%;
	flex: 18%;
	background: #f1f0cb;
	padding: 2%;
	overflow: hidden;
}
#sidemenu * {
    color: #4d2222;
}
#sidemenu a {
    font-size: 1rem;
}
#sidemenu h3 {
	font-size: 18px;
	font-weight: bolder;
	display: inline-block;
	position: absolute;
	top: 10px;
	left: 50px;
	margin: 0;
}
#section {
	flex: 82%;
	background: #fff;
}
.submenu {
	position: absolute;
	top: 30px;
	left: 40px;
}
#sidemenu .lif {
	height: 155px;
	position: relative;
}
.lif > span {
	position: relative;
	top: 7px;
	left: 0;
}
.submenu li {
	margin: 20px 10px;
	position: relative;
}
.submenu li a {
	position: inherit;
	z-index: 10;
	transition: all 0.4s;
}
.submenu li:hover a{
	color: #f1f0cb !important;
}
.submenu li span {
	transition: all 0.5s;
}
#second {
	margin-bottom: 30px;
}
span.bck {
    display: inline-block;
    background: #4d2222;
    width: 400%;
    height: 39px;
    position: absolute;
    top: -13px;
    left: -80%;
    z-index: 1;
}
</style>
</head>
<body>
	<!-- 헤더 -->
	<header id="header">
		<div id="logo">
			<img alt="" src="<%=request.getContextPath()%>/images/perm_logo.png">
		</div>
		<p>슬기로운 캠핑생활 캠핑장 관리자 프로그램</p>
		<div id="log">
			<div id="logsearch">
				<input type="text" placeholder="검색어 입력">
				<p id="searchbtn" title="검색">
					<span class="material-symbols-outlined symbol">search</span>
				</p>
			</div>
			<p title="로그아웃">
				<span class="material-symbols-outlined symbol">logout</span>
			</p>
			<p title="이용자사이트로가기">
				<a href="<%=request.getContextPath()%>/main/mainPage.jsp"><span
					class="material-symbols-outlined symbol"> home </span></a>
			</p>
		</div>
	</header>
	<!-- 헤더 아래 모두 -->
	<div id="container">
		<div id="sidemenu">
			<ul>
				<li class="lif">
					<span class="material-symbols-outlined">camping</span>
					<h3>
						캠핑장 예약 관리
					</h3>
					<ul class="submenu">
						<li><span></span><a href="../admin/adminResMain.jsp" id="info">예약 현황 조회</a></li>
						<li><span></span><a href="../admin/adminResManage.jsp" id="manage">예약가능 여부 관리</a></li>
					</ul>
				</li>
				<li class="lif" id="second">
					<span class="material-symbols-outlined">assignment</span>
					<h3>
						게시판 관리
					</h3>
					<ul class="submenu">
						<li><span></span><a href="#">이용후기 게시판 댓글 관리</a></li>
						<li><span></span><a href="#">FAQ 게시판</a></li>
						<li><span></span><a href="#">공지사항 게시판</a></li>
					</ul>
				</li>
				<li class="lif">
					<span class="material-symbols-outlined">paid</span>
					<h3>
						매출 관리
					</h3>
					<ul class="submenu">
						<li><span></span><a href="#">날짜별 매출 조회</a></li>
					</ul>
				</li>
			</ul>
		</div>
		<!-- **만든 부분** -->
		<div id="section">
			<!-- 이 곳입니다 ! -->
		</div>
	</div>
</body>
</html>
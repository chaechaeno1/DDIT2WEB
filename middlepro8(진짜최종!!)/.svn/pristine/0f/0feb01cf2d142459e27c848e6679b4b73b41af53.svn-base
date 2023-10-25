<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%=request.getContextPath()%>/js/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/basic.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin.css" />
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>
<script src="<%=request.getContextPath()%>/js/adminNotice.js"></script>

<script type="text/javascript">
$(function() {

	/* 메인페이지 매출관리 출력 */
	

	/* 검색 input 이벤트 */
	$('#searchbtn').on('click', function() {
		$(this).prev().toggleClass("on");
	})
	
	
	
})
</script>
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
				<a href="<%=request.getContextPath()%>/login/adminlogin.jsp">
				<span class="material-symbols-outlined symbol">logout</span></a>
			</p>
			<p title="이용자사이트로가기">
				<a href="<%=request.getContextPath()%>/main/mainPage.jsp"><span
					class="material-symbols-outlined symbol"> home </span></a>
			</p>
		</div>
	</header>
</body>
</html>
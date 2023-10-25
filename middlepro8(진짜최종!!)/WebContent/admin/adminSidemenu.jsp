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
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>
<script src="<%= request.getContextPath()%>/js/jquery.serializejson.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/basic.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin.css" />

<script src="../js/adminFAQ.js"></script>
<script src="../js/mem.js"></script>
<script src="<%=request.getContextPath()%>/js/adminNotice.js"></script>


<style>
#cpageno {
	background-color: #e4c2c2 !important;
}
.pageno{
	color: black;
}
</style>

<script type="text/javascript">




$(function() {

	/* 메뉴 마우스후버 이벤트 */
	$('.submenu>li').on('mouseover', function() {
	    $(this).find('span').addClass("bck");
	});
	$('.submenu>li').on('mouseout', function() {
	    $(this).find('span').removeClass("bck");
	});
	
	/* 클릭한 메뉴의 data-url 속성에 따라 #section 안에서 html 이동 */
	$('a.alink').on('click', function(e) {
	    e.preventDefault(); // 기본 링크 동작을 중단

	    var url = $(this).data('url'); // 해당 링크의 data-url 속성을 가져옴

	   	location.href=url;
	});
})
</script>
</head>
<body>
	<div id="sidemenu">
		<ul>
			<li class="lif"><span class="material-symbols-outlined">paid</span>
				<h3>매출 관리</h3>
				<ul class="submenu">
					<li><span></span><a class="alink"
						data-url="<%=request.getContextPath()%>/admin/sale.jsp">날짜별 매출
							조회</a></li>
				</ul></li>
			<li class="lif"><span class="material-symbols-outlined">camping</span>
				<h3>캠핑장 예약 관리</h3>
				<ul class="submenu">
					<li><span></span><a class="alink"
						data-url="<%=request.getContextPath()%>/admin/adminResMain.jsp">예약
							현황 조회</a></li>
				</ul></li>
			<li class="lif" id="second"><span
				class="material-symbols-outlined">assignment</span>
				<h3>게시판 관리</h3>
				<ul class="submenu">
					<li><span></span><a class="alink"
						data-url="<%=request.getContextPath()%>/admin/adminFAQ.jsp">FAQ
							게시판</a></li>
					<li><span></span><a class="alink"
						data-url="<%=request.getContextPath()%>/admin/adminNotice.jsp">공지사항
							게시판</a></li>
				</ul></li>	
			<li class="lif">
					<span class="material-symbols-outlined">person</span>
					<h3>회원 관리</h3>
					<ul class="submenu">
						<li><span></span><a class="alink" data-url="<%=request.getContextPath()%>/admin/memberList.jsp">회원 정보 조회</a></li>
					</ul>
				</li>
				
				


		</ul>
	</div>
</body>
</html>
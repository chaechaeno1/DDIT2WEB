<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="icon" href="<%=request.getContextPath()%>/images/favicon.ico">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/basic.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/NOTICE.css" />
<script src="<%=request.getContextPath()%>/js/jquery-3.7.1.min.js"></script>
<script src="<%=request.getContextPath()%>/js/notice.js"></script>

<script>
mypath = "<%=request.getContextPath()%>";
currentpage = 1;
$(function(){
	
	$(document).on("mouseenter", ".menuitem", function () {
	    // 마우스를 올렸을 때
	    $(".submenu").css({ visibility: "visible", height: "130px" });
	    $(".subbck").css({ visibility: "visible", height: "130px" });
	});

	$(document).on("mouseleave", ".menuitem", function () {
	    // 마우스를 벗어났을 때
	    $(".submenu").css({ visibility: "hidden", height: "0" });
	    $(".subbck").css({ visibility: "hidden", height: "0" });
	});




	$.listNoticeServer(currentpage);

	// 페이지 번호 클릭 이벤트
	$(document).on('click', '.pageno', function() {
		currentpage = parseInt($(this).text().trim());
		$.listNoticeServer(currentpage);
	});

	// 다음 클릭 이벤트
	$(document).on('click', '#next', function() {
		currentpage = parseInt($('.pageno').last().text()) + 1;
		$.listNoticeServer(currentpage);
	});

	// 이전 클릭 이벤트
	$(document).on('click', '#prev', function() {
		currentpage = parseInt($('.pageno').first().text()) - 1;
		$.listNoticeServer(currentpage);
	});

	// search검색 이벤트
	$('#searchBtn').on('click', function() {
		currentpage = 1;
		$.listNoticeServer(currentpage);
	});

	// 하나의 공지 게시글에 대한 이벤트
	$(document).on('click', '.action', function() {

		target = $(this); // 전역변수. board.js에서도 사용 가능
		vname = $(this).attr('name'); // 어떤 것을 눌렀는지 구별
		vidx = $(this).attr('idx'); // ajax에서 데이터로 넘어갈 값

		// 제목 클릭 - 내용 열리도록
		if (vname == "title") {
			// 제목(p) 다음 요소인 내용(div)
			contentDiv = $(this).next("div.panel-faq-answer");

			//contentDiv.toggleClass("active"); // 클래스 추가/삭제
			
			if (contentDiv.hasClass("active")) {
	             contentDiv.removeClass("active"); // 이미 열려있는 경우 닫기
	         } else {
	             // 다른 활성화된 게시물이 있을 경우 닫기
	             $(".panel-faq-answer.active").removeClass("active");
	             contentDiv.addClass("active"); // 열기
	         }

			// active 클래스를 가지고 있는지 확인
			isOpen = contentDiv.hasClass("active");

			if (isOpen) {
				// 펼쳐져 있으면 조회수 증가
				$.updateHitServer();
			}
		}

	});
});

window.addEventListener('load', function () {
        // 헤더 로드
        var headerElement = document.getElementById('header');
        var headerPath = '<%=request.getContextPath()%>/main/header.jsp';
        loadInclude(headerElement, headerPath);

        // 푸터 로드
        var footerElement = document.getElementById('footer');
        var footerPath = '<%=request.getContextPath()%>/main/footer.jsp';
        loadInclude(footerElement, footerPath);
    });

function loadInclude(element, path) {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            element.innerHTML = this.responseText;
        }
    };
    xhttp.open('GET', path, true);
    xhttp.send();
}
</script>
</head>


<body>

	<!-- 헤더(고정)!! -->
	<header id="header"></header>


	<section id="NOTICE">

		<div id="titleImg">
			<h1>공지사항</h1>
			<img src="../images/imageSlide04.jpg" alt="" />
		</div>


		<table>

			<thead>
				<tr>
					<th id="num">번호</th>
					<th id="subject">제목</th>
					<th id="date">등록일</th>
					<th id="hit">조회수</th>
				</tr>
			</thead>


			<!-- 게시물 시작 -->
			<tbody>

				<!--------------------- 게시물 내용이 나올 부분 --------------------->

			</tbody>
		</table>
		<br>


		<!-- 하단 페이징 처리 -->
		<div class="paging"></div>

		<div id="search">
			<select class="form-select" id="stype" style="width: 100px;">
				<option value="">전체</option>
				<option value="notice_title">제목</option>
				<option value="notice_content">내용</option>
			</select>&nbsp;&nbsp; <input type="text" size="40" id="sword">&nbsp;&nbsp;
			<button id="searchBtn" type="button" class="btn btn-sm">검색</button>
		</div>


	</section>


	<!-- 푸터(고정) -->
	<footer id="footer"></footer>
</body>
</html>
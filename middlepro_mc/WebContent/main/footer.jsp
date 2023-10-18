<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Footer</title>
<script src="<%=request.getContextPath()%>/js/jquery-3.7.1.min.js"></script>
<style>
/* 푸터 */
footer {
	position: relative;
	width: 100%;
	height: auto;
	bottom: 0;
	background: #616031;
	padding: 20px;
	padding-left: 40px;
	box-sizing: border-box;
}

footer * {
	color: #f1f0cb;
	text-align: left;
}

#footcontent span {
	font-size: 11px;
	line-height: 30px;
}
</style>
</head>
<body>
	<!-- 푸터 -->
	<footer>
		<div id="footlogo">
			<a href="<%=request.getContextPath()%>/main/mainPage.jsp"><img
				src="<%=request.getContextPath()%>/images/perm_logo.png" alt="perm_logo" /></a>
		</div>
		<div id="footcontent">
			<p>
				<span>상호명: ㈜여행문화학교산책 대청호지점</span> <span> ㅣ </span> <span>대표자:
					김성선</span> <span>사업자등록번호: 781-85-02064</span> <span> ㅣ </span> <span>통신판매신고번호:
					제2022-대전대덕-0371호</span> <span> ㅣ </span> <span>호스팅제공자: (주)코덱스브리지</span>
			</p>
			<p>
				<span>대표번호: 042-933-6575</span> <span> ㅣ </span> <span>주소:
					대전광역시 대덕구 대청로424번길 200(미호동)</span> <span>문의시간: 9:00~19:00</span> <span>
					ㅣ </span> <span>점심시간: 12:00~13:30</span>
			</p>
			<p>
				<span>Copyright © 2020 대청호로하스캠핑장. All rights reserved.</span>
			</p>
		</div>
	</footer>
</body>
</html>
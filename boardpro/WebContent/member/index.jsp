<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 외부 CSS -->
<link rel="stylesheet" href="../css/logpro.css">
<!-- <link rel="stylesheet" href="http://192.168.36.109/boardpro/css/logpro.css">
<link rel="stylesheet" href="http://localhost/boardpro/css/logpro.css"> -->

</head>
<body>

<header>
	<div class="dlog">
		<!-- 로그인/로그아웃 - httpSession을 이용하여 로그인폼 또는 로그아웃폼을 삽입 
		logpro.jsp를 실행 시킨 결과물을 현재 페이지에 삽입.
		로그인 안했을때 -> 로그인 표시
		로그인 했을때 -> 로그아웃 표시 -->
		<jsp:include page="logpro.jsp"></jsp:include>
	</div>
	<br>
	<a href="join.jsp" target="iboard">회원가입</a>&nbsp;&nbsp;&nbsp;
	<a href="../board/board.jsp" target="iboard">게시판</a> 
	<!-- ../board/board.jsp 로 만들거임 -->
</header>

	<section>
		<iframe name="iboard" src="../board/board.jsp"></iframe>
	</section>

</body>
</html>
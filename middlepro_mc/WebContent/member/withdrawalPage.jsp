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
section {
	text-align: center;
	margin : 0 auto;
	padding : 150px 0;
}

.pageTitle {
	text-align: center;
	margin-bottom : 50px;
	margin-top : 50px;
}
</style>
<script>
$(function() {
	$('#header').load("../main/header.jsp");
	$('#footer').load("../main/footer.jsp");
	
	$('button').on('click', function() {
		 window.top.location.href = "<%=request.getContextPath()%>/main/mainPage.jsp";
	});
});
</script>
</head>
<body>
<header id="header"></header>
<section>
  <h2 class="pageTitle"><span style="color : red;">회원탈퇴</span>가 완료되었습니다.</h2>
	
  <h4>그동안 ‘슬기로운 캠핑생활’을<br>이용해 주셔서 감사합니다</h4>
  <br><br>
  <button>홈으로</button>
</section>
<footer id="footer"></footer>
</body>
</html>
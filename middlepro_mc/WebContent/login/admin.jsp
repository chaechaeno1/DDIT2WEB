<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%=request.getContextPath()%>/js/jquery-3.7.1.min.js"></script>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/basic.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/adminlogin.css" />


<script >
$(function () {
	

$("#header").load("<%=request.getContextPath()%>/main/header.jsp");
$("#footer").load("<%=request.getContextPath()%>/main/footer.jsp");
})
</script>
</head>
<body>




	<main id="main-holder">
		<h1 id="login-header">관리자 로그인</h1>

		<form id="login-form">
			<div id="div1">
				<input type="text" name="username" id="username-field"
					class="login-form-field" placeholder="아이디"> <input
					type="password" name="password" id="password-field"
					class="login-form-field" placeholder="비밀번호">

			</div>

			<input type="submit" value="로그인" id="login-form-submit">

</body>
</html>
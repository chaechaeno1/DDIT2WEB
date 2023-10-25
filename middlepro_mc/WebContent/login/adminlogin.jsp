<%@page import="kr.or.ddit.vo.AdminVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%=request.getContextPath()%>/js/jquery-3.7.1.min.js"></script>
<%-- <link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/basic.css" /> --%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/basic.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/adminlogin.css" />


<script>
	$(document).ready(function() {
		
		
		$('#login-form-submit').on('click',function(){
			 aid = $('#adminid').val().trim();
			 apw = $('#adminpassword').val().trim();
			
			$.ajax({
	    		url : '<%=request.getContextPath()%>/adminIdLogin.do',
 		    	data : { "admin_id" : aid, "admin_pass" : apw },
		    	type : 'post',
		    	dataType : 'json',
		    	success : function(result){
		    		console.log(result);
		    		if(result == "성공") {
		    			location.href="<%= request.getContextPath()%>/admin/adminMain.jsp";
		    		} else if (result == "실패") {
		    			alert("로그인 실패");
		    		}
		    	},
		    	error : function(xhr){
		    		alert("상태 :" + xhr.status);
		    	}
	    	});
			
		})
		
		
		
	})
</script>
</head>

<body>

	<main id="main-holder">
		<h1 id="login-header">관리자 로그인</h1>

		<form id="login-form">
			<div id="div1">
				<input type="text" name="username" id="adminid"
					class="login-form-field" placeholder="아이디"> <input
					type="password" name="password" id="adminpassword"
					class="login-form-field" placeholder="비밀번호">
			</div>
			<input type="button" value="로그인" id="login-form-submit">
</body>
</html>
<%@page import="kr.or.ddit.vo.MemberVO"%>
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
<link rel="stylesheet" href="../css/mypage_iframe.css">
<style>
#myinfo_list * {
	text-align: left;
}

.info_field {
	display : inline-block;
	width : 200px;
}

li {
	margin : 15px;
}
</style>
</head>
<body>
<%
	// 로그인 체크 - 서블릿에서 저장한 session값을 얻어온다
	MemberVO vo = (MemberVO)session.getAttribute("loginMember");

%>
<div class="infoIframeDiv">
	<h2 class="pageTitle">내 정보 조회</h2>

	<div id="myinfo_list">
		<ul class="list-group list-group-flush">
		    <li class="list-group-item">
		    	<span class="info_field">아이디</span>
		    	<span><%=vo.getMem_id() %></span>
		    </li>
		    <li class="list-group-item">
		    	<span class="info_field">이 름</span>
		    	<span><%=vo.getMem_name() %></span>
		    </li>
		    <li class="list-group-item">
		    	<span class="info_field">생년월일</span>
		    	<span><%= vo.getMem_bir() %></span>
		    </li>
		    <li class="list-group-item">
		    	<span class="info_field">연락처</span>
		    	<span><%= vo.getMem_hp() %></span>
		    </li>
		    <li class="list-group-item">
		    	<span class="info_field">이메일</span>
		    	<span><%= vo.getMem_mail() %></span>
		    </li>
		    <li class="list-group-item">
		    	<span class="info_field">우편번호</span>
		    	<span><%=vo.getMem_zip() %></span>
		    </li>
		    <li class="list-group-item">
		    	<span class="info_field">주소</span>
		    	<span><%=vo.getMem_addr1() %></span>
		    </li>
		    <li class="list-group-item">
		    	<span class="info_field">상세주소</span>
		    	<span><%=vo.getMem_addr2() %></span>
		    </li>
		</ul>
	</div>
</div>


</body>
</html>
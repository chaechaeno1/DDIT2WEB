<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="../js/jquery-3.7.1.min.js"></script>
<!-- <script src="http://localhost/boardpro/js/jquery-3.7.1.min.js"></script> -->

<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>


<script>
$(function(){
	//로그인
	$('#login').on('click',function(){ /* () => */
		//입력한 id와 pass값을 가져오기
		idvalue = $('#id').val().trim();
		passvalue = $('#pass').val().trim();
		
		//입력데이터 형식 체크 - 정규식
		
		//로그인처리 - 서버
		$.ajax({
			url : '<%= request.getContextPath()%>/Logpro.do',
			data : { "id":idvalue, "pass":passvalue},
			type : 'post',
			success : function(res){
				location.href = "<%=request.getContextPath()%>/member/index.jsp"
					
			},
			error : function(xhr){
				alert("상태 : "+xhr.status)
				
			},
			dataType : 'html'
		
		})
		
		
		
	})
	
	//로그아웃
	$('#logout').on('click', function(){
		$.ajax({
			url : "<%=request.getContextPath()%>/LogOut.do",
			type : 'get',
			success : function(res){
				location.href = "<%=request.getContextPath()%>/member/index.jsp"
				
			},
			error : function(xhr){
				alert("상태 : " + xhr.status);
			},
			dataType : 'html'
			
		})
		
		
		
	})
	
	
	
	
})
</script>



</head>
<body>
<%
	//로그인 체크 - 서블릿에서 저장한 session값을 얻어 온다.
	//jsp에서는 session객체가 이미 선언되어있음
	//request - 한 페이지에서만 적용
	//session - 로그아웃하기 전까지는 다른 페이지에서도 로그인 상태가 적용
	MemberVO vo = (MemberVO)session.getAttribute("loginok"); // controller에서 사용할 name값
	String check = (String)session.getAttribute("check"); // controller에서 사용할 name값
	
	if(vo == null){ // 로그인 안했을 때 -> 로그인폼 보여줘야함
%>
	<input type="text" id="id" placeholder="id">
	<input type="password" id="pass" placeholder="pass">
	<button type="button" id="login" class="btn btn-primary btn-sm">로그인</button><br>	

		
<%	}else if(vo != null){ // 로그인 되어있을 때 -> 로그아웃폼 보여줘야함%>
	<span><%= vo.getMem_id()%>님 환영합니다!</span>
	<button type="button" id="logout" class="btn btn-danger btn-sm">로그아웃</button><br>	

<%		
	}
		
	if(check == "false"){ // 로그인 오류일 때
%>	
	<span id="check">로그인 오류 또는 비회원입니다.</span>

	
<%		
	}
%>
</body>
</html>
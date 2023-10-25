<%@page import="kr.or.ddit.vo.AdminVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인</title>
<link rel="icon" href="<%=request.getContextPath()%>/images/favicon_admin.ico">
<script src="<%=request.getContextPath()%>/js/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/adminlogin.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/basic.css" />


<script>
	$(document).ready(function() {
		
		
		$('#login').on('click',function(){
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
			
		});
		
	});
</script>
</head>

<body>
   <section id="userlogin">
   <!-- <main id="main-holder"> -->
   
   <div id="main-holder">
      <div id="test">
      
         <form id="login-form">
         
         	
         
            <div id="div1">
            	<h1 id="login-header">운영자 LOGIN</h1>
               <input type="text" id="adminid" class="login-form-field" placeholder="아이디"> 
               <input type="password" id="adminpassword" class="login-form-field" placeholder="비밀번호">
            </div>
            <input type="button" value="로그인" id="login">
         </form>
         
       </div>

   </div>

   </section>
   
   
</body>
</html>
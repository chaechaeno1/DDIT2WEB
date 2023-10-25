<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주 묻는 질문</title>
<link rel="icon" href="<%=request.getContextPath()%>/images/favicon.ico">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="<%= request.getContextPath()%>/js/jquery-3.7.1.min.js"></script>	
<script src="<%= request.getContextPath()%>/js/jquery.serializejson.min.js"></script>
<script src="../js/FAQ.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/basic.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/FAQ.css" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />


<script>

mypath = "<%= request.getContextPath()%>";
currentpage = 1;

/* $(document).ready(() => {
    // FAQ 패널 클릭에 대한 이벤트 리스너
    $(".panel-faq-container").click(function() {
    	
    	
    	
        $(this).find(".panel-faq-answer").toggleClass('active');
    });
});

 */

 
	



$(function(){
	
	$("#header").load("<%=request.getContextPath()%>/main/header.jsp");
	$("#footer").load("<%=request.getContextPath()%>/main/footer.jsp");
		
		$("#file").on('change',function(){
			  var fileName = $("#file").val();
			  $(".upload-name").val(fileName);
		});

	
	
	
	
	 //실행 하자 마자 리스트 출력  - stype, sword없다 
	  $.listFAQServer(currentpage);
	  
	
	 
	  
	  
	  //제목클릭
	  $(document).on('click', '.action', function(){
		
		 target = $(this);
		  
		  vname = $(this).attr('name');
		  vidx = $(this).attr('idx');
		  
		  if(vname == "title"){
			  // 제목(p) 다음 요소인 내용(div)
	         contentDiv = $(this).next(".panel-faq-answer");
	          
	         if (contentDiv.hasClass("active")) {
	             contentDiv.removeClass("active"); // 이미 열려있는 경우 닫기
	         } else {
	             // 다른 활성화된 게시물이 있을 경우 닫기
	             $(".panel-faq-answer.active").removeClass("active");
	             contentDiv.addClass("active"); // 열기
	         }
		
		 
		  }
		  	  
	  })// click 이벤트 

	  
})  //$(function)


</script>
	

<!-- ** adminReview CSS ** -->
<style>
section #FAQ{ 
	width: 80%;
	height: 100%;
	margin: 60px auto;
	overflow: auto;
}

#FAQ h1{
	font-size: 35px;
	text-align: center;
	margin: 25px 0;
	color: #4d2222;
}

/* 추가된 CSS */


#bcont, #ncont{
	width: 100%;
	resize: none;
	padding: 15px;
}
label{
	display : inline-block;
	width : 50px;
}


</style>
</head>
<body>

<header id="header"></header>
	
	<!-- 메뉴타이틀 & 배경 -->
	<div id="titleImg">
		<h1>자주묻는질문</h1>
		<img src="<%=request.getContextPath()%>/images/imageSlide03.jpg" alt="" />
	</div>


		<!-- 공지사항 게시물 -->
		<section id="FAQ">
			
			
           
              
              
              <!-- 게시물 시작 -->
              
          	<div id="FAQtable"></div>
          	<br>
            

       

	</section>
<footer id="footer"></footer>
</body>
</html>
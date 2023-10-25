<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 :: FAQ 관리</title>
<link rel="icon" href="<%=request.getContextPath()%>/images/favicon_admin.ico">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="<%= request.getContextPath()%>/js/jquery-3.7.1.min.js"></script>	
<script src="<%= request.getContextPath()%>/js/jquery.serializejson.min.js"></script>
<script src="../js/adminFAQ.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="../css/FAQ.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin.css" />


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
	 //실행 하자 마자 리스트 출력  - stype, sword없다 
	  $.listFAQServer(currentpage);
	  
	/*   //페이지 번호 클릭 이벤트 
	  $(document).on('click', '.pageno', function(){
		  currentpage = parseInt($(this).text().trim());
		  $.listBoardServer(currentpage);
	  })
	  
	  //다음 클릭 이벤트 
	  $(document).on('click', '#next', function(){
		  currentpage =   parseInt( $('.pageno').last().text().trim() ) + 1;
		  $.listBoardServer(currentpage);
	  })
	  
	   //이전 클릭 이벤트 
	  $(document).on('click', '#prev', function(){
		  currentpage =   parseInt( $('.pageno').first().text().trim() ) - 1;
		  $.listBoardServer(currentpage);
	  })
	   */
	 
	   
	   
	   
	   // 관리자 로그인 상태
	 
	
	   
	   
	   
	   
	  
	  
	  //수정, 삭제, 제목클릭
	  $(document).on('click', '.action', function(){
		
		 target = $(this);
		  
		  vname = $(this).attr('name');
		  vidx = $(this).attr('idx');
		  
		  if(vname =="delete"){
			  if(confirm(vidx + "번째 글을 삭제합니다")) {
					$.deleteFAQServer();
				}
		
		  }else if(vname == "title"){
			  // 제목(p) 다음 요소인 내용(div)
	         contentDiv = $(this).next(".panel-faq-answer");
	          
	         if (contentDiv.hasClass("active")) {
	             contentDiv.removeClass("active"); // 이미 열려있는 경우 닫기
	         } else {
	             // 다른 활성화된 게시물이 있을 경우 닫기
	             $(".panel-faq-answer.active").removeClass("active");
	             contentDiv.addClass("active"); // 열기
	         }
		  }else if(vname == "modify"){
			 
			 
			 $('#updateFAQModal').modal("show");
			 
			 //본문의 내용을 가져오기 
			vparent =  $(this).parents('.panel-faq-container');
			 
			vsub =  vparent.find('.panel-faq-title').text().trim();
			vp3 =  vparent.find('.p3').html().trim();  //<br>태그가 포함 
			 
			 vp3 = vp3.replace(/<br>/g , "");
			
			 //수정 모달창에 출력하기 
			
			 $('#uform #nsubject').val(vsub);
			 $('#uform #ncont').val(vp3);
			 
			//글번호 를 hidden으로 모달창에 설정 
			 $('#uform #unum').val(vidx);
		
		 
		  }
		  
		  
		  
	  })// click 이벤트 
	  
	  
	  
	  

	  
	  
	  
	 
	  
	
	  //글쓰기 이벤트 - 
	  $('#FAQInsert').on('click', function(){
		  
		  $('#insertFAQModal').modal('show');

		  
	  })//글쓰기 끝
	  
	  
	  
	  
	  
	  //글쓰기 모달창 에서 글쓰기후 전송 버튼 클릭 이벤트 
	  $('#wsend').on('click', function(){
		
		//입력한 모든 값을 가져온다 -  data만들기
		vdata =  $('#nform').serializeJSON();
		
		 
		//ajax실행 - 
		$.insertFAQServer();
		
		//모달창 닫기 
		$('#insertFAQModal').modal('hide');
		
		//모달창 입력 내용 지우기
		$('#insertFAQModal .txt').val("");
		  
	  })
	  
	  
	  
	  
	  
	  //글 수정 모달창에서 수정 입력하고 전송버튼 클릭 이벤트 
	  $('#nsend').on('click', function(){
		
		  //수정입력된 모든 내용을 가져온다 
		  //data를 생성해서 서버로 보내기
		  //vdata = $('#uform').serializeArray();
		  vdata = $('#uform').serializeJSON();
		  
		  
		  //ajax실행 - db 수정완료 성공 하면 vdata의 내용으로 본문의 내용을 바꾼다 
		  $.updateFAQServer();
		  
		   //모달창 닫기 
		  $('#updateFAQModal').modal('hide');
	
			//모달창 입력 내용 지우기
		  $('#updateFAQModal .txt').val("");
	
	
			
	  })
	  
	  
	  
	  
	  
	  
	 
	  
	
	  
})  //$(function)








</script>
	




<!-- ** adminReview CSS ** -->
<style>
section #adminFAQ{ 
	width: 80%;
	height: 100%;
	margin: 60px auto;
	overflow: auto;
}

#adminFAQ h1{
	font-size: 35px;
	text-align: center;
	margin: 25px 0;
	color: #4d2222;
}

/* 추가된 CSS */
.pbtn{
	float: right;
	
}
.btn, #FAQInsert, #nsend, #wsend{
    padding: 7px 10px;
    background: #f1f0cb;
    border: none;
    border-radius: 10px;
    color: #4d2222;
}
#bcont, #ncont{
	width: 100%;
	resize: none;
	padding: 15px;
}
label{
	display : inline-block;
	width : 50px;
}
.modal-body{
	padding: 30px;
}
#nform, #uform{
	border: 2.5px solid #e4a47c;
	border-radius: 15px;
	padding: 20px;
}
div#FAQInsBtn {
	margin: 0 auto;
	width: 680px;
	display: flex;
    justify-content: flex-end;
}
table{
	margin: 30px auto !important;
}
th{
	border-top: 2px solid black !important;
	border-bottom: 2px solid gray !important;
}
td{
	padding-top: 17px !important;
	height: 50px !important;
	border-left: 0 !important;
	border-right: 0 !important;
	border-top: 1px solid black !important;
	border-bottom: 1px solid lightgray !important;		
}
input.action{
	padding: 7px 10px !important;
	background: #f1f0cb !important;
	border: none !important;
	border-radius: 10px !important;
	color: #4d2222 !important;
} 
</style>
</head>




<body>


<jsp:include page="adminHeader.jsp"></jsp:include>

<!-- 헤더 아래 모두 -->
	<div id="container">
		
		<!-- Include "adminMain.jsp"의 header 부분 -->
	    <jsp:include page="adminSidemenu.jsp"></jsp:include>


		<!-- 공지사항 게시물 -->
		<div id="section">
		<section id="adminFAQ">
			<h1>FAQ 관리</h1>
			
     
              <!-- 게시물 시작 -->
              
          	<div id="adminFAQtable"></div>
          	<br>
            
            <div id="FAQInsBtn">
				<input type="button" value="FAQ등록" id="FAQInsert" data-bs-toggle="modal" data-bs-target="#insertFAQModal"> 
			</div>
			
				</section>
			
	</div>	
	</div>	






      
<!-- 글쓰기 모달 -->

<div class="modal fade" id="insertFAQModal">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">

      <div class="modal-header">
        <h2>FAQ 등록</h2>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <div class="modal-body">
       <form name="nform" id="nform">
        
         <label>제목</label>
         <input type="text"  class="txt" name="faq_title" id="bsubject"><br><br>
              
         
         <label>내용</label><br><br>
         <textarea rows="10" class="txt" name="faq_content" id="bcont"></textarea>
        
         
       </form>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
         
         <div class="col text-center">
			<input type="button" class="btn" id="wsend" value="작성 완료"  data-bs-dismiss="modal" />
		</div>
      </div>

    </div>
  </div>
</div>
<!-- 글쓰기 모달 끝 -->	







<!-- 수정 모달 -->
<div class="modal fade" id="updateFAQModal">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">

      <div class="modal-header">
        <h2>FAQ 수정</h2>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <div class="modal-body">
       <form name="uform" id="uform">
       
        <input type="hidden" name="faq_no" id="unum" value="">
        
		<label>제목</label>
         <input type="text"  class="txt" name="faq_title" id="nsubject"><br><br>
       
         
         <label>내용</label><br><br>
         <textarea rows="10" class="txt" name="faq_content" id="ncont"></textarea>
        
         
       </form>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
         <div class="col text-center">
			<input type="button" class="btn" id="nsend" value="작성 완료"  data-bs-dismiss="modal" />
		</div>
      </div>

    </div>
  </div>
</div>
<!-- 수정 모달 끝 -->
		
       



</body>
</html>
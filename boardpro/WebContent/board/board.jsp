<%@page import="com.google.gson.Gson"%>
<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
 
 <script src="../js/jquery-3.7.1.min.js"></script>
 
 
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<script src="../js/board.js"></script>
<script src="../js/jquery.serializejson.min.js"></script>

<%
 //로그인 상태 체크 
   MemberVO  vo = (MemberVO)session.getAttribute("loginok");
  String ss = null;
  
   Gson gson = new Gson();
   if(vo != null) ss = gson.toJson(vo);
   /* ss ={  "mem_id" : "a001",
		     "mem_pass" : "asdfasdf",
		     "mem_name" : "김은대"
		  } 
   */
   
%>

<script>
 mvo = <%= ss %>  /* mvo.mem_id, mvo.mem_pass, mvo.mem_name */
 
 mypath = "<%= request.getContextPath()%>";
 currentpage = 1;
 reply  = { }; //객체  동적으로 추가 - reply.bonum , reply.name reply.cont
 
 $(function(){
	 //실행 하자 마자 리스트 출력  - stype, sword없다 
	  $.listBoardServer(currentpage);
	  
	  //페이지 번호 클릭 이벤트 
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
	  
	  //search검색 이벤트
	  $(document).on('click', '#search', function(){
	      currentpage = 1
	      $.listBoardServer(currentpage);
	  })
	  
	  
	  //수정, 삭제, 댓글등록 , 제목클릭, 댓글 삭제, 댓글 수정 이벤트
	  $(document).on('click', '.action', function(){
		
		 target = $(this);
		  
		  vname = $(this).attr('name');
		  vidx = $(this).attr('idx');
		  
		  if(vname =="delete"){
			  alert(vidx + "번 글을 삭제합니다" );
			  
			  //ajax실행 
			  $.deleteBoardServer();
			  
		  }else if(vname == "title"){
			 
			  //ajax수행  - 댓글 출력 
			  $.listReplyServer();
			  
			vaex  = $(this).attr('aria-expanded');
			if(vaex == "true"){
				//alert("조회수 증가");
				//ajax수행 -조회수 증가
				$.updateHitServer();
			}
			  
		  }else if(vname == "modify"){ //게시판 수정
			//alert(vidx + "번 글을 수정합니다") ;
		  
		  	$('#uModal').modal('show');
		  	
		  	
		  	
		  	//본문내용 가져오기
		  	vparent = $(this).parents('.card');
		  	vsub = vparent.find('a').text().trim();
		  	vpass = vparent.find('.bpass').text()
		  	vwr = vparent.find('.wr').text()
		  	vem = vparent.find('.em').text() 
		  	vp3 = vparent.find('.p3').html() //<br>태그가 포함
		  	vp3 = vp3.replace(/<br>/g, "");
		  	
		  	//수정 모달창에 출력하기
		  	$('#uform #uwriter').val(vwr);
		  	$('#uform #upassword').val(vpass);
		  	$('#uform #umail').val(vem);
		  	$('#uform #usubject').val(vsub);
		  	$('#uform #ucont').val(vp3);
		  	
		  	//글 번호를 히든으로 hidden으로 모달창에 설정
		  	$('#uform #unum').val(vidx);
		  	
			$('#uform #uwriter').prop('readonly',true);
			
			//값을 변경, 수정, 입력 하고 전송 버튼 클릭 -> 이벤트 발생
			
			
		  	
			 
		  }else if(vname == "reply"){
			  //alert(vidx + "번 글에 댓글을 씁니다");
			  
			  //입력한 내용 가져오기 
			 vcont = $(this).prev().val();
			 console.log(vcont) ;
			  
			  reply.name = mvo.mem_name;
			  reply.bonum = vidx;
			  reply.cont = vcont;
			  
			  console.log(reply);
			  
			 //ajax수행 - 댓글저장
			  $.insertReplyServer();
			 
			 //입력한 값 지우기 
			 $(this).prev().val("");
			  
		  }else if(vname == "r_modify"){
			  alert(vidx + "번 댓글을 수정합니다");
			  
			  //댓글 수정 폼이 이미 열려있는지 비교
			  if($('#modifyform').css('display') != "none"){
				  replyReset(); //원래내용 보관하고 있다가 창 닫고 다시 출력
			  }
			  
			  //댓글 위치의 요소(p3) 접근
			  vp3 = $(this).parents('.reply-body').find('.p3');
			  
			  //댓글 원래 내용 가져오기
			  vcontsrc = vp3.html().trim(); //<br> 포함
			  
			  // <br>을 \n으로 변경
			  vcont = vcontsrc.replace(/<br>/g, "\n");
			  
			  //modifyform의 mtext에 출력
			  $('#modifyform #mtext').val(vcont);
			  
			  //modifyform을 현재 p3 위치로 append
			  // * append는 계속 뒤에 붙으므로 empty처리 해주어야 함
			  vp3.empty().append($('#modifyform'));
			  
			  //modifyform을 show
			  //$('#modifyform').show();
			  $('#modifyform').css('display', 'block');
			  
			  
			  
		  }else if(vname == "r_delete"){
			  
			 // alert(vidx + "번 댓글을 삭제합니다");
			  
			 //ajax 수행 - 댓글 삭제 
			 $.deleteReplyServer();
		  }
		  
	  })// click 이벤트 
	  
	  
	  //댓글 수정 에서 확인 버튼 클릭
	  $('#mok').on('click',function(){
		//modifycont - 수정된 내용 - 가져오기		
		vnewcontsrc = $('#modifyform #mtext').val(); //\r\n이 포함
		
		//\r\n을 <br>로 변경 , db수정 성공 후 화면을 변경
		vnewcont = vnewcontsrc.replace(/\n/g, "<br>");
		
		//p3을 검색 - ajxj를 통해서 DB수정-> 성공 후 화면 변경
		vp3 = $('#modifyform').parent();
		 
		//modifyform을 다시 body로 이동 - hide
		//$('body').append($('#modifyform'));
		$('#modifyform').appendTo($('body'));
		$('#modifyform').hide();
		
		//ajax수행- cont, renum 필요
		reply.cont = vnewcontsrc;
		reply.renum = vidx;
		//location.href="_.do" 
		$.replyUpdateServer();
		
		
	  })
	  
	  
	  //댓글 수정 에서 취소 버튼 클릭 - 원래 내용 가져오기
	  $('#mcancel').on('click', function(){
		  replyReset(); 
	  })
	  
	  
	  //(ajax상관없이) 댓글 수정시 확인 또는 취소 버튼 클릭 시 modifyform을 body로 다시 옮겨놓는 작업
	  replyReset = function(){
		  
		  //p3 또는 rp3 찾기
		  vmp = $('#modifyform').parent();
		  
		  //수정 폼을 body태그로 다시 이동 - append
		  $('body').append($('#modifyform'));
		  $('#modifyform').hide();
		  
		  //p3에 원래 내용을 출력
		  //vmp 혹은 $(vmp)로 써도됨 - jquery 변수
		  vmp.html(vcontsrc);
		  
	  }

	  
	  //글쓰기 이벤트 - 
	  $('#bwrite').on('click', function(){
		  
		  //로그인체크
		  if(mvo == null){
			  alert("로그인 후 사용가능합니다");
			  return false;
		  }  
		    
		  $('#wModal').modal('show');
			  
		 //로그인 한 사람의 이름을 모달창의 작성자에 출력한다 
		  $('#bwriter').val(mvo.mem_name);
		  $('#bwriter').prop('readonly', true);
		  
		  
	  })//글쓰기 끝
	  
	  //모달창 에서 글쓰기후 전송 버튼 클릭 이벤트 
	  $('#wsend').on('click', function(){
		  /* //입력한 모든 값을 가져온다 
		  vwriter = $('#bwriter').val().trim();
		  vsubject = $('#bsubject').val().trim();
		  
		  //data만들기
		  vdata = {"writer" : vwriter,  
				  "subject" : vsubject,
				  }
		  */
		//입력한 모든 값을 가져온다 -  data만들기
		vdata =  $('#wform').serializeArray();
		console.log(vdata); 
		 
		//ajax실행 - 
		$.insertBoardServer();
		
		//모달창 닫기 
		$('#wModal').modal('hide');
		
		//모달창 입력 내용 지우기
		$('#wModal .txt').val("");
		  
	  })
	  
	  
	  //글수정 모달창에서 수정 입력하고 전송버튼 클릭 이벤트
	  $('#usend').on('click', function(){
		  //수정입력된 모든 내용울 가져 온다.
		  
		  //data를 생성하여 서버로 보내기
		  
		  //vdata = $('#uform').serializeArray();
		  //js 폴더에 jquery.serializejson.min.js 추가해야함
		  //board.js의 vdata가 배열로 받고 있으므로 Array대신 json사용
		  vdata = $('#uform').serializeJSON();
		  
		  console.log(vdata);
		  
		  //ajax실행 - db수정완료 성공하면 vdata의 내용으로 본문의 내용으로 바꾼다.
		  $.updateBoardServer();
		  
		  //모달창 닫기 
	      $('#uModal').modal('hide');
			
		  //모달창 입력 내용 지우기
		  $('#uModal .txt').val("");
		  
		  
	  })
	  
 })  //$(function)
</script>

 <style>
 .card-body{
    display : flex;
    flex-direction:  column;
 }
 p{
   border : 1px dotted gold;
   margin : 2px;
   padding : 3px;
 }
 .pp{
   display: flex;
   flex-direction: row;
   
 }
 .p1{
    flex:  70%;
 }
 .p2{
   flex : 30%;
 }
 
 nav{
   margin : 2%;
 }
 nav a{
  /*  display: none;  */
   visibility:  hidden; 
 }
 #pageList{
   margin : 2%;
   margin-left : 10%;
 }
 input[name=reply]{
   height : 50px;
   vertical-align: top;
 }
 .reply-body{
    border : 2px dotted orange;
    background : #dadade;
    margin : 3px;
    padding : 5px;
 }
.modal label{
    width : 100px;
    height : 30px
 }
.bpass{
 	display: none;
 }
#modifyform{
	display: none;
} 
 
 </style> 

</head>
<body>

	<!-- 댓글 수정 -->
	<div id="modifyform">
		<textarea rows="5" cols="40" id="mtext"></textarea>
		<input type="button" value="확인" id="mok">
		<input type="button" value="취소" id="mcancel">
	</div>




   <input type="button" id="bwrite" value="글쓰기"> 
   
   <!-- 이벤트 핸들러 없이 모달을 띄운다 -->
  <!--  <input type="button"  value="글쓰기" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#wModal"> -->
   <br><br><br>
   
   <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="javascript:void(0)">Logo</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="mynavbar">
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link" href="javascript:void(0)">Link</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="javascript:void(0)">Link</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="javascript:void(0)">Link</a>
        </li>
      </ul>
      <form class="d-flex">
      
        <select class="form-select" id="stype">
           <option value="">전체</option>
           <option value="writer">작성자</option>
           <option value="subject">제목</option>
           <option value="content">내용</option>
        </select>
      
        <input class="form-control me-2" id="sword" type="text" placeholder="Search">
        <button id="search" class="btn btn-primary" type="button">Search</button>
      </form>
    </div>
  </div>
</nav>
   
  <br><br>
   
   <div id="result"></div>
   <br><br>
   <div id="pageList"></div>
   
   
   <!-- 글쓰기 The Modal -->
<div class="modal" id="wModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">글 작성하기</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
       <form name="wform" id="wform">
         <label>작성자</label>
         <input type="text" class="txt"  name="writer" id="bwriter"><br>
         
         <label>제목</label>
         <input type="text"  class="txt" name="subject" id="bsubject"><br>
         
         <label>비빌번호</label>
         <input type="password"  class="txt" name="password" id="bpassword"><br>
       
         <label>메일</label>
         <input type="text"   class="txt" name="mail" id="bmail"><br>
         
         <label>내용</label><br>
         <textarea rows="10" cols="50" name="content"  class="txt" id="bcont"></textarea>
         <br><br>
         <input type="button" value="전송" id="wsend">
       </form>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>
<!-- 글쓰기 모달 끝 -->

   
   
   
   
   
   
 <!-- 글수정 The Modal -->
<div class="modal" id="uModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">글 수정하기</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
       <form name="uform" id="uform">
       
         <input type="hidden" class="txt" name="num" id="unum"> 
       
         <label>작성자</label>
         <input type="text" class="txt"  name="writer" id="uwriter"><br>
         
         <label>제목</label>
         <input type="text"  class="txt" name="subject" id="usubject"><br>
         
         <label>비빌번호</label>
         <input type="password"  class="txt" name="password" id="upassword"><br>
       
         <label>메일</label>
         <input type="text"   class="txt" name="mail" id="umail"><br>
         
         <label>내용</label><br>
         <textarea rows="10" cols="50" name="content"  class="txt" id="ucont"></textarea>
         <br><br>
         <input type="button" value="전송" id="usend">
       </form>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>   
   
   
   
   
</body>
</html>







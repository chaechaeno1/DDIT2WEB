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
				alert("조회수 증가");
			}
			  
		  }else if(vname == "modify"){
			 alert(vidx + "번 글을 수정합니다") ;
			 
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
			  
		  }else if(vname == "r_delete"){
			  
			 // alert(vidx + "번 댓글을 삭제합니다");
			  
			 //ajax 수행 - 댓글 삭제 
			 $.deleteReplyServer();
		  }
		  
	  })// click 이벤트 
	  
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
 </style> 

</head>
<body>
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
   
   
   <!-- The Modal -->
<div class="modal" id="wModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Modal Heading</h4>
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
   
   
</body>
</html>







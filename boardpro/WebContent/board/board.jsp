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

<!-- 외부스크립트 -->
<script src="../js/jquery-3.7.1.min.js"></script>


  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>


<script src="../js/board.js"></script>

<%
//로그인 상태 체크
MemberVO vo = (MemberVO)session.getAttribute("loginok");
String ss = null;

Gson gson = new Gson();
if(vo!=null) ss = gson.toJson(vo);
/* ss = { "mem_id" : "b001",
		  "mem_pass" : "1234",
		  "mem_name" : "이쁜이"		  
		} 
*/

%>
<script>
mvo = <%= ss %> /* mvo.mem_id, mvo.mem_pass, mvo.mem_name .. */
mypath = "<%=request.getContextPath()%>";
currentpage = 1; //전역변수

$(function(){
	
	
	//실행 하자마자 리스트 출력 - stype, sword 없는 상태
	$.listBoardServer(currentpage);
	
	//페이지 번호 클릭 이벤트
	$(document).on('click', '.pageno', function(){
		currentpage = parseInt($(this).text().trim()); 
		$.listBoardServer(currentpage);
	})
	
	
	//다음 클릭 이벤트
	$(document).on('click', '#next', function(){
		currentpage = parseInt($('.pageno').last().text().trim()) +1;
		$.listBoardServer(currentpage);
	})
		
	
	//이전 클릭 이벤트
	$(document).on('click', '#prev', function(){
		currentpage = parseInt($('.pageno').first().text().trim()) -1;
		$.listBoardServer(currentpage);
	})
	
	
	//search 검색 이벤트
	$(document).on('click', '#search', function(){
		currentpage = 1
		$.listBoardServer(currentpage);

	})
	
	//수정, 삭제, 댓글등록, 제목클릭, 댓글삭제, 댓글 수정 이벤트
	
	
})
</script>


<style>
.card-body{
	display: flex;
	flex-direction: column;
}
p{
	border: 1px dotted gold;
	margin: 2px;
	padding: 3px;
}

.pp{
	display: flex;
	flex-direction: low;
}
.p1{
	flex: 70%;
}
.p2{
	flex: 30%;
}
nav{
	margin : 2%;
}
nav a{
	/* display: none; */  /* 영역까지 숨김 */
	visibility: hidden;  /* 영역을 가지고 있음 */
}
#pageList{
	margin : 2%;
	margin-left: 40%	
}
input[name=reply]{
	height : 50px;
	vertical-align: top;
}


</style>

</head>
<body>
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
        <button class="btn btn-primary" id="search" type="button">Search</button>
      </form>
    </div>
  </div>
</nav>

	<br><br>
	
	<div id="result"></div>
	<br><br>
	<div id="pageList"></div>


</body>
</html>
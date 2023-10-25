<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 :: 예약 현황 조회</title>
<link rel="icon" href="<%=request.getContextPath()%>/images/favicon_admin.ico">
<!-- 모달사용 -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  
<script src="<%=request.getContextPath()%>/js/jquery-3.7.1.min.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/basic.css" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>	


<script>
	$(function() {
		/* 검색 input 이벤트 */
		$('#searchbtn').on('click', function() {
			$(this).prev().toggleClass("on");
		})
		/* 메뉴 마우스후버 이벤트 */
		$('.submenu>li').on('mouseover', function() {
		    $(this).find('span').addClass("bck");
		});
		$('.submenu>li').on('mouseout', function() {
		    $(this).find('span').removeClass("bck");
		});
	})
	

 $(document).ready(function() {

      // 기본 선택된 버튼과 배경색 설정
      $("#resG").css("background-color", "#f1f0cb");

      // 예약 버튼이 클릭될 때의 핸들러
      $(".resbtn").click(function() {
        $(".resbtn").css("background-color", "");  // 모든 버튼의 배경색 초기화
        $(this).css("background-color", "#f1f0cb");  // 클릭된 버튼에 배경색 설정
      });

      /* 글램핑 예약하기 클릭 시 버튼 배경색 유지*/
      $("#resG").click(function() {
        $(".resbtn").css("background-color", "");  // 모든 버튼의 배경색 초기화
        $("#resG").css("background-color", "#f1f0cb");  // 선택된 버튼에 배경색 설정
      });

      /* 오토캠핑 예약하기 클릭 시 버튼 배경색 유지*/
      $("#resA").click(function() {
        $(".resbtn").css("background-color", "");  // 모든 버튼의 배경색 초기화
        $("#resA").css("background-color", "#f1f0cb");  // 선택된 버튼에 배경색 설정
      });

      /* 카라반 예약하기 클릭 시 버튼 배경색 유지*/
      $("#resC").click(function() {
        $(".resbtn").css("background-color", "");  // 모든 버튼의 배경색 초기화
        $("#resC").css("background-color", "#f1f0cb");  // 선택된 버튼에 배경색 설정
      });
    });
	

</script>


<style type="text/css">
html {
	height: 100%;
}
body {
	height: 100%;
	box-sizing: border-box;
}
header {
	width: 100%;
	padding: 15px 10%;
	display: flex;
	flex-direction: row;
    justify-content: space-between;
    background: #d6d46d;
}
header * {
    color: #4d2222;
}
header>p {
	font-size: 25px;
	line-height: 50px;
}
header span {
	padding: 12px 0;
}
header #log {
	display: flex;
	flex-direction: row;
}
#logsearch {
	display: flex;
	flex-direction: row;
	position: relative;
}
#logsearch input {
	width: 0;
	visibility: hidden;
	margin: auto 3px;
	padding: 7px 10px;
	position: absolute;
	top: 13px;
	left: 150%;
	transform: translateX(-150%);
	transition: all 0.5s;
	border: 1px solid #9A4444;
	border-radius: 10px;
}
#logsearch input.on {
	width:  130px;
	visibility: visible;
	display: inline-block;
}
.symbol {
	cursor: pointer;
	margin-left: 20px;
}
header span.material-symbols-outlined {
	font-size: 30px;
}
#container {
	width: 100%;
	height: 100%;
	display: flex;
}
#sidemenu {
	height: 100%;
	flex: 18%;
	background: #f1f0cb;
	padding: 2%;
	overflow: hidden;
}
#sidemenu * {
    color: #4d2222;
}
#sidemenu a {
    font-size: 1rem;
}
#sidemenu h3 {
	font-size: 18px;
	font-weight: bolder;
	display: inline-block;
	position: absolute;
	top: 10px;
	left: 50px;
	margin: 0;
}
#section {
	flex: 82%;
	background: #fff;
	padding-bottom: 20px;
}
.submenu {
	position: absolute;
	top: 30px;
	left: 40px;
}
#sidemenu .lif {
	height: 130px;
	position: relative;
}
.lif > span {
	position: relative;
	top: 7px;
	left: 0;
}
.submenu li {
	margin: 20px 10px;
	position: relative;
}
.submenu li a {
	position: inherit;
	z-index: 10;
	transition: all 0.4s;
}
.submenu li:hover a{
	color: #f1f0cb !important;
}
.submenu li span {
	transition: all 0.5s;
}
#second {
	margin-bottom: 30px;
}
span.bck {
    display: inline-block;
    background: #4d2222;
    width: 400%;
    height: 39px;
    position: absolute;
    top: -13px;
    left: -80%;
    z-index: 1;
}  

/* 관리자 예약 현황 조회 부분 css 시작 */

label{
	display : inline-block;
	width : 100px;
	height : 35px;
}
.modal-footer{
	display: flex;
    justify-content: center;
}
#res1 select {
  width: 58%; /* 필요한 만큼 폭을 조정하세요 */
  height : 35px;
}
#res2 span{
	color: red;
}
.modal-body{
	display: flex;
    justify-content: center;
}
#calendar{
	border: 1px solid gray;
	width: 65%;
	margin: 0 auto;
}
.cols{
	width: 14%;
}

.btn_pop{
	border: 1px solid gray;
}
.left{
	font-size : 10pt;
}
.possibleBtn{
	color: rgb(143, 195, 31); 
	font-weight: 300;
}
.sun{
	color : red;
}
.sat{
	color : blue;
}

.cal{
	padding-top: 10px;
}
.cal_l{
	margin-top: 10px;
}
#prevnextbtn{
	width : 15px;
	height : 20px;
}
.prev, .month, .next {
  display: inline-block;
}
.month{
	margin-left: 20px;
	margin-right: 20px;
}
.tflex {
	margin: 3%;
	display: flex;
	justify-content: center;
	flex-wrap: wrap;
	align-content: right;
}
#resList{
	border: 0;
}
.gbtn{
	font-size: 60%;
	margin: 3px;
}
#res1, #res2{
	border : 1px dotted;
	height : 300px;
	width : 50%;
	float : left;
	padding: 20px;
}
.resColor{
	text-align: right;
	margin-right: 15%;
}
.resColor img{
	width: 10px;
	height: 10px;
}
.btn_pop p{
	margin: 5% 5%;
}
.cal_yearmon{
	font-size: 1.2rem;
	display: flex;
  	align-items: baseline;
  	justify-content: center;
  	margin-left: 5px;
}
#resbutton{
	text-align: center;
	/* border : 1px dotted green; */
	margin: 30px;
	display: flex;
    justify-content: center;
}
#resbutton a{
	margin : 10px;
	padding : 20px;
	border : 4px solid #f1f0cb;
	background: white;
	border-radius : 20px;
	font-size : 20px;
	color: black;
}
#resbutton a:link{
	text-decoration : none;
}
#resbutton a:hover{
	background: #f1f0cb;
	border-color: #f1f0cb;
}
#resbutton a:visited{
	text-decoration : none;
}
#resbutton a:active{
	/* color : none; */
	border-color: #f1f0cb;
}
#resbutton a:focus{
	outline : none;
}
iframe {
	width: 70%;
	height: 650px;
	padding: 10px !important;
	box-shadow: 0px 0px 5px 2px #d6d46d !important;
	box-sizing: border-box;
	display: flex;
    justify-content: center;
    margin: 0 auto !important;
}



</style>
</head>
<body>

<jsp:include page="adminHeader.jsp"></jsp:include>


	<!-- 헤더 아래 모두 -->
	<div id="container">
	
	
	<!-- Include "adminMain.jsp"의 header 부분 -->
	    <jsp:include page="adminSidemenu.jsp"></jsp:include>

		<!-- **만든 부분** -->
		<div id="section">
		

				<!-- 캘린더  -->
	<div class="reservationDiv">
		<div class="cal">
		
	  <div id="resbutton">
        <a href="<%=request.getContextPath()%>/calender/calendarAdmin.jsp?campCode=G" class="resbtn" id="resG" target="if_adminrescal">글램핑 예약확인</a>
        <a href="<%=request.getContextPath()%>/calender/calendarAdmin.jsp?campCode=A" class="resbtn" id="resA" target="if_adminrescal">오토캠핑 예약확인</a>
        <a href="<%=request.getContextPath()%>/calender/calendarAdmin.jsp?campCode=C" class="resbtn" id="resC" target="if_adminrescal">카라반 예약확인</a>
      </div>
      
      <iframe src="<%=request.getContextPath()%>/calender/calendarAdmin.jsp?campCode=G" name="if_adminrescal"></iframe>
		
			</div>
		</div>
		</div>
		</div>
</body>
</html>
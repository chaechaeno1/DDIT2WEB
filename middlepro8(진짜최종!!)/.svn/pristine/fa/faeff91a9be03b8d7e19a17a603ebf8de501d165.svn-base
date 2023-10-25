<%@page import="kr.or.ddit.vo.RsvVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 캘린더</title>

<!-- 스크립트 순서 제발 변경 하지말아주세요 -->
<!-- 스크립트 순서 제발 변경 하지말아주세요 -->
<!-- 스크립트 순서 제발 변경 하지말아주세요 -->
<!-- 스크립트 순서 제발 변경 하지말아주세요 -->

<!-- jquery CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- fullcalendar CDN -->
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet'/>
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
<!-- fullcalendar 언어 CDN -->
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>

<!-- 모달 스크립트 -->  
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script> 
    
<!-- Bootstrap CDN (Make sure you have Bootstrap CSS and JS included) --> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> 


<!-- 카카오페이 API 스크립트 -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<!--예약정보 -->
<script src="<%= request.getContextPath()%>/js/rsv.js"></script>
<script src="<%= request.getContextPath()%>/js/jquery.serializejson.min.js"></script>



<%
	String campCode = request.getParameter("campCode");
%> 
 
<script>
let calendar = null;
let formattedDate = [];
let viewData = [];

let campCode = "<%=campCode%>";

mypath = "<%= request.getContextPath()%>";

let currMon = "";

function dateFormat(vdate){
	   var yyyy = vdate.getFullYear().toString();
	   var mm = (vdate.getMonth() + 1).toString();
	   var dd = vdate.getDate().toString();
	   return yyyy + "-" + (mm[1] ? mm : "0" + mm[0]) + "-" + (dd[1] ? dd : "0" + dd[0]);
}

function ajaxProc(){
	resdata = null;
	$.ajax({
		url : "<%=request.getContextPath()%>/checkFlag.do",
			data : {
				'currMonth' : currMon,
				'campCode' : campCode
			}, // viewData를 서버로 전송
			type : "post",
			traditional : true,
			async : false,
			success : function(res) {
				console.log("res", res)
				resdata = res;

				$.each(resdata, function(i, v) {
	                let start_date = new Date(v.rsv_start_date);
	                let end_date = new Date(v.rsv_end_date);
					
					let data = {
						title : v.campsite_no,
						start : dateFormat(start_date),
						end : dateFormat(end_date),
						backgroundColor : "#DE8F5F",
						borderColor : "#DE8F5F",
						id: "booked",
						className: "booked",
						rsvNo : v.rsv_no
					}

					viewData.push(data);

				})
				viewCalendar(viewData);
			},
			error : function(xhr) {
				alert("상태 : " + xhr.status)
			},
			dataType : 'json'

		})
	return resdata;
}

$(function(){
	ajaxProc();
})    

function viewCalendar(getData){
    var calendarEl = document.getElementById('calendar');
    calendar = new FullCalendar.Calendar(calendarEl, {
        initialView: 'dayGridMonth',
        locale: 'ko', // 한국어 설정
        headerToolbar: {
            start: '',
            center: 'prev title next',
            end: 'dayGridMonth,dayGridWeek,dayGridDay'
        },
        selectable: true,
        droppable: true,
        editable: true,
        events: getData
    });

    calendar.render();
    
	var currMon = document.querySelector('h2.fc-toolbar-title').innerText;
	currMon = currMon.replace(/(\d{4})년 (\d{1,2})월/, '$1-$2');
}



//버튼 클릭했을  때 모달 띄우기!!!!!!!!
$(document).ready(function() {
  // fc-daygrid-event-harness 클래스는 웹페이젱서 F12 눌렀을 때만 보임
  
//  $(document).on("click", ".fc-daygrid-event-harness", function() {
  $(document).on("click", "a.booked", function() {
  	
      // 버튼 클릭시 예약화면 모달 열리게 하기
  	$('#resModal').modal('show');
  	
  	// 클릭한 예약 일정의 날짜와 캠프사이트번호 담아 저장하기
      var rsvDate = $(this).parents('td.fc-day').attr('data-date');
      var campsiteNo = $(this).find('div.fc-event-title').text();
  	
  	console.log("campsiteNo",campsiteNo);
  	console.log("rsvDate",rsvDate);
  	
      // 모달창에 예약정보 불러오기
  	$.SelectByRsvServer(rsvDate, campsiteNo);
  });
});

    
/*
function validateAndProceed() {
    var peoplenum = document.getElementById('peoplenum').value;
    var exitday = document.getElementById('exitday').value;

    if (peoplenum === '선택하세요' || exitday === '선택하세요') {
      alert('옵션을 모두 선택하세요.');
    } else {
      // 다음 단계로 진행합니다 (결제 모달 열기)
      $('#resModal').modal('hide');
      requestKakaoPay();
      //$('#payModal').modal('show'); 
      //window.location.href = 'paytest.html';
    }
  }

  // 카카오페이 결제를 요청하는 함수
  function requestKakaoPay() {
    var IMP = window.IMP;
    IMP.init('imp43234711'); // 귀하의 식별자로 초기화하세요

    // 결제 요청
    IMP.request_pay({
      pg: "kakaopay.TC0ONETIME",
      pay_method: 'card',
      merchant_uid: 'merchant_' + new Date().getTime(),
      name: '결제',
      amount: 100,  // 필요에 따라 금액을 조정하세요
      buyer_email: '구매자 이메일',
      buyer_name: '구매자 이름',
      buyer_tel: '구매자 번호',
      buyer_addr: '구매자 주소',
      buyer_postcode: '구매자 우편번호',
      m_redirect_url: 'http://www.naver.com'
    }, function (rsp) {
      if (rsp.success) {
        console.log('결제가 완료되었습니다.');
        console.log('결제금액: ' + rsp.amount + '원');
        console.log('구매자 정보: 이메일 - ' + rsp.buyer_email + ', 전화번호 - ' + rsp.buyer_tel);
        location.href = 'reservationSuccess.html'; // 다음 단계로 리디렉션
      } else {
        console.log('결제에 실패하였습니다.');
        console.log('에러 메시지: ' + rsp.error_msg);
        console.log('결제금액: ' + rsp.amount + '원');
        console.log('상품명: ' + rsp.name);
        console.log('구매자 정보: 이메일 - ' + rsp.buyer_email + ', 전화번호 - ' + rsp.buyer_tel);
      }
    });
  }
*/
  
</script>

<style type="text/css">
@font-face {
	font-family: "NPSfontBold";
	src:
		url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2310@1.0/NPSfontBold.woff2")
		format("woff2");
	font-weight: 700;
	font-style: normal;
}

#calendar {
	font-family: "NPSfontBold", "Malgun Gothic", "굴림", "Gulim", "Arial";
}

#calendar h2, #calendar a {
    color: #4d2222;
}
#calendar h2 {
	line-height: 50px;
}
.fc-header-toolbar {
    justify-content: center !important;
}
 
.fc-header-toolbar > div:nth-child(2) {
	display: flex;
}
.fc-header-toolbar > div:last-child {
	display: none;
}
.fc .fc-daygrid-day-top {
	margin-left: 5px;
	margin-top: 5px;
    flex-direction: row;
}

/* 기존에 button에 적용하면 모달의 button까지 적용 되므로 홈페이지 내 F12 확인하여 버튼 클래스에 적용 */
.fc-button {
	background: #f1f0cb !important;
	border: none !important;
}
button span {
    color: #4d2222;
}


/* 모달을 위한 스타일 추가 */
 @font-face {
    font-family: 'NPSfontBold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2310@1.0/NPSfontBold.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
}
html, body {
    font-family: 'NPSfontBold';
}
label{
	display : inline-block;
	width : 100px;
	height : 27px;
}
.modal-footer{
	display: flex;
    justify-content: center;
}
iframe {
	width: 100%;
	height: 100%;
	padding: 10px;
	border: 1px dotted;
	box-sizing: border-box;
	display: flex;
    justify-content: center;
    margin: 0 auto;
}
.modal-body{
	display: flex;
    justify-content: center;
}
.left{
	font-size : 10pt;
}
/* 모달창 크기 및 간격 조정 */

/* 모달창 하단 버튼 */
#bottom{
	margin: auto;
	display:block;
	padding: 20px 0;
	text-align: center;
	color: !important;
}
#infoForm{
	border : 1px dotted;
	width : 80%;
	padding: 20px;
}

</style>

</head>
<body>


<div id='calendar'>

</div>


<!-- 캘린더 내의 예약 가능한 캠핑장 유형 클릭했을 때 나오는 예약화면 모달 -->
<div class="modal fade" id="resModal" >
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">


      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">예약 상세정보</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
      

		      	<!-- 예약화면 좌측 -->
		       		<form id="infoForm">
			       	
		       		</form>
		       		
		       
      
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">	
        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
        <!-- data-bs-toggle="modal" data-bs-target="#payModal" 때문에 애썼다.. 주의하기.. -->       
      </div>

    </div>
  </div>
</div>

</body>
</html>
<%@page import="com.google.gson.Gson"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
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
	height : 25px;
}
#res1 select {
  width: 58%;
  height : 25px;
}
.modal-footer{
	display: flex;
    justify-content: center;
}
#res2 span{
	color: red;
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
#res1{
	border : 1px dotted;
	height : 300px;
	width : 38%;
	float : left;
	padding: 10px;
}
#res2{
	border : 1px dotted;
	height : 300px;
	width : 62%;
	float : left;
	padding: 10px;
}
/* 모달창 하단 버튼 */
#bottom{
	margin: auto;
	display:block;
	padding: 20px 0;
	text-align: center;
	color: !important;
}
#infoForm{
	margin: 0 auto;
	margin-top: 5%;
}
#campImg{
	height : 200px;
	width : 70%;
	padding-top: 20px;
}
form#resNotice {
    display: inline-flex;
}
form#resNotice2 {
    display: flex;
    justify-content: center;
    height: 75%;
}
div#typeInfo1{
	margin-right: 20px;
}
#campNum {
	width : 80px;
}
#pay {
	width : 100px;
}

</style>
 
<%
	String campCode = request.getParameter("campCode");

	// 로그인 체크 - 서블릿에서 저장한 session값을 얻어온다
	MemberVO vo = (MemberVO)session.getAttribute("loginMember");
	
	// MemberVO 객체를 JSON 형식으로 변환
    String voJson = null;
    if (vo != null) {
        // MemberVO 객체가 null이 아니면 JSON으로 변환
        // Gson 라이브러리를 사용
        Gson gson = new Gson();
        voJson = gson.toJson(vo);
    }

%> 
 
<script>
/* 전역변수들 */
let calendar = null;
let formattedDate = [];
let viewData = [];

let campCode = "<%=campCode%>";
let vo = <%= voJson%>;

let currMon = "";

/* 날마다 캠프사이트번호 출력 함수 */
function ajaxProc(){
	resdata = null;
	$.ajax({
		url : '<%= request.getContextPath()%>/selectCampno.do',
		type : 'get',
		async : false,
		data : {'campCode': campCode },
		success : function(res){
			console.log("res",res)
			resdata = res;
			
			let startDate = new Date(); // 시작 날짜 설정
			
			let endDate = new Date(startDate); // 종료 날짜 설정
			endDate.setMonth(endDate.getMonth() + 1); // 시작 날짜로부터 1달 후로 설정
			
			while(startDate <= endDate) {
				
				formattedDate = startDate.toISOString().split('T')[0];
				
				$.each(resdata, function(i,v){
					let data =  {
						      title: v.campsite_no,
						      amount: v.campsite_rate,
						      start: formattedDate,
						      backgroundColor: "#483D8B",
						      borderColor: "#483D8B"
						  } 
					
					viewData.push(data);
					
				})
				startDate.setDate(startDate.getDate() + 1);
					
			}
			viewCalendar(viewData);
			
		},
		error : function(xhr){
			alert("상태 : " + xhr.status)
		},
		dataType  : 'json'
		
	})
	return resdata;
}
$(function(){
	ajaxProc();
})    
/* 캘린더 객체 함수 */
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
/* 날짜 포맷 함수 */
function dateFormat(vdate){
	var yyyy = vdate.getFullYear().toString();
    var mm = (vdate.getMonth() + 1).toString();
    var dd = vdate.getDate().toString();
    return yyyy + "-" + (mm[1] ? mm : "0" + mm[0]) + "-" + (dd[1] ? dd : "0" + dd[0]);
}

/* 해당날짜와 캠프유형 데이터를 전송해 예약테이블 정보를 가져와서 */
/*  */
$(function(){
	resdata = null;
	
	$.ajax({
		url : "<%=request.getContextPath()%>/checkFlag.do",
		data : { currMonth: currMon, 'campCode': campCode }, // viewData를 서버로 전송
		type : "post",
		traditional : true,
		success : function(res){
			console.log("res02", res);
			console.log("viewData", viewData);
			resdata = res;

			// 서버에서 가져온 예약 상태 데이터를 기반으로 일정의 배경색과 테두리색 설정
			let newViewData = viewData;
			let changeData = [];
	        $.each(viewData, function(j, event) {
				$.each(resdata, function(i, v) {
	                if (v.campsite_no === event.title && event.start.substring(0,10) === v.rsv_start_date.substring(0,10) ) {
	                	changeData.push(j);
	                 }
	            });
	        });
	        
			$.each(changeData, function(i, index){
				viewData[index].backgroundColor = "red";
				viewData[index].borderColor = "red";
				viewData[index].id = "booked";
				viewData[index].className = "booked";
			});
			
	        console.log("changeData", changeData)
			console.log("newViewData", viewData)
			viewCalendar(viewData);
		},
		error : function(xhr){
			alert("status"+xhr.status);
		},
		dataType : 'json'
	})

})

//버튼 클릭했을  때 모달 띄우기!!!!!!!! ++ 이미지 변경 추가
$(document).ready(function() {
	
	// 버튼을 클릭했을 때
    // fc-daygrid-event-harness 클래스는 웹페이젱서 F12 눌렀을 때만 보임
    $(document).on("click", ".fc-daygrid-event-harness>a:not(.booked)", function() {
    	
    	 var campsiteNo = $(this).parent().find('.fc-sticky').text();
    	    
    	    var imgElement = document.getElementById('campImg');
    	    var imageMap = {
    	        'G-001': '../images/resG001.jpg',
    	        'G-002': '../images/resG002.jpg',
    	        'G-003': '../images/resG003.jpg',
    	        'G-004': '../images/resG004.jpg',
    	        'G-005': '../images/resG005.jpg',
    	        'A-001': '../images/resA001.jpg',
    	        'A-002': '../images/resA002.jpg',
    	        'A-003': '../images/resA003.jpg',
    	        'A-004': '../images/resA004.jpg',
    	        'A-005': '../images/resA005.jpg',
    	        'C-001': '../images/resC001.jpg',
    	        'C-002': '../images/resC002.jpg',
    	        'C-003': '../images/resC003.jpg',
    	        'C-004': '../images/resC004.jpg',
    	        'C-005': '../images/resC005.png'
    	    };

    	    if (imageMap[campsiteNo]) {
    	        imgElement.src = imageMap[campsiteNo];
    	    } else {
    	        // 적절한 이미지가 없을 경우의 처리
    	        imgElement.src = '../images/camp01.jpg';
    	    }
    	
        // 버튼 클릭시 예약화면 모달 열리게 하기
        $('#resModal').modal('show');
        
     	// 모달 내용 초기화
        $('#people').val('선택하세요'); // select 요소 초기화
        $('#pay').val(''); // 금액 초기화 (pay 요소 내용을 지우거나 초기값으로 설정)
        
        let rsvDate = dateFormat(new Date());
        $('#resDate').val(rsvDate);

        
        $('#campNum').val(campsiteNo);
        
        let startday = $(this).parents('td.fc-daygrid-day').attr('data-date').trim();
        $('#startday').val(startday);
        
        let exitdayObj = new Date(startday);
        exitdayObj.setDate(exitdayObj.getDate() + 1);
        let exitday = dateFormat(exitdayObj);
        $('#exitday').val(exitday);
        
        
     	// select 요소가 변경될 때 이벤트 처리
        $('#people').on('change', function() {
          // 선택한 인원수 가져오기
          let selectedValue = this.value;
          
          // 금액을 계산
          let foundObject = viewData.find(item => item.start === startday && item.title === campsiteNo);
          let basePrice = foundObject.amount;
          let amount = calculateTotalAmount(basePrice, selectedValue); // 예시: 선택한 인원수에 따라 금액 계산

          // 금액을 화면에 업데이트
          $('#pay').val(amount);
        });

    });
	

});

//금액 계산 함수
function calculateTotalAmount(basePrice , selectedValue) {
  // 선택한 인원수에 따라 금액을 계산하거나 가져오는 로직
  // 예시: 1명당 10,000원이라 가정
  let pricePerPerson = 10000;
  let totalAmount = basePrice + (selectedValue - 2) * pricePerPerson;
  return totalAmount;
}

function validateAndProceed() {
    var people = document.getElementById('people').value;

    if (people === '선택하세요') {
      alert('인원수를 선택하세요.');
    } else {
      // 다음 단계로 진행합니다 (결제 모달 열기)
      
      // 결제 먼저 호출
      requestKakaoPay();
      
      // 모달의 내용 지워짐
      $('#resModal').modal('hide');
      //$('#payModal').modal('show'); */
      //window.location.href = 'paytest.html';
    }
  }

// 카카오페이 결제를 요청하는 함수
function requestKakaoPay() {
	// 각 span 요소의 값을 설정합니다.
    const resDate = $('#resDate').val();
    const campNum = $('#campNum').val();
    const startday = $('#startday').val();
    const exitday = $('#exitday').val();
    const pay = parseInt($('#pay').val());
    
	var IMP = window.IMP;
	IMP.init('imp43234711'); // 식별자로 초기화하세요
	
	
	// 결제 요청
	IMP.request_pay({
	  pg: "kakaopay.TC0ONETIME",
	  pay_method: 'card',
	  merchant_uid: 'merchant_' + new Date().getTime(),
	  name: '결제',
	  amount: pay,  // 필요에 따라 금액 조정
	  buyer_email: vo.mem_mail,
	  buyer_name: vo.mem_name,
	  buyer_tel: vo.mem_hp,
	  buyer_addr: vo.mem_addr1 + vo.mem_addr2,
	  buyer_postcode: vo.mem_zip,
	  m_redirect_url: '../reservation/reservationSuccess.html'
	}, function (rsp) {
	  if (rsp.success) {
		  // name 속성을 이용하여 자동으로 만들기 - test console
		 
		  // 기존의 mem_id를 포함한 vdata 배열
		  vdata = [{ name: 'mem_id', value: vo.mem_id }];

		
		  // 폼 데이터를 직렬화하고 배열에 추가
		  vdata = vdata.concat($('#infoForm').serializeArray());
		  console.log(vdata);
		  
		  $.ajax({
			  url : "<%= request.getContextPath()%>/insertRsv.do",
			  data : vdata,
			  type : 'post',
			  success : function(res) {
				  if(res.flag == "예약성공") {
					  //console.log("pay가 받을 데이터들" + res.rsv_no, vo.mem_name, rsp.paid_amount);
					  // 결제 데이터 넣기
					  $.ajax({
						  url : "<%= request.getContextPath()%>/insertPayInfo.do",
						  data : {
							  "rsv_no" : res.rsv_no,
							  "pay_name" : vo.mem_name,
							  "pay_amt" : rsp.paid_amount
						  },
						  type : 'post',
						  success : function(res) {
							  if(res == "결제성공") {
								// 다음 단계로 리디렉션
								  location.href = '<%= request.getContextPath()%>/reservation/reservationSuccess.jsp';
							  } else {
								  alert("결제실패");
							  }
						  },
						  error : function(xhr) {
							  alert("상태 : " + xhr.status);
						  }
						  
					  });
					  
				  } else if(res.flag == "예약실패") {
					  alert("예약 실패");
				  }
			  },
			  error : function(xhr) {
				  alert("상태 : " + xhr.status);
			  },
			  dataType : 'json'
			  
		  });
		 
	   
		  /* console.log('결제가 완료되었습니다.');
		  console.log('결제금액: ' + rsp.paid_amount + '원');
		  console.log('구매자 정보: 이름 - ' + rsp.buyer_name + ', 이메일 - ' + rsp.buyer_email 
	    					+ ', 전화번호 - ' + rsp.buyer_tel + ', 주소 - ' + rsp.buyer_postcode + ' ' + rsp.buyer_addr); */
	   
	  } else {
		  //alert("카카오페이 결제 실패");
		 /*  console.log('결제에 실패하였습니다.');
		  console.log('에러 메시지: ' + rsp.error_msg);
		  console.log('결제금액: ' + rsp.amount + '원');
		  console.log('상품명: ' + rsp.name);
		  console.log('구매자 정보: 이메일 - ' + rsp.buyer_email + ', 전화번호 - ' + rsp.buyer_tel); */
	  }
	});
}

  
</script>



</head>
<body>


<div id='calendar'>

</div>


<!-- 캘린더 내의 예약 가능한 캠핑장 유형 클릭했을 때 나오는 예약화면 모달 -->
<div class="modal fade" id="resModal" >
  <div class="modal-dialog modal-dialog-centered modal-lg">
    <div class="modal-content">


      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">예약하기</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
      

		      	<!-- 예약화면 좌측 -->
		       	<div id="res1">
		       		<form id="infoForm">
		       			<h3 style="color: red; text-align: center;">예약정보</h3>
		       			<br>
		       		
			       		<label for="resDate">예약날짜 : </label>
						<input type="date" id="resDate" name="rsv_date" readonly></input><bar>

						
						<label for="campNum">캠핑장 번호 : </label>
						<input type="text" id="campNum" name="campsite_no" readonly></input><br>

						
						<label for="people">인원수 : </label>
							<select name="rsv_person_cnt" id="people" required>
							  <option value="선택하세요" disabled selected>선택하세요</option>
							  <option value="2">2</option>
							  <option value="3">3</option>
							  <option value="4">4</option>
							</select><br>

						
						<label for="startday">입실일 :</label>
						<input type="date" id="startday" name="rsv_start_date" readonly></input><br>

						
						<label for="exitday">퇴실일 : </label>
						<input type="date" id="exitday" name="rsv_end_date" readonly></input><br>

						
						<label for="pay">금액 : </label>
						<input type="text" id="pay" name="pay_amt" readonly></input> 원<br>

						
		       		</form>
		       		
		       	</div>
		       
		       <!-- 예약화면 우측 -->
		       	<div id="res2">
		       		<form id="resNotice">
		       			<div id="typeInfo1">
		       			<span>※ 예약 전 주의사항</span><br>
						- 기준 인원: 2명, 최대 4명<br>
						- 1인 추가요금: 10,000원<br>
						</div>	
						<div id="typeInfo2">
						<span>[ 객 실 정 보 ]</span><br>
						 - 숙박 입실 : 오후 3시 퇴실 오전 11시<br>
						 - 취사여부 : 개인취사가능<br>
						 </div>	
		       		</form>
		       		
		       		<form id="resNotice2">
		       			<img src="../images/resG001.jpg" alt="이미지" id="campImg">	
		       		</form>
		       	
		       	</div>
       	      
      
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">	
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">닫기</button>
        <!-- data-bs-toggle="modal" data-bs-target="#payModal" 때문에 애썼다.. 주의하기.. -->
        <button type="button" class="btn btn-primary" id="paybtn" onclick="validateAndProceed()">다음 단계</button>
        <!-- data-bs-toggle="modal" data-bs-target="#payModal"  -->
      </div>

    </div>
  </div>
</div>

</body>
</html>
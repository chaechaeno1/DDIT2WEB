<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 외부스크립트 -->
<script src="../js/jquery-3.7.1.min.js"></script>

<!-- 모달사용 -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<!-- 내부 스크립트 -->
<script>
  function validateAndProceed() {
    var peoplenum = document.getElementById('peoplenum').value;
    var exitday = document.getElementById('exitday').value;

    if (peoplenum === '선택하세요' || exitday === '선택하세요') {
      alert('옵션을 모두 선택하세요.');
    } else {
      // 다음 단계로 진행합니다 (결제 모달 열기)
      $('#resModal').modal('hide');
      requestKakaoPay();
      //$('#payModal').modal('show'); */
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
</script>

<style>
 @font-face {
    font-family: 'NPSfontBold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2310@1.0/NPSfontBold.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
}
html, body {
    font-family: 'NPSfontBold';
}
header{
	margin: 50px;
	text-align: center;
	border: 1px dotted;
}
#bottom{
	margin: auto;
	display:block;
}

#bottom{
	padding: 20px 0;
	text-align: center;
}
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
iframe {
	width: 80%;
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
#calendar{
	border: 1px solid gray;
	width: 80%;
	height: 50%;
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
.cal_yearmon{
	text-align: center;
	font-size: 1.2rem;
}
.cal{
	padding-top: 30px;
}
.cal_l{
	margin-top: 30px;
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
	margin: 5%;
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
}
.btn_pop p{
	margin: 0% 10%;
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
	margin-right: 10%;
}
.resColor img{
	width: 10px;
	height: 10px;
}








</style>

</head>
<body>

	<!-- 캘린더  -->
	<div class="reservationDiv">
		<div class="cal">
		<!-- 상단 : 연월 표시 부분 -->
		<div class="cal_yearmon">
				2023 October
				<br><br>
				<div class="cal_inline">
				<p class="prev">
					<a href="/reservation/reserform/area_2d?pageview=1&amp;year=2023&amp;month=9"> <!-- 9월 캘린더로 이동  -->
					<img id="prevnextbtn" src="../images/btn_prev.png" alt="이전"></a>
				</p>
			<div class="month">
				<h3>
					<span>10</span>
				</h3>
			</div>
				<p class="next">
					<a href="/reservation/reserform/area_2d?pageview=1&amp;year=2023&amp;month=11"> <!-- 11월 캘린더로 이동  -->
						<img id="prevnextbtn" src="../images/btn_next.png" alt="다음"></a>
				</p>
			</div>
			</div>
			
			<!-- 예약가능 예약불가 버튼 색깔 안내 -->
			<p class="resColor" style="user-select: auto;">
				<img src="../images/예약가능.PNG" alt="예약가능"> 
				<span class="blue" style="user-select: auto;">예약가능</span> &nbsp;
				<img src="../images/예약불가.PNG" alt="예약완료"> 
				<span class="red" style="user-select: auto;">예약완료</span>
			</p>
			
			<!-- 하단 : 일자 부분 -->
			<div class="cal_l">
				<table id="calendar" class="schedule">
					<colgroup>
							<col class="cols">						
							<col class="cols">						
							<col class="cols">						
							<col class="cols">						
							<col class="cols">						
							<col class="cols">						
							<col class="cols">											
					</colgroup>
					<thead>
						<tr>
							<th class="sun">SUN</th>
							<th >MON</th>
							<th >TUE</th>
							<th >WED</th>
							<th >THU</th>
							<th >FRI</th>
							<th class="sat">SAT</th>
						</tr>
					</thead>
					<tr class="tr_view">
							<td class="btn_pop sun" id="2023-10-01">
								<p>1</p>
									<div class="layerDiv">
											<table id="resList">
												<tr class="tflex">
													<td class="possibleBtn"> 
														<button type="button" id="g001" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-001)</button> 
														<input type="hidden" name="roomIdx" value="G001">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g002" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-002)</button> 
														<input type="hidden" name="roomIdx" value="G002">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g003" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-003)</button> 
														<input type="hidden" name="roomIdx" value="G003">
														<input type="hidden" name="roomAble" value="1">
													<td class="possibleBtn"> 
														<button type="button" id="g004" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-004)</button> 
														<input type="hidden" name="roomIdx" value="G004">
														<input type="hidden" name="roomAble" value="1">									
												</tr>
											</table>
									</div>														
							</td>
							<td class="btn_pop sun" id="2023-10-02">
								<p>2</p>
									<div class="layerDiv">
											<table id="resList">
												<tr class="tflex">
													<td class="possibleBtn"> 
														<button type="button" id="g001" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-001)</button> 
														<input type="hidden" name="roomIdx" value="G001">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g002" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-002)</button> 
														<input type="hidden" name="roomIdx" value="G002">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g003" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-003)</button> 
														<input type="hidden" name="roomIdx" value="G003">
														<input type="hidden" name="roomAble" value="1">
													<td class="possibleBtn"> 
														<button type="button" id="g004" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-004)</button> 
														<input type="hidden" name="roomIdx" value="G004">
														<input type="hidden" name="roomAble" value="1">									
												</tr>
											</table>
									</div>								
							</td>
							<td class="btn_pop sun" id="2023-10-03">
								<p>3</p>
									<div class="layerDiv">
											<table id="resList">
												<tr class="tflex">
													<td class="possibleBtn"> 
														<button type="button" id="g001" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-001)</button> 
														<input type="hidden" name="roomIdx" value="G001">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g002" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-002)</button> 
														<input type="hidden" name="roomIdx" value="G002">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g003" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-003)</button> 
														<input type="hidden" name="roomIdx" value="G003">
														<input type="hidden" name="roomAble" value="1">
													<td class="possibleBtn"> 
														<button type="button" id="g004" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-004)</button> 
														<input type="hidden" name="roomIdx" value="G004">
														<input type="hidden" name="roomAble" value="1">									
												</tr>
											</table>
									</div>														
							</td>
							<td class="btn_pop" id="2023-10-04">
								<p>4</p>
									<div class="layerDiv">
											<table id="resList">
												<tr class="tflex">
													<td class="possibleBtn"> 
														<button type="button" id="g001" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-001)</button> 
														<input type="hidden" name="roomIdx" value="G001">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g002" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-002)</button> 
														<input type="hidden" name="roomIdx" value="G002">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g003" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-003)</button> 
														<input type="hidden" name="roomIdx" value="G003">
														<input type="hidden" name="roomAble" value="1">
													<td class="possibleBtn"> 
														<button type="button" id="g004" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-004)</button> 
														<input type="hidden" name="roomIdx" value="G004">
														<input type="hidden" name="roomAble" value="1">									
												</tr>
											</table>
									</div>														
							</td>
							<td class="btn_pop" id="2023-10-05">
								<p>5</p>
									<div class="layerDiv">
											<table id="resList">
												<tr class="tflex">
													<td class="possibleBtn"> 
														<button type="button" id="g001" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-001)</button> 
														<input type="hidden" name="roomIdx" value="G001">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g002" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-002)</button> 
														<input type="hidden" name="roomIdx" value="G002">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g003" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-003)</button> 
														<input type="hidden" name="roomIdx" value="G003">
														<input type="hidden" name="roomAble" value="1">
													<td class="possibleBtn"> 
														<button type="button" id="g004" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-004)</button> 
														<input type="hidden" name="roomIdx" value="G004">
														<input type="hidden" name="roomAble" value="1">									
												</tr>
											</table>
									</div>														
							</td>
							<td class="btn_pop" id="2023-10-06">
								<p>6</p>
									<div class="layerDiv">
											<table id="resList">
												<tr class="tflex">
													<td class="possibleBtn"> 
														<button type="button" id="g001" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-001)</button> 
														<input type="hidden" name="roomIdx" value="G001">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g002" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-002)</button> 
														<input type="hidden" name="roomIdx" value="G002">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g003" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-003)</button> 
														<input type="hidden" name="roomIdx" value="G003">
														<input type="hidden" name="roomAble" value="1">
													<td class="possibleBtn"> 
														<button type="button" id="g004" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-004)</button> 
														<input type="hidden" name="roomIdx" value="G004">
														<input type="hidden" name="roomAble" value="1">									
												</tr>
											</table>
									</div>														
							</td>
							<td class="btn_pop sat" id="2023-10-07">
								<p>7</p>
									<div class="layerDiv">
											<table id="resList">
												<tr class="tflex">
													<td class="possibleBtn"> 
														<button type="button" id="g001" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-001)</button> 
														<input type="hidden" name="roomIdx" value="G001">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g002" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-002)</button> 
														<input type="hidden" name="roomIdx" value="G002">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g003" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-003)</button> 
														<input type="hidden" name="roomIdx" value="G003">
														<input type="hidden" name="roomAble" value="1">
													<td class="possibleBtn"> 
														<button type="button" id="g004" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-004)</button> 
														<input type="hidden" name="roomIdx" value="G004">
														<input type="hidden" name="roomAble" value="1">									
												</tr>
											</table>
									</div>														
							</td>	
						</tr>
						<tr class="tr_view">
							<td class="btn_pop sun" id="2023-10-08">
								<p>8</p>
<div class="layerDiv">
											<table id="resList">
												<tr class="tflex">
													<td class="possibleBtn"> 
														<button type="button" id="g001" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-001)</button> 
														<input type="hidden" name="roomIdx" value="G001">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g002" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-002)</button> 
														<input type="hidden" name="roomIdx" value="G002">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g003" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-003)</button> 
														<input type="hidden" name="roomIdx" value="G003">
														<input type="hidden" name="roomAble" value="1">
													<td class="possibleBtn"> 
														<button type="button" id="g004" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-004)</button> 
														<input type="hidden" name="roomIdx" value="G004">
														<input type="hidden" name="roomAble" value="1">									
												</tr>
											</table>
									</div>													
							</td>
							<td class="btn_pop sun" id="2023-10-09">
								<p>9</p>
									<div class="layerDiv">
											<table id="resList">
												<tr class="tflex">
													<td class="possibleBtn"> 
														<button type="button" id="g001" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-001)</button> 
														<input type="hidden" name="roomIdx" value="G001">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g002" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-002)</button> 
														<input type="hidden" name="roomIdx" value="G002">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g003" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-003)</button> 
														<input type="hidden" name="roomIdx" value="G003">
														<input type="hidden" name="roomAble" value="1">
													<td class="possibleBtn"> 
														<button type="button" id="g004" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-004)</button> 
														<input type="hidden" name="roomIdx" value="G004">
														<input type="hidden" name="roomAble" value="1">									
												</tr>
											</table>
									</div>								
							</td>
							<td class="btn_pop" id="2023-10-10">
								<p>10</p>
									<div class="layerDiv">
											<table id="resList">
												<tr class="tflex">
													<td class="possibleBtn"> 
														<button type="button" id="g001" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-001)</button> 
														<input type="hidden" name="roomIdx" value="G001">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g002" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-002)</button> 
														<input type="hidden" name="roomIdx" value="G002">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g003" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-003)</button> 
														<input type="hidden" name="roomIdx" value="G003">
														<input type="hidden" name="roomAble" value="1">
													<td class="possibleBtn"> 
														<button type="button" id="g004" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-004)</button> 
														<input type="hidden" name="roomIdx" value="G004">
														<input type="hidden" name="roomAble" value="1">									
												</tr>
											</table>
									</div>													
							</td>
							<td class="btn_pop" id="2023-10-11">
								<p>11</p>
									<div class="layerDiv">
											<table id="resList">
												<tr class="tflex">
													<td class="possibleBtn"> 
														<button type="button" id="g001" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-001)</button> 
														<input type="hidden" name="roomIdx" value="G001">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g002" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-002)</button> 
														<input type="hidden" name="roomIdx" value="G002">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g003" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-003)</button> 
														<input type="hidden" name="roomIdx" value="G003">
														<input type="hidden" name="roomAble" value="1">
													<td class="possibleBtn"> 
														<button type="button" id="g004" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-004)</button> 
														<input type="hidden" name="roomIdx" value="G004">
														<input type="hidden" name="roomAble" value="1">									
												</tr>
											</table>
									</div>														
							</td>
							<td class="btn_pop" id="2023-10-12">
								<p>12</p>
									<div class="layerDiv">
											<table id="resList">
												<tr class="tflex">
													<td class="possibleBtn"> 
														<button type="button" id="g001" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-001)</button> 
														<input type="hidden" name="roomIdx" value="G001">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g002" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-002)</button> 
														<input type="hidden" name="roomIdx" value="G002">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g003" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-003)</button> 
														<input type="hidden" name="roomIdx" value="G003">
														<input type="hidden" name="roomAble" value="1">
													<td class="possibleBtn"> 
														<button type="button" id="g004" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-004)</button> 
														<input type="hidden" name="roomIdx" value="G004">
														<input type="hidden" name="roomAble" value="1">									
												</tr>
											</table>
									</div>														
							</td>
							<td class="btn_pop" id="2023-10-13">
								<p>13</p>
									<div class="layerDiv">
											<table id="resList">
												<tr class="tflex">
													<td class="possibleBtn"> 
														<button type="button" id="g001" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-001)</button> 
														<input type="hidden" name="roomIdx" value="G001">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g002" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-002)</button> 
														<input type="hidden" name="roomIdx" value="G002">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g003" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-003)</button> 
														<input type="hidden" name="roomIdx" value="G003">
														<input type="hidden" name="roomAble" value="1">
													<td class="possibleBtn"> 
														<button type="button" id="g004" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-004)</button> 
														<input type="hidden" name="roomIdx" value="G004">
														<input type="hidden" name="roomAble" value="1">									
												</tr>
											</table>
									</div>														
							</td>
							<td class="btn_pop sat" id="2023-10-14">
								<p>14</p>
									<div class="layerDiv">
											<table id="resList">
												<tr class="tflex">
													<td class="possibleBtn"> 
														<button type="button" id="g001" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-001)</button> 
														<input type="hidden" name="roomIdx" value="G001">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g002" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-002)</button> 
														<input type="hidden" name="roomIdx" value="G002">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g003" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-003)</button> 
														<input type="hidden" name="roomIdx" value="G003">
														<input type="hidden" name="roomAble" value="1">
													<td class="possibleBtn"> 
														<button type="button" id="g004" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-004)</button> 
														<input type="hidden" name="roomIdx" value="G004">
														<input type="hidden" name="roomAble" value="1">									
												</tr>
											</table>
									</div>														
							</td>	
						</tr>
						<tr class="tr_view">
							<td class="btn_pop sun" id="2023-10-15">
								<p>15</p>
									<div class="layerDiv">
											<table id="resList">
												<tr class="tflex">
													<td class="possibleBtn"> 
														<button type="button" id="g001" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-001)</button> 
														<input type="hidden" name="roomIdx" value="G001">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g002" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-002)</button> 
														<input type="hidden" name="roomIdx" value="G002">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g003" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-003)</button> 
														<input type="hidden" name="roomIdx" value="G003">
														<input type="hidden" name="roomAble" value="1">
													<td class="possibleBtn"> 
														<button type="button" id="g004" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-004)</button> 
														<input type="hidden" name="roomIdx" value="G004">
														<input type="hidden" name="roomAble" value="1">									
												</tr>
											</table>
									</div>														
							</td>
							<td class="mon btn_pop" id="2023-10-16">
								<p>16</p>
									<div class="layerDiv">
											<table id="resList">
												<tr class="tflex">
													<td class="possibleBtn"> 
														<button type="button" id="g001" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-001)</button> 
														<input type="hidden" name="roomIdx" value="G001">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g002" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-002)</button> 
														<input type="hidden" name="roomIdx" value="G002">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g003" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-003)</button> 
														<input type="hidden" name="roomIdx" value="G003">
														<input type="hidden" name="roomAble" value="1">
													<td class="possibleBtn"> 
														<button type="button" id="g004" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-004)</button> 
														<input type="hidden" name="roomIdx" value="G004">
														<input type="hidden" name="roomAble" value="1">									
												</tr>
											</table>
									</div>
							</td>
								
							<td class="mon btn_pop" id="2023-10-17">
								<p>17</p>
									<div class="layerDiv">
											<table id="resList">
												<tr class="tflex">
													<td class="possibleBtn"> 
														<button type="button" id="g001" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-001)</button> 
														<input type="hidden" name="roomIdx" value="G001">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g002" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-002)</button> 
														<input type="hidden" name="roomIdx" value="G002">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g003" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-003)</button> 
														<input type="hidden" name="roomIdx" value="G003">
														<input type="hidden" name="roomAble" value="1">
													<td class="possibleBtn"> 
														<button type="button" id="g004" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-004)</button> 
														<input type="hidden" name="roomIdx" value="G004">
														<input type="hidden" name="roomAble" value="1">									
												</tr>
											</table>
									</div>
								
							</td>
							<td class="mon btn_pop" id="2023-10-18">
								<p>18</p>
									<div class="layerDiv">
											<table id="resList">
												<tr class="tflex">
													<td class="possibleBtn"> 
														<button type="button" id="g001" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-001)</button> 
														<input type="hidden" name="roomIdx" value="G001">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g002" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-002)</button> 
														<input type="hidden" name="roomIdx" value="G002">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g003" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-003)</button> 
														<input type="hidden" name="roomIdx" value="G003">
														<input type="hidden" name="roomAble" value="1">
													<td class="possibleBtn"> 
														<button type="button" id="g004" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-004)</button> 
														<input type="hidden" name="roomIdx" value="G004">
														<input type="hidden" name="roomAble" value="1">									
												</tr>
											</table>
									</div>								
								
							</td>
							<td class="mon btn_pop" id="2023-10-19">
								<p>19</p>
									<div class="layerDiv">
											<table id="resList">
												<tr class="tflex">
													<td class="possibleBtn"> 
														<button type="button" id="g001" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-001)</button> 
														<input type="hidden" name="roomIdx" value="G001">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g002" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-002)</button> 
														<input type="hidden" name="roomIdx" value="G002">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g003" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-003)</button> 
														<input type="hidden" name="roomIdx" value="G003">
														<input type="hidden" name="roomAble" value="1">
													<td class="possibleBtn"> 
														<button type="button" id="g004" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-004)</button> 
														<input type="hidden" name="roomIdx" value="G004">
														<input type="hidden" name="roomAble" value="1">									
												</tr>
											</table>
									</div>														
							</td>
							<td class="mon btn_pop" id="2023-10-20">
								<p>20</p>
									<div class="layerDiv">
											<table id="resList">
												<tr class="tflex">
													<td class="possibleBtn"> 
														<button type="button" id="g001" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-001)</button> 
														<input type="hidden" name="roomIdx" value="G001">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g002" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-002)</button> 
														<input type="hidden" name="roomIdx" value="G002">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g003" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-003)</button> 
														<input type="hidden" name="roomIdx" value="G003">
														<input type="hidden" name="roomAble" value="1">
													<td class="possibleBtn"> 
														<button type="button" id="g004" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-004)</button> 
														<input type="hidden" name="roomIdx" value="G004">
														<input type="hidden" name="roomAble" value="1">									
												</tr>
											</table>
									</div>														
							</td>
							<td class="btn_pop sat" id="2023-10-21">
								<p>21</p>
									<div class="layerDiv">
											<table id="resList">
												<tr class="tflex">
													<td class="possibleBtn"> 
														<button type="button" id="g001" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-001)</button> 
														<input type="hidden" name="roomIdx" value="G001">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g002" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-002)</button> 
														<input type="hidden" name="roomIdx" value="G002">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g003" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-003)</button> 
														<input type="hidden" name="roomIdx" value="G003">
														<input type="hidden" name="roomAble" value="1">
													<td class="possibleBtn"> 
														<button type="button" id="g004" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-004)</button> 
														<input type="hidden" name="roomIdx" value="G004">
														<input type="hidden" name="roomAble" value="1">									
												</tr>
											</table>
									</div>														
							</td>	
						</tr>
						<tr class="tr_view">
							<td class="sun btn_pop" id="2023-10-22">
								<p>22</p>
									<div class="layerDiv">
											<table id="resList">
												<tr class="tflex">
													<td class="possibleBtn"> 
														<button type="button" id="g001" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-001)</button> 
														<input type="hidden" name="roomIdx" value="G001">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g002" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-002)</button> 
														<input type="hidden" name="roomIdx" value="G002">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g003" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-003)</button> 
														<input type="hidden" name="roomIdx" value="G003">
														<input type="hidden" name="roomAble" value="1">
													<td class="possibleBtn"> 
														<button type="button" id="g004" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-004)</button> 
														<input type="hidden" name="roomIdx" value="G004">
														<input type="hidden" name="roomAble" value="1">									
												</tr>
											</table>
									</div>														
							</td>
							<td class="mon btn_pop" id="2023-10-23">
								<p>23</p>
									<div class="layerDiv">
											<table id="resList">
												<tr class="tflex">
													<td class="possibleBtn"> 
														<button type="button" id="g001" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-001)</button> 
														<input type="hidden" name="roomIdx" value="G001">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g002" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-002)</button> 
														<input type="hidden" name="roomIdx" value="G002">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g003" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-003)</button> 
														<input type="hidden" name="roomIdx" value="G003">
														<input type="hidden" name="roomAble" value="1">
													<td class="possibleBtn"> 
														<button type="button" id="g004" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-004)</button> 
														<input type="hidden" name="roomIdx" value="G004">
														<input type="hidden" name="roomAble" value="1">									
												</tr>
											</table>
									</div>								
								
							</td>
							<td class="mon btn_pop" id="2023-10-24">
								<p>24</p>
									<div class="layerDiv">
											<table id="resList">
												<tr class="tflex">
													<td class="possibleBtn"> 
														<button type="button" id="g001" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-001)</button> 
														<input type="hidden" name="roomIdx" value="G001">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g002" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-002)</button> 
														<input type="hidden" name="roomIdx" value="G002">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g003" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-003)</button> 
														<input type="hidden" name="roomIdx" value="G003">
														<input type="hidden" name="roomAble" value="1">
													<td class="possibleBtn"> 
														<button type="button" id="g004" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-004)</button> 
														<input type="hidden" name="roomIdx" value="G004">
														<input type="hidden" name="roomAble" value="1">									
												</tr>
											</table>
									</div>														
							</td>
							<td class="mon btn_pop" id="2023-10-25">
								<p>25</p>
									<div class="layerDiv">
											<table id="resList">
												<tr class="tflex">
													<td class="possibleBtn"> 
														<button type="button" id="g001" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-001)</button> 
														<input type="hidden" name="roomIdx" value="G001">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g002" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-002)</button> 
														<input type="hidden" name="roomIdx" value="G002">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g003" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-003)</button> 
														<input type="hidden" name="roomIdx" value="G003">
														<input type="hidden" name="roomAble" value="1">
													<td class="possibleBtn"> 
														<button type="button" id="g004" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-004)</button> 
														<input type="hidden" name="roomIdx" value="G004">
														<input type="hidden" name="roomAble" value="1">									
												</tr>
											</table>
									</div>														
							</td>
							<td class="mon btn_pop" id="2023-10-26">
								<p>26</p>
									<div class="layerDiv">
											<table id="resList">
												<tr class="tflex">
													<td class="possibleBtn"> 
														<button type="button" id="g001" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-001)</button> 
														<input type="hidden" name="roomIdx" value="G001">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g002" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-002)</button> 
														<input type="hidden" name="roomIdx" value="G002">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g003" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-003)</button> 
														<input type="hidden" name="roomIdx" value="G003">
														<input type="hidden" name="roomAble" value="1">
													<td class="possibleBtn"> 
														<button type="button" id="g004" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-004)</button> 
														<input type="hidden" name="roomIdx" value="G004">
														<input type="hidden" name="roomAble" value="1">									
												</tr>
											</table>
									</div>														
							</td>
							<td class="mon btn_pop" id="2023-10-27">
								<p>27</p>
									<div class="layerDiv">
											<table id="resList">
												<tr class="tflex">
													<td class="possibleBtn"> 
														<button type="button" id="g001" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-001)</button> 
														<input type="hidden" name="roomIdx" value="G001">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g002" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-002)</button> 
														<input type="hidden" name="roomIdx" value="G002">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g003" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-003)</button> 
														<input type="hidden" name="roomIdx" value="G003">
														<input type="hidden" name="roomAble" value="1">
													<td class="possibleBtn"> 
														<button type="button" id="g004" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-004)</button> 
														<input type="hidden" name="roomIdx" value="G004">
														<input type="hidden" name="roomAble" value="1">									
												</tr>
											</table>
									</div>														
							</td>
							<td class="btn_pop sat" id="2023-10-28">
								<p>28</p>
									<div class="layerDiv">
											<table id="resList">
												<tr class="tflex">
													<td class="possibleBtn"> 
														<button type="button" id="g001" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-001)</button> 
														<input type="hidden" name="roomIdx" value="G001">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g002" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-002)</button> 
														<input type="hidden" name="roomIdx" value="G002">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g003" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-003)</button> 
														<input type="hidden" name="roomIdx" value="G003">
														<input type="hidden" name="roomAble" value="1">
													<td class="possibleBtn"> 
														<button type="button" id="g004" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-004)</button> 
														<input type="hidden" name="roomIdx" value="G004">
														<input type="hidden" name="roomAble" value="1">									
												</tr>
											</table>
									</div>														
							</td>	
						</tr>
						<tr class="tr_view">
							<td class="btn_pop sun" id="2023-10-29">
								<p>29</p>
									<div class="layerDiv">
											<table id="resList">
												<tr class="tflex">
													<td class="possibleBtn"> 
														<button type="button" id="g001" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-001)</button> 
														<input type="hidden" name="roomIdx" value="G001">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g002" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-002)</button> 
														<input type="hidden" name="roomIdx" value="G002">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g003" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-003)</button> 
														<input type="hidden" name="roomIdx" value="G003">
														<input type="hidden" name="roomAble" value="1">
													<td class="possibleBtn"> 
														<button type="button" id="g004" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-004)</button> 
														<input type="hidden" name="roomIdx" value="G004">
														<input type="hidden" name="roomAble" value="1">									
												</tr>
											</table>
									</div>														
							</td>
							<td class="btn_pop" id="2023-10-30">
								<p>30</p>
									<div class="layerDiv">
											<table id="resList">
												<tr class="tflex">
													<td class="possibleBtn"> 
														<button type="button" id="g001" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-001)</button> 
														<input type="hidden" name="roomIdx" value="G001">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g002" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-002)</button> 
														<input type="hidden" name="roomIdx" value="G002">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g003" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-003)</button> 
														<input type="hidden" name="roomIdx" value="G003">
														<input type="hidden" name="roomAble" value="1">
													<td class="possibleBtn"> 
														<button type="button" id="g004" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-004)</button> 
														<input type="hidden" name="roomIdx" value="G004">
														<input type="hidden" name="roomAble" value="1">									
												</tr>
											</table>
									</div>								
								
							</td>
							<td class="btn_pop" id="2023-10-31">
								<p>31</p>
									<div class="layerDiv">
											<table id="resList">
												<tr class="tflex">
													<td class="possibleBtn"> 
														<button type="button" id="g001" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-001)</button> 
														<input type="hidden" name="roomIdx" value="G001">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g002" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-002)</button> 
														<input type="hidden" name="roomIdx" value="G002">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g003" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-003)</button> 
														<input type="hidden" name="roomIdx" value="G003">
														<input type="hidden" name="roomAble" value="1">
													<td class="possibleBtn"> 
														<button type="button" id="g004" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-004)</button> 
														<input type="hidden" name="roomIdx" value="G004">
														<input type="hidden" name="roomAble" value="1">									
												</tr>
											</table>
									</div>														
							</td>
							<td class="nextmon btn_pop" id="2023-11-01">
							</td>
							<td class="nextmon btn_pop" id="2023-11-02">
							</td>
							<td class="nextmon btn_pop" id="2023-11-03">
							</td>
							<td class="nextmon btn_pop" id="2023-11-04">
							</td>	
						</tr>												
					
					
					
					
				
		
				</table>
			</div>
		</div>
	</div>




		
			
			
				
					
					


<!-- 여기 건들면 굉장히 위험합니다......다 날라가... 예약못해.. 결제 못해... -->
<!-- 여기 건들면 굉장히 위험합니다......다 날라가... 예약못해.. 결제 못해... -->
<!-- 여기 건들면 굉장히 위험합니다......다 날라가... 예약못해.. 결제 못해... -->
<!-- 여기 건들면 굉장히 위험합니다......다 날라가... 예약못해.. 결제 못해... -->
<!-- 여기 건들면 굉장히 위험합니다......다 날라가... 예약못해.. 결제 못해... -->
<!-- 여기 건들면 굉장히 위험합니다......다 날라가... 예약못해.. 결제 못해... -->
<!-- 여기 건들면 굉장히 위험합니다......다 날라가... 예약못해.. 결제 못해... -->
<!-- 여기 건들면 굉장히 위험합니다......다 날라가... 예약못해.. 결제 못해... -->
<!-- 여기 건들면 굉장히 위험합니다......다 날라가... 예약못해.. 결제 못해... -->
<!-- 여기 건들면 굉장히 위험합니다......다 날라가... 예약못해.. 결제 못해... -->

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
		       		<form>
			       		<label>예약날짜 : </label>
						<input type="text" name="resday" value="2023.10.11">
						<br>
						
						<label>캠핑장 유형 : </label>
						<input type="text" name="camptype" value="글램핑(G)">
						<br>
						
						<label>자리 번호 : </label>
						<input type="text" name="campnum" value="001">	
						<br>
						
						<label>인원수 : </label>
							<select name="peoplenum" id="peoplenum" required>
							  <option value="선택하세요" disabled selected>선택하세요</option>
							  <option value="2">2</option>
							  <option value="2">3</option>
							  <option value="4">4</option>
							</select>
						
						<br>
						
						<label id="내용">입실일 :</label>
						<input type="text" name="campnum" value="2023.10.25.">
						<br>
						
						<label>퇴실일 : </label>
							<select name="exitday" id="exitday" required>
							  <option value="선택하세요" disabled selected>선택하세요</option>
							  <option value="2023.10.26.">2023.10.26.</option>
							  <option value="2023.10.27.">2023.10.27.</option>
							</select>
						<br>
						
						<label>금액 : </label>
						<input type="text" name="money" value="200,000원">
						<br>
		       		</form>
		       		
		       	</div>
		       
		       <!-- 예약화면 우측 -->
		       	<div id="res2">
		       		<form>
		       			<p>
		       			<span>※ 예약 전 주의사항</span><br>
						- 기준 인원 2명, 최대 4명 입니다.<br>
						- 1인 당 추가요금은 10,000원 입니다.<br>
						- 연박 가능 일수는 최대 2일 입니다.<br>
						  (ex. 입실: 2023.10.01 -> 퇴실: 2023.10.03 까지<br>
						</p>	
		       		</form>
		       		
		       		<br>
		       		
		       		<form>
		       			<p>
		       			 <span>[ 객 실 정 보 ]</span><br>
						 - 숙박 입실 : 오후 3시 퇴실 오전 11시<br>
						 - 이용시설 : 화장실과 샤워실은 실외 이용<br>
						 - 취사여부 : 개인취사가능<br>
						</p>	
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


<!-- 예약화면에서 옵션 선택(인원수, 퇴실일 등)후 넘어가는 결제화면 모달-->
<div class="modal fade" id="payModal" >
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">


      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">카카오페이 결제</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
      	<img src="../images/카카오페이QR.JPG" alt="카카오페이QR.jpg">
      
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
      <button type="button" class="btn btn-danger" data-bs-dismiss="modal">닫기</button>	
      </div>

    </div>
  </div>
</div>


		

</body>
</html>
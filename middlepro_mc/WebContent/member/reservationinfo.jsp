<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약조회</title>
<script src="../js/jquery-3.7.1.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="../css/basic.css">
<link rel="stylesheet" href="../css/mypage_iframe.css">

<!-- 스타일 부분 -->
<style>

#campRes{
	margin-bottom: 60px;
}
input[type=button], button {
	margin: 5px;
	border-radius: 30px;
}
#resCancelBtn {
	margin-top : 40px;
	text-align: center;
}
table{
	margin: 30px;
}
table, table th, table td{
	border: 1px solid gray;
	padding: 20px;
}
table th{
	background: lightgray;
	font-size: 1.1rem;
}
table td{
	font-size: 0.8rem;
}
#resCancel p{
	font-size: 1.4rem;
	margin-bottom: 10px;
}
#resCancel span{
	color: red;
}
.modal-body{
	text-align: center;
}
 .modal-footer{
 	display: flex;
 	justify-content: center;
 }
</style>


<!-- 내부 스크립트 부분  -->
<script>

//환불 가능 유무에 따른 텍스트 색상 표시
function refundColor(){
	const refundText = document.querySelectorAll('.refund');
	
	refundText.forEach(element => {
		const refundText = element.textContent.trim();
		if(refundText === '환불가능'){
			element.style.color = 'blue';
		}else if(refundText === '환불불가'){
			element.style.color = 'red';
		}
	});
}


document.addEventListener('DOMContentLoaded', () => {
	refundColor();
	resBtnAlert();
}) 


// 체크박스 미 선택시 예약취소 눌렀을 때 옵션 선택 alert창 띄우기  
function resBtnAlert(){
	 const cancelButton = document.getElementById('resCancelBtn');
	    cancelButton.addEventListener('click', () => {
	        const checkboxes = document.querySelectorAll('input[type="checkbox"]:checked');

	        if (checkboxes.length === 0) {
	            alert('취소할 예약 내역을 선택해주세요.');
	            return false;
	        } else {
	            // TODO: Implement reservation cancellation logic here
	            // 예약 취소 로직을 여기에 구현하세요
	        	$('#resCancelModal').modal('show');
	        
	        }
	       
	    });
	}
	
	
$(function() {
 /* 	// 본인인증
	$('#pwinsert').on('click', function() {
		vpass = $('#pwd').val();
		
		if(vpass == "1234") {	// 현재 로그인한 사람의 비밀번호(예시 1234)와 비교
			location.href="../member/reservationinfoSuccess.jsp";
		}
	});  */
	
 	// 예약취소 버튼 클릭
	$('#cancelSuccess').on('click', function() {
		
		// DB 삭제 성공시 띄우기
		alert("예약 취소 되었습니다.");
		location.href="../member/reservationinfoSuccess.jsp";
		
	}); 
	
});	


</script>


</head>
<body>
<div class="infoIframeDiv">
  <h2 class="pageTitle" id="campRes">캠핑장 예약 조회</h2>
  
  <form id="reservationInfoForm">
  	<table>
  		<tr>
  			<th>선택</th>
  			<th>캠핑장 번호</th>
  			<th>인원수</th>
  			<th>이용기간</th>
  			<th>결제금액</th>
  			<th>비고</th>
  		</tr>
  		<tr>
  			<td><input type="checkbox"></td>
  			<td>G001</td>
  			<td>2</td>
  			<td>2023.10.12~ 2023.10.13</td>
  			<td>150,000원</td>
  			<td class="refund">환불불가</td>
  		</tr>
  		<tr>
  			<td><input type="checkbox"></td>
  			<td>A001</td>
  			<td>4</td>
  			<td>2023.10.29~ 2023.10.30</td>
  			<td>350,000원</td>
  			<td class="refund">환불가능</td>
  		</tr>  		
  		
  	</table>
  	
  	<input type="button" id="resCancelBtn" value="예약 취소" 
  	class="btn-sm" data-bs-toggle="modal" onclick="resBtnAlert()">
  	
  	<!-- data-bs-target="#resCancelModal" -->
    
    
  </form>
</div>




<!-- 예약취소 버튼 클릭 시 출력되는 취소 확인 모달창 -->
<div class="modal fade" id="resCancelModal" >
  <div class="modal-dialog modal-dialog-centered modal-sm">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h6 class="modal-title">예약 취소</h6>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
      

		      	<!-- 예약화면 좌측 -->
		       	<div id="resCancel">
		       		<p>예약을 <span>취소</span>하시겠습니까?</p>
		       		<span>(취소된 내역은 복구되지 않습니다.)</span>	       	
		       	</div>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">	
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">닫기</button>
        <!-- data-bs-toggle="modal" data-bs-target="#payModal" 때문에 애썼다.. 주의하기.. -->
        <button type="button" class="btn btn-primary" id="pwinsert" 
        data-bs-toggle="modal" data-bs-target="#resCancePWModal">다음 단계</button>
        <!-- data-bs-toggle="modal" data-bs-target="#payModal"  -->
      </div>

    </div>
  </div>
</div>


<!-- 예약 취소 확인 비밀번호 입력 모달 창 -->
<div class="modal fade" id="resCancePWModal" >
  <div class="modal-dialog modal-dialog-centered modal-sm">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h6 class="modal-title">예약 취소</h6>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
      

		      	<!-- 예약화면 좌측 -->
		       	<div id="resCancel">
		       		<p>예약<span>취소</span> 확인 PW 입력</p>
		       		<input type="password">	       	
		       	</div>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">	
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">닫기</button>
        <!-- data-bs-toggle="modal" data-bs-target="#payModal" 때문에 애썼다.. 주의하기.. -->
        <button type="button" class="btn btn-primary" id="cancelSuccess">확인</button>
        <!-- data-bs-toggle="modal" data-bs-target="#payModal"  -->
      </div>

    </div>
  </div>
</div>





</body>
</html>
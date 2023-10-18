<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 취소 내역 조회</title>
<script src="../js/jquery-3.7.1.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="../css/basic.css">
<link rel="stylesheet" href="../css/mypage_iframe.css">
<style>

#campRes{
	margin-bottom: 60px;
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



</style>

<script>

//환불 가능 유무에 따른 텍스트 색상 표시
function refundColor(){
	const refundText = document.querySelectorAll('.refund');
	
	refundText.forEach(element => {
		const refundText = element.textContent.trim();
		if(refundText === '환불완료'){
			element.style.color = 'green';
		}else if(refundText === '환불불가'){
			element.style.color = 'red';
		}
	});
}

document.addEventListener('DOMContentLoaded', () => {
	refundColor();
})


</script>


</head>
<body>
<div class="infoIframeDiv">
  <h2 class="pageTitle" id="campRes">캠핑장 예약 취소 내역</h2>
  
  <form id="reservationCancelInfoForm">
  	<table>
  		<tr>
  			<th>번호</th>
  			<th>캠핑장 번호</th>
  			<th>인원수</th>
  			<th>이용기간</th>
  			<th>취소일자</th>
  			<th>결제금액</th>
  			<th>비고</th>
  		</tr>
  		<tr>
  			<td>1</td>
  			<td>G001</td>
  			<td>2</td>
  			<td>2023.10.12~ 2023.10.13</td>
  			<td>2023.10.02</td>
  			<td>150,000원</td>
  			<td class="refund">환불불가</td>
  		</tr>
  		<tr>
  			<td>2</td>
  			<td>A001</td>
  			<td>4</td>
  			<td>2023.10.29~ 2023.10.30</td>
  			<td>2023.10.15</td>
  			<td>350,000원</td>
  			<td class="refund">환불완료</td>
  		</tr>  		
  		
  	</table>
  	

  </form>
</div>


</body>
</html>
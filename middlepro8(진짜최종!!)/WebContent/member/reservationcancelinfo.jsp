<%@page import="kr.or.ddit.vo.MemberVO"%>
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
<script src="<%=request.getContextPath()%>/js/rsv.js"></script>



<script>
mypath = "<%=request.getContextPath()%>";



//----------------------------------------------------------------------------- 

$(function() {
	
	<% MemberVO logSession = (MemberVO)session.getAttribute("loginMember");
	String idInfo = logSession.getMem_id();
	%>

    
    var idInfo = "<%= logSession.getMem_id() %>";
    
    $.listCancelServer(idInfo);
    
    
    
 	// 예약취소 버튼 클릭
	$('#cancelSuccess').on('click', function() {
		
		$.updateRefundServer();
		
		
		// 환뷸유무 처리 성공시 예약취소 완료 화면 띄우기
		location.href="../member/reservationinfoSuccess.jsp";
		
	}); 
    

    
});

//-----------------------------------------------------------------------------   

//체크박스 미 선택시 예약취소 눌렀을 때 옵션 선택 alert창 띄우기  
function resBtnAlert() {
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



//-----------------------------------------------------------------------------   





//-----------------------------------------------------------------------------   




</script> 










<style>

#campRes{
	margin-bottom: 160px;
}
table{
	margin: 30px;
}
table td{
	border-bottom: 1px solid black; 
	padding: 20px;
	font-size: 0.7rem;
}
table th{
	padding: 10px;
	background: #d6d46d;
	font-size: 0.9rem;
	border-top: 2px solid black;
	border-bottom: 2px solid black;
	border-left: 0;
	border-right: 0;
	height: 20px;
}
#reservationCancelInfoForm{
	height: 400px;
	overflow: auto;
}
#resCancelBtn {
	margin-top : 40px;
	text-align: center;
	padding: 7px 10px;
   background: #f1f0cb;
   border: none;
   border-radius: 10px;
   height: 30px;
   font-size: 15px;
}
.modal-body{
	text-align: center;
}
 .modal-footer{
 	display: flex;
 	justify-content: center;
}
#resCancel span{
	color: red;
}

</style>




</head>
<body>
<div class="infoIframeDiv">
  <h2 class="pageTitle" id="campRes">캠핑장 예약 내역 조회</h2>
  
  <form id="reservationCancelInfoForm">
  	<table>
  		<tr>
  			<th>선택</th>
  			<th>예약번호</th>
  			<th>예약날짜</th>
  			<th>캠핑장유형</th>
  			<th>입실일</th>
  			<th>퇴실일</th>
  			<th>인원수</th>
  			<th>결제금액</th>
  			<th>예약상태</th> 			
  		</tr>

  	</table>
  	

  </form>
  
  		<!-- data-bs-toggle 없애니까 F12 오류는 안뜨지만 여전히 두번 클릭해서 들어가야함  -->
      	<input type="button" id="resCancelBtn" value="예약 취소" class="btn-sm" onclick="resBtnAlert()">
  
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
        <button type="button" class="btn btn-primary" id="cancelSuccess">확인</button>
        <!-- data-bs-toggle="modal" data-bs-target="#payModal"  -->
      </div>

    </div>
  </div>
</div>





</body>
</html>


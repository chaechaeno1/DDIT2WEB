<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.7.1.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="../css/basic.css">
<link rel="stylesheet" href="../css/mypage_iframe.css">
<style>
button {
	margin: 5px;
	border-radius: 30px;
}

#withdrawalModal .modal-body h4 {
	color : red;
}

.modal-footer {
	 justify-content: center; /* 가운데 정렬을 위해 추가 */
}
</style>
<script>
$(function() {
	// 본인인증
	$('#auth button').on('click', function() {
		vpass = $('#pwd').val();
		
		if(vpass == "1234") {	// 현재 로그인한 사람의 비밀번호(예시 1234)와 비교
			$('#withdrawalModal').modal('show');
		}
	});
	
	// 회원탈퇴 버튼 클릭
	$('#withdrawalBtn').on('click', function() {
		
		// DB 삭제 성공시 띄우기
		alert("탈퇴되었습니다.");
		
		location.href="../member/withdrawalPage.html";
		
	});
	
});
</script>
</head>
<body>
<div class="infoIframeDiv">
  <h2 class="pageTitle">회원탈퇴</h2>
	
  <div id="auth">
	<h4 style="margin-bottom : 30px;">본인인증</h4>
	<label for="pwd">비밀번호</label>
	<input type="password" id="pwd">
	<button>확인</button>
  </div>
</div>
  
<!-- The Modal -->
<div class="modal" id="withdrawalModal">
  <div class="modal-dialog modal-dialog-scrollable">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">탈퇴 시 주의사항</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <h4>1. 계정 복구 불가</h4>
        <p>탈퇴가 완료되면 개인정보는 즉시 파기되며, 복구가 불가합니다.</p>
        <br>
        
        <h4>2. 등록된 게시글 및 댓글 삭제 불가</h4>
        <p>등록된 게시글 및 댓글에 대한 삭제를 원하는 경우<br> 반드시 탈퇴 전에 삭제하시기 바랍니다.</p>
        

      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger btn-lg" data-bs-dismiss="modal" id="withdrawalBtn" data-bs-dismiss="modal">회원탈퇴</button>
      </div>

    </div>
  </div>
</div>


</body>
</html>
<%@page import="kr.or.ddit.vo.MemberVO"%>
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
div#auth {
    margin-top: 200px;
    border: 2px solid gray;
    padding: 30px;
    background: lightgray;
}
#pwd{
	margin-left: 20px;
	margin-right: 10px;
}
#pwdbtn{
   padding: 7px 10px;
   background: #f1f0cb;
   border: none;
   border-radius: 10px;
   height: 30px;
   font-size: 15px;
}
#twoline{
	line-height: 1.5;
}
</style>
<script>
<%
// 로그인 체크 - 서블릿에서 저장한 session값을 얻어온다
MemberVO vo = (MemberVO)session.getAttribute("loginMember");

%>
$(function() {
	// 본인인증
	$('#auth button').on('click', function() {
		vpass = $('#pwd').val();
		
		if(vpass == "<%=vo.getMem_pass()%>") {	// 현재 로그인한 사람의 비밀번호와 비교
			$('#withdrawalModal').modal('show');
		} else {
			alert("본인인증 실패");
		}
	});
	
	// 회원탈퇴 버튼 클릭
	$('#withdrawalBtn').on('click', function() {
		
		if(confirm("정말로 탈퇴하시겠습니까?")) {
			$.ajax({
				url : "<%= request.getContextPath()%>/withdrawalMember.do",
				data : { 
					"mem_id" : "<%=vo.getMem_id()%>", 
					"mem_pass" : "<%=vo.getMem_pass()%>"
				},
				type : 'post',
				dataType : 'json',
				success : function(res) {
					if(res == "성공") {
						$('#withdrawalModal').modal('hide');
						window.top.location.href="<%= request.getContextPath()%>/member/withdrawalPage.jsp";
					} else if(res == "실패") {
						alert("회원탈퇴 실패");
					}
				},
		    	error : function(xhr){
		    		alert("상태 :" + xhr.status);
		    	}
			});
			
		}
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
	<button id="pwdbtn">확인</button>
  </div>
</div>
  
<!-- The Modal -->
<div class="modal" id="withdrawalModal">
  <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered">
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
        <p id="twoline">등록된 게시글 및 댓글에 대한 삭제를 원하는 경우<br>반드시 탈퇴 전에 삭제하시기 바랍니다.</p>
        

      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger btn-lg" id="withdrawalBtn">회원탈퇴</button>
      </div>

    </div>
  </div>
</div>


</body>
</html>
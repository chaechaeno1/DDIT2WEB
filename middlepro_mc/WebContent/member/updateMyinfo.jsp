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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="../css/basic.css">
<link rel="stylesheet" href="../css/mypage_iframe.css">
<style>
#infoUpdateForm {
	width : 670px;
	border : 2px solid red;
	margin : 0 50px;
	text-align: left;
	display: none;
}

#infoUpdateForm * {
	margin : 5px;
	font-size: 0.8rem;
}

#infoUpdateForm label {
	font-size : 1rem;
	width : 150px;
}

#infoUpdateForm div input:not(input[type=button], .email, .addr) {
	display: inline-block;
	width : 150px;
}

.email {
	display : inline-block;
	width : 150px;
}

#email_domain {
	width : auto;
}


input[type=button], button {
	margin: 5px;
	border-radius: 30px;
}

.addr {
	display : inline-block;
	width : 300px;
}

.addr#add1 {
	width : 450px;
}

#bottomBtn {
	margin-top : 50px;
	text-align: center;
}

#bottomBtn * {
	width : 100px;
}

input[readonly]:not(#email2) {
	background: lightgray;
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
			$('#auth').hide();
			$('#infoUpdateForm').show();
		} else {
			alert("본인인증 실패");
		}
		
	});
	
	
	// 비밀번호 일치 여부 확인
	$('#new_pwdconfirm').on('keyup', function() {
		vpwd = $('#new_pwd').val();
		vpwdconfirm = $('#new_pwdconfirm').val();

		if (vpwd === vpwdconfirm && vpwd.length > 0 && vpwdconfirm.length > 0) {
			$('#pwdcheck').text('비밀번호가 일치합니다.').css('color', 'blue');
		} else {
			$('#pwdcheck').text('비밀번호가 일치하지 않습니다.').css('color', 'red');
		}
	});
	
	// 이메일 입력
	$('#email_domain').on('change', function() {
		vdomain = $('#email_domain option:selected').val();
		
		if(vdomain == "direct") {	// 직접 입력하기
			$('#email2').val("");
			$('#email2').removeAttr('readonly');
		} else {
			$('#email2').val(vdomain);
			$('#email2').attr('readonly', 'readonly');
		}
	})
	
	// 우편번호 찾기 버튼 클릭
	$('#zipBtn').on('click', function() {
		new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr1 = ''; // 주소 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr1 = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr1 = data.jibunAddress;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                $('#zip').val(data.zonecode);
                $('#addr1').val(addr1);
                
                // 커서를 상세주소 필드로 이동한다.
                $('#addr2').focus();
            }
        }).open();
	});
	
	// 정보 수정 버튼 클릭
	$('#modifyBtn').on('click', function() {
		
		if($('#new_pwd').val() != $('#new_pwdconfirm').val()) {
			alert("비밀번호 확인란을 다시 작성해주세요.");
			return false;
		}
		
		// 이메일 합쳐서
		$('input[name=mem_mail]').val($('#email1').val() + "@" + $('#email2').val());
		
		
		// name 속성을 이용하여 자동으로 만들기 - test console
		vdata = $('form').serializeArray();
		console.log(vdata);
		
		$.ajax({
			url : "<%= request.getContextPath()%>/updateMember.do",
			data : vdata,
			type : 'post',
			success : function(res) {
				alert(res.str);
				
				if(res.flag == "성공") {
					location.href="<%= request.getContextPath()%>/member/updateMyinfo.jsp";
				}
				
			},
			error : function(xhr) {
				alert("상태 : " + xhr.status);
			},
			dataType : 'json'
		});
	});
	
	
	$('#clearBtn').on('click', function() {
	    $('#infoUpdateForm .clear').attr('value', '');
	});
});
</script>
</head>
<body>
<div class="infoIframeDiv">
  <h2 class="pageTitle">내 정보 수정</h2>
  
  <div id="auth">
	<h4 style="margin-bottom : 30px;">본인인증</h4>
	<label for="pwd">비밀번호</label>
	<input type="password" id="pwd">
	<button>확인</button>
  </div>
  
  <form id="infoUpdateForm">
    <div>
      <label for="id">아이디</label>
      <input type="text" class="form-control" id="id" name="mem_id" value="<%=vo.getMem_id() %>" readonly>
    </div>
    
     <div>
      <label for="new_pwd">새 비밀번호</label>
      <input type="password" class="form-control clear" id="new_pwd" name="mem_pass">
    </div>
    
    <div>
      <label for="new_pwdconfirm">새 비밀번호 확인</label>
      <input type="password" class="form-control clear" id="new_pwdconfirm">
      <span id="pwdcheck"></span>
    </div>
  
    <div>
      <label for="name">이름</label>
      <input type="text" class="form-control" id="name" name="mem_name" value="<%=vo.getMem_name() %>" readonly>
    </div>
      
    <div>
      <label for="bir">생년월일</label>
      <input type="test" class="form-control" id="bir" name="mem_bir" value="<%=vo.getMem_bir() %>" readonly>
    </div>
    
    <div>
      <label for="hp">연락처</label>
      <input type="text" class="form-control clear" id="hp" name="mem_hp" value="<%=vo.getMem_hp()%>">
    </div>
    
  
	<div>
      <label for="email1">이메일</label>
      <%
      	String mem_mail = vo.getMem_mail();
    	String[] emails = mem_mail.split("@");
      %>
      <input type="text" class="form-control email clear" id="email1" value="<%=emails[0]%>">@
      <input type="text" class="form-control email clear" id="email2" value="<%=emails[1]%>">
      <select id="email_domain" class="form-select email">
      	<option value="naver.com">naver.com</option>
      	<option value="hanmail.net">hanmail.net</option>
      	<option value="gmail.com">gmail.com</option>
      	<option value="nate.com">nate.com</option>
      	<option value="direct" selected>직접 입력하기</option>
      </select>
      <input type="hidden" name="mem_mail">
    </div>
    
    <div>
      <label for="zip">우편번호</label>
      <input type="text" class="form-control clear" id="zip" name="mem_zip" value="<%=vo.getMem_zip()%>">
      <input type="button" value="우편번호 찾기" class="btn btn-success btn-sm" id="zipBtn">
    </div>
    
    <div>
      <label for="addr1">주소</label>
      <input type="text" class="form-control clear addr" id="addr1" name="mem_addr1" value="<%=vo.getMem_addr1()%>">
    </div>
    
    <div>
      <label for="addr2">상세주소</label>
      <input type="text" class="form-control clear addr" id="addr2" name="mem_addr2" value="<%=vo.getMem_addr2()%>">
    </div>
  
	<div id="bottomBtn">
	  <button type="button" class="btn btn-primary btn-lg" id="modifyBtn">수정</button>
      <button type="reset" class="btn btn-primary btn-lg" id="clearBtn">초기화</button>
	</div>
    
  </form>
</div>


</body>
</html>
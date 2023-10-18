<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑장</title>
<script src="../js/jquery-3.7.1.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="../css/basic.css">
<style>
#joinDiv {
	margin : 30px auto;
}

#joinForm {
	margin : 0 auto;
}

#joinForm * {
	text-align : left;
	margin : 5px;
}

#pageTitle {
	text-align : center;
	margin-bottom : 50px;
}

#joinForm label {
	width : 100px;
}

#joinForm div input:not(input[type=button], .email, .addr) {
	display: inline-block;
	width : 200px;
}

.email {
	display : inline-block;
	width : 150px;
}

#email_domain {
	width : auto;
}


input[type=button] {
	margin: 5px;
	border-radius: 30px;
}

.addr {
	display : inline-block;
	width : 300px;
}

.addr#addr1 {
	width : 450px;
}


#bottomBtn {
	margin-top : 50px;
	text-align: center;
}

#bottomBtn * {
	text-align: center;
	width : 150px;
}

</style>
<script>
$(function() {
	$('#header').load("../main/header.jsp");
	$('#footer').load("../main/footer.jsp");
	
	// 아이디 중복검사 버튼 클릭
	$('input[value=중복검사]').on('click', function() {
		
		// 입력한 값 가져오기
		idvalue = $('#id').val().trim();
		
		// 값의 형식비교
		idreg = /^[a-z][a-zA-Z0-9]{3,11}$/;	// 4~12자
		if(!(idreg.test(idvalue))) {
			alert("id형식오류 입니다");
			return false;
		}
		
		// 서버로 전송
		$.ajax({
			url : "<%= request.getContextPath()%>/IdCheck.do",
			data : { "id" : idvalue },
			type : 'get',
			success : function(res) {
				if(res.flag == "실패") {
					$('#idcheck').text(res.str).css('color', 'red');
				} else {
					$('#idcheck').text(res.str).css('color', 'blue');
				}
			},
			error : function(xhr) {
				alert("상태 : " + xhr.status);
			},
			dataType : 'json'
		})
	});

	// 
	$('#id').on('keyup', function() {
		$('#idcheck').text("");
	});
	
	// 비밀번호 일치 여부 확인
	$('#pwdconfirm').on('keyup', function() {
		vpwd = $('#pwd').val();
		vpwdconfirm = $('#pwdconfirm').val();

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
	});
	
	// 우편번호 찾기 버튼 클릭
	$('#zipBtn').on('click', function() {
		new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr1 = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr1 = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr1 = data.jibunAddress;
                }
                
             	// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                    	extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
             
                
                } else {
                    extraAddr = '';
                }
             	
             	// extraAddr을 addr1에 연결
             	addr1 = addr1 + extraAddr;

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                $('#zip').val(data.zonecode);
                $('#addr1').val(addr1);
                
                // 커서를 상세주소 필드로 이동한다.
                $('#addr2').focus();
            }
        }).open();
	});
	
	
	// 가입하기
	$('#joinBtn').on('click', function() {
		
		if($(idcheck).text() == "") {
			alert("ID 중복검사는 필수입니다.");
			return false;
		}
		
		// 이메일 합쳐서
		$('input[name=mem_mail]').val($('#email1').val() + "@" + $('#email2').val());
		
		
		// name 속성을 이용하여 자동으로 만들기 - test console
		vdata = $('form').serializeArray();
		console.log(vdata);
		
		$.ajax({
			url : "<%= request.getContextPath()%>/Insert.do",
			data : vdata,
			type : 'post',
			success : function(res) {
				alert(res.str);
				
				if(res.flag == "성공") {
					location.href="http://www.naver.com";	// 서블릿으로 보내거나?
				}
				
			},
			error : function(xhr) {
				alert("상태 : " + xhr.status);
			},
			dataType : 'json'
		})
	})
	
})
</script>
</head>
<body>

<header id="header"></header>
<section id="joinDiv">
  <form id="joinForm">
    <h2 id="pageTitle">회원가입</h2>
    <div>
      <label for="id">아이디</label>
      <input type="text" class="form-control" id="id" name="mem_id">
      <input type="button" value="중복검사" class="btn btn-success btn-sm">
      <span id="idcheck"></span>
    </div>
    
    <div>
      <label for="pwd">비밀번호</label>
      <input type="password" class="form-control" id="pwd" name="mem_pass">
    </div>
    
    <div>
      <label for="pwdconfirm">비밀번호 확인</label>
      <input type="password" class="form-control" id="pwdconfirm">
      <span id="pwdcheck"></span>
    </div>
  
    <div>
      <label for="name">이름</label>
      <input type="text" class="form-control" id="name" name="mem_name">
    </div>
      
    <div>
      <label for="bir">생년월일</label>
      <input type="date" class="form-control" id="bir" name="mem_bir">
    </div>
    
    <div>
      <label for="hp">연락처</label>
      <input type="text" class="form-control" id="hp" name="mem_hp">
    </div>
    
    <div>
      <label for="email1">이메일</label>
      <input type="text" class="form-control email" id="email1">@
      <input type="text" class="form-control email" id="email2">
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
      <input type="text" class="form-control" id="zip" name="mem_zip">
      <input type="button" value="우편번호 찾기" class="btn btn-success btn-sm" id="zipBtn">
    </div>
    
    <div>
      <label for="addr1">주소</label>
      <input type="text" class="form-control addr" id="addr1" name="mem_addr1">
    </div>
    
    <div>
      <label for="addr2">상세주소</label>
      <input type="text" class="form-control addr" id="addr2" name="mem_addr2">
    </div>
  
	<div id="bottomBtn">
	  <button type="button" class="btn btn-primary btn-lg" id="joinBtn">회원가입</button>
      <button type="reset" class="btn btn-primary btn-lg">초기화</button>
	</div>
    
  </form>
</section>
<footer id="footer"></footer>
</body>
</html>
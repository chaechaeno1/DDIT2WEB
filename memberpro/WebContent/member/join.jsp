<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 부트스트랩보다 제이쿼리가 먼저 와있어야함 -->
<script src="../js/jquery-3.7.1.min.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<style>
input[type=button] {
	margin: 5px;
	border-radius: 30px;
}
</style>

<script>
	$(function() {
		$('input[value=중복검사]').on('click', function() {
			
			//입력한 값 가져오기
			idvalue = $('#id').val().trim();
			console.log(idvalue);
			//값의 형식비교
			//소문자로만 시작하기, 소문자,대문자,숫자 올 수 있음, 두번째자리는 3~7자리 올 수 있음, 총 4~8자리 오는 것
			idreg = /^[a-z][a-zA-Z0-9]{3,7}$/
			if(!(idreg.test(idvalue))){
				alert("id형식 오류입니다...");
				return false;
			}
			//서버로 전송
			$.ajax({
				url: "<%=request.getContextPath()%>/IdCheck.do",
				data: {"id": idvalue},
				type: 'get',
				success: function(res){
					$('#idcheck').html(res.flag).css('color','red');
					
				},
				error: function(xhr){
					alert("상태: "+xhr.status)
				},
				dataType: 'json'
				
			})
		})
		
		
		//우편번호 검색
		$('#zipbtn').on('click',function(){
			window.open("searchDong.html","우편번호 찾기", "width=500 height=400");
		})
		
		/* //저장하기 - button type=submit인 경우
		//1) method와 action이 있는 경우 -> button / submit
		//2) method와 action이 없는 경우 -> button / submit
		
		$('form').on('submit',function(){
			//submit의 원래 고유 기능에 대한 이벤트 제거
			event.preventDefault();
			
			//alert("submit");
			
			//입력한 모든 값을 가져온다.
			idvalue = $('#id').val();
			namevalue = $('#name').val();
			birvalue = $('#bir').val();
			pwdvalue = $('#pwd').val();
			hpvalue = $('#hp').val();
			mailvalue = $('#mail').val();
			zipvalue = $('#zip').val();
			add1value = $('#add1').val();
			add2value = $('#add2').val();
			
			
		}) */
		
		
		//submit버튼이 아니고, type=button일 경우...
		$('button[type=button]').on('click',function(){
			//alert("button");
			
			//입력한 모든 값을 가져온다.
			idvalue = $('#id').val();
			//공백 또는 형식 체크 - 틀린경우, return false;
			
			namevalue = $('#name').val();
			//공백 또는 형식 체크
			
			birvalue = $('#bir').val();
			//공백 또는 형식 체크
			
			pwdvalue = $('#pwd').val();
			//공백 또는 형식 체크
			
			hpvalue = $('#hp').val();
			//공백 또는 형식 체크
			
			emailvalue = $('#email').val();
			//공백 또는 형식 체크
			
			zipvalue = $('#zip').val();
			//공백 또는 형식 체크
			
			add1value = $('#add1').val();
			//공백 또는 형식 체크
			
			add2value = $('#add2').val();
			//공백 또는 형식 체크
			
			
			vdata = {"id"	: idvalue, 
					 "name"	: namevalue, 
					 "bir"	: birvalue, 
					 "pwd"	: pwdvalue, 
					 "hp"	: hpvalue,
					 "email": emailvalue,
					 "zip"	: zipvalue,
					 "add1"	: add1value,
					 "add2"	: add2value
					} 
			
			$.ajax({
				url: "<%=request.getContextPath()%>/Insert.do",
				data: vdata,
				type: 'post',
				success: function(res){
					$('#join').html(res.sw).css('color','red');
				},
				error:function(xhr){
					alert("상태: "+xhr.status)
				},
				dataType: 'json'
				
			})
			
					
		})
		

	})
</script>


</head>
<body>
	<div class="container mt-3">
		<h2>회원가입</h2>
		<form>
			<div class="mb-3 mt-3 col-sm-3">
				<label for="id">아이디</label> <input type="button" value="중복검사"
					class="btn btn-outline-danger btn-sm"> <span id="idcheck"></span>
				<input type="text" class="form-control" id="id" name="mem_id">

			</div>

			<div class="mb-3 col-sm-3">
				<label for="name">이름</label> <input type="text" class="form-control"
					id="name" name="mem_name">
			</div>

			<div class="mb-3 col-sm-3">
				<label for="bir">생년월일</label> <input type="date"
					class="form-control" id="bir" name="mem_bir">
			</div>

			<div class="mb-3 col-sm-3">
				<label for="pwd">비밀번호</label> <input type="password"
					class="form-control" id="pwd" name="mem_pass">
			</div>

			<div class="mb-3 col-sm-3">
				<label for="hp">전화번호</label> <input type="text" class="form-control"
					id="hp" name="mem_hp">
			</div>

			<div class="mb-3 col-sm-3">
				<label for="email">이메일</label> <input type="email"
					class="form-control" id="email" name="mem_mail">
			</div>

			<div class="mb-3 col-sm-3">
				<label for="zip">우편번호</label> <input type="button" value="번호검색"
					id="zipbtn" class="btn btn-outline-info btn-sm"> <input
					type="text" class="form-control" id="zip" name="mem_zip">
			</div>

			<div class="mb-3 col-sm-6">
				<label for="add1">주소</label> <input type="text" class="form-control"
					id="add1" name="mem_add1">
			</div>

			<div class="mb-3 col-sm-6">
				<label for="add2">상세주소</label> <input type="text"
					class="form-control" id="add2" name="mem_add2">
			</div>

			<button type="button" class="btn btn-outline-primary btn-sm">확인</button>
			<!-- <button type="submit" class="btn btn-outline-primary btn-sm">확인</button> -->

			<span id="join"></span>

		</form>
	</div>

</body>
</html>
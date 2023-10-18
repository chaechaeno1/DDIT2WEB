<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/basic.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/userlogin.css" />
</script>

<head>

<script >


/* id,pw찾기 버튼 모달 */
$(document).ready(function() {
    // ID 찾기 버튼 클릭 시 모달 창을 표시
    $('#idfind').click(function() {
        $('#idModal').modal('show');
    });
});


$(document).ready(function() {
    // pw 찾기 버튼 클릭 시 모달 창을 표시
    $('#passfind').click(function() {
        $('#passModal').modal('show');
    });
});

 //header,footer만 불러오면 오류남,,,챗지피티도 모른다고함,,,제발 살려주세요 
   
<%-- $(function () {
	

	$("#header").load("<%=request.getContextPath()%>/main/header.jsp");
	$("#footer").load("<%=request.getContextPath()%>/main/footer.jsp");


	}) --%>

</script>

</head>
<body>
<header id="header"></header>

 <div class="modal fade" id="idModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
               <!--모달헤더-->
                <div class="modal-header">
                    <h4 class="modal-title">아이디 찾기</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <form>
                        <!--모달 바디내용-->
                       
                        <input type="text" class="idbfind" name="bid" id="bid" placeholder="이름"><br>

                       
                        <input type="text" class="idbfind" name="mail" id="bmail" placeholder="이메일"><br>
                        
                        <!-- <button type="button" data-bs-target="#uidModal"></button> -->
                         <input type="button"  class="idfbutton" value="찾기" data-bs-toggle="modal" data-bs-target="#uidModal"> 
                       
                    <!--  <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#uidModal">찾기</button> -->
                        <input type="reset"  class="idfbutton" value="취소">
                        
                        

                    </form>
                </div>
                <!--모달풋터-->
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>
    <!-- id찾기 모달 끝 -->
    
    
    
    
    <!-- id찾기 누른후 아이디 알려주는 모달창  끝-->
    
    
    <!-- pass찾기 모달 시작 -->
      <div class="modal fade" id="passModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
               <!--모달헤더-->
                <div class="modal-header">
                    <h4 class="modal-title">비밀번호 찾기</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <form>
                        <!--모달 바디내용-->
                       
                        <input type="text" class="pwbfind" name="bid" id="bid" placeholder="아이디"><br>

                       
                        <input type="text" class="pwbfind" name="mail" id="bmail" placeholder="이메일"><br>
                        
                        <input type="button" class="pwfbutton" value="찾기">
                        <input type="reset" class="pwfbutton" value="취소">
                        
                        

                    </form>
                </div>
                <!--모달풋터-->
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>
    <!-- pass찾기 모달 끝 -->
    
    
    
      <!-- id찾기 누른후 아이디 알려주는 모달창  시작-->
      <div class="modal fade" id="uidModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
               <!--모달헤더-->
                <div class="modal-header">
                    <h4 class="modal-title">아이디 찾기</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <form>
                        <!--모달 바디내용-->
                       
                        <input type="text" class="txt" name="uid" id="uid" ><br>

                       
                       
                        
                        

                    </form>
                </div>
                <!--모달풋터-->
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>
  <!-- id찾기 누른후 아이디 알려주는 모달창  끝-->


    <main id="main-holder">
        <h1 id="login-header">Login</h1>



        <form id="login-form">
            <div id="div1">
                <input type="text" name="username" id="username-field" class="login-form-field" placeholder="아이디">

                <input type="password" name="password" id="password-field" class="login-form-field" placeholder="비밀번호">

            </div>

            <input type="submit" value="로그인" id="login-form-submit">



        </form>
        <div id="div2">
            <div id="div3">
                <input type="button" class="find" value="ID찾기" id="idfind">
                <input type="button" class="find" value="PW찾기" id="passfind">
            </div>
            <input type="button" value="회원가입" id="userjoin">
        </div>
    </main>


 <footer id="footer"></footer>
</body>
</html>
  
  
  
  
  
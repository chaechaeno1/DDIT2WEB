<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 :: 공지사항 게시판 관리</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/FAQ.css" />
<script src="../js/jquery-3.7.1.min.js"></script>	


<script>
$(document).ready(() => {
    // FAQ 패널 클릭에 대한 이벤트 리스너
    $(".panel-faq-container").click(function() {
    	
    	 if ($(event.target).is("#replyUpdate, #replyDelete")) {
             return;
         }
    	
        $(this).find(".panel-faq-answer").toggleClass('active');
    });
});
</script>
	

<!-- ** adminReview CSS ** -->
<style>
section #FAQ{ 
	width: 80%;
	height: 100%;
	margin: 60px auto;
	overflow: auto;
}

#FAQ h1{
	font-size: 35px;
	text-align: center;
	margin: 25px 0;
	color: #4d2222;
}

/* 추가된 CSS */
.pbtn{
	float: right;
}
.btn, #FAQInsert{
    padding: 7px 10px;
    background: #f1f0cb;
    border: none;
    border-radius: 10px;
    color: #4d2222;
}
#bcont{
	width: 100%;
	resize: none;
	padding: 15px;
}
label{
	display : inline-block;
	width : 50px;
}
.modal-body{
	padding: 30px;
}
#nform{
	border: 2.5px solid #e4a47c;
	border-radius: 15px;
	padding: 20px;
}
div#FAQInsBtn {
	margin: 0 auto;
	width: 851px;
	display: flex;
    justify-content: flex-end;
}
</style>
</head>
<body>


		
		
		<!-- 공지사항 게시물 -->
		<section id="FAQ">
			<h1>FAQ 관리</h1>
			
            <table>
              
              <thead> 
	                <tr>
	                    <th id="num">번호</th>
	                    <th id="subject">제목</th>
	                </tr>
              </thead>
              
              
              <!-- 게시물 시작 -->
              <tbody>
              
               <tr>
                  <td>5</td>
                  <td class="text-left">
                    <div class="panel-faq-container">
                      <p class="panel-faq-title">23년 동계장박캠퍼 모집합니다.</p>
                      <div class="panel-faq-answer">
                      <br>
                        <p>11월~24년3월까지 장박 캠퍼 모집합니다.</p>
                        <p>장박신청은 010-1234-5678로 문의해주세요.</p>
                        <p class="pbtn">
							<input type="button" value="수정" class="btn" id="replyUpdate"  data-bs-toggle="modal" data-bs-target="#updateFAQModal">
							<input type="button" value="삭제" class="btn" id="replyDelete">
                        </p>
                      </div>
                      
                    </div>
                  </td>

                </tr>              

               <tr>
                  <td>4</td>
                  <td class="text-left">
                    <div class="panel-faq-container">
                      <p class="panel-faq-title">23년 동계장박캠퍼 모집합니다.</p>
                      <div class="panel-faq-answer">
                      <br><br>
                        <p>11월~24년3월까지 장박 캠퍼 모집합니다.</p>
                        <p>장박신청은 010-1234-5678로 문의해주세요.</p>
                      </div>
                    </div>
                  </td>
                  

                </tr>
              
               <tr>
                  <td>3</td>
                  <td class="text-left">
                    <div class="panel-faq-container">
                      <p class="panel-faq-title">23년 동계장박캠퍼 모집합니다.</p>
                      <div class="panel-faq-answer">
                      <br><br>
                        <p>11월~24년3월까지 장박 캠퍼 모집합니다.</p>
                        <p>장박신청은 010-1234-5678로 문의해주세요.</p>
                      </div>
                    </div>
                  </td>
                  

                </tr>

                <tr>
                  <td>2</td>
                  <td class="text-left">
                    <div class="panel-faq-container">
                      <p class="panel-faq-title">23년 동계장박캠퍼 모집합니다.</p>
                      <div class="panel-faq-answer">
                      <br><br>
                        <p>11월~24년3월까지 장박 캠퍼 모집합니다.</p>
                        <p>장박신청은 010-1234-5678로 문의해주세요.</p>
                      </div>
                    </div>
                  </td>
                  

                </tr>
                
               <tr>
                  <td>1</td> <!-- 번호 -->
                  <td class="text-left">
                    <div class="panel-faq-container">
                      <p class="panel-faq-title">슬기로운 캠핑생활 캠핑장 오픈 안내</p> <!-- 제목 -->
                      <div class="panel-faq-answer">
                      <br><br>
                        <p>슬기로운 캠핑생활 캠핑장이 오픈하였습니다!!</p> <!-- 내용 -->
                      </div>
                    </div>
                    
                  </td>
                  
                </tr>
                

              </tbody>
            </table>
            
            <div id="FAQInsBtn">
				<input type="button" value="FAQ등록" id="FAQInsert" data-bs-toggle="modal" data-bs-target="#insertFAQModal"> 
			</div>
            
            
<!-- 글쓰기 모달 -->

<div class="modal" id="insertFAQModal">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">

      <div class="modal-header">
        <h2>FAQ 등록</h2>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <div class="modal-body">
       <form name="nform" id="nform">
        
         <label>제목</label>
         <input type="text"  class="txt" name="subject" id="bsubject"><br><br>
               
         <label>등록일</label>
         <input type="text"   class="txt" name="date" id="bdate" readonly><br><br>
         
         <label>내용</label><br><br>
         <textarea rows="10" class="txt" id="bcont"></textarea>
       </form>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <div class="col text-center">
			<input type="button" class="btn" value="작성 완료" />
		</div>
      </div>

    </div>
  </div>
</div>
<!-- 글쓰기 모달 끝 -->	

<!-- 수정 모달 -->
<div class="modal" id="updateFAQModal">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">

      <div class="modal-header">
        <h2>FAQ 수정</h2>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <div class="modal-body">
       <form name="nform" id="nform">
        
         <label>제목</label>
         <input type="text"  class="txt" name="subject" id="bsubject"><br><br>
               
         <label>등록일</label>
         <input type="text"   class="txt" name="date" id="bdate" readonly><br><br>
         
         <label>내용</label><br><br>
         <textarea rows="10" class="txt" id="bcont"></textarea>
       </form>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <div class="col text-center">
			<input type="button" class="btn" value="작성 완료" />
		</div>
      </div>

    </div>
  </div>
</div>
<!-- 수정 모달 끝 -->
		
       

	</section>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주 묻는 질문</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/FAQ.css" />
<script src="<%=request.getContextPath()%>/js/jquery-3.7.1.min.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/basic.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/infoPage.css" />

<script>
$(function(){
	$("#header").load("<%=request.getContextPath()%>/main/header.jsp");
	$("#footer").load("<%=request.getContextPath()%>/main/footer.jsp");
	})
	
window.onload = () => {
            // panel-faq-container
            const panelFaqContainer = document.querySelectorAll(".panel-faq-container"); // NodeList 객체
            
            // panel-faq-answer
            let panelFaqAnswer = document.querySelectorAll(".panel-faq-answer");

            // btn-all-close
            const btnAllClose = document.querySelector("#btn-all-close");
            
            // 반복문 순회하면서 해당 FAQ제목 클릭시 콜백 처리
            for( let i=0; i < panelFaqContainer.length; i++ ) {
                panelFaqContainer[i].addEventListener('click', function() { // 클릭시 처리할 일
                // FAQ 제목 클릭시 -> 본문이 보이게끔 -> active 클래스 추가
                panelFaqAnswer[i].classList.toggle('active');
                });
            };
            }
</script>


<style>

 html,body {
            background-color: #fdf4e1;
            }
            
#FAQ{
	min-height : 100%;
	position: relative;
}
            
            

</style>


</head>


<body>
	<header id="header"></header>
	<section id="FAQ">
        <div class="container">
            <h1 style="text-align: center; font-size:45px; padding-top: 50px;">
            자주 묻는 질문
            </h1><br>
            <br>
            <br>
            <table style="color: #9A4444;" class="table table-bordered table-striped table-hover table-warning">
            <thead class="table-success text-center">
                <tr>
                    <th>번호</th>
                    <th>질문제목</th>
                </tr>
            </thead>
            <tbody class="text-center">
                <tr>
                    <td>1</td>
                    <td class="text-left" width="90%">
                    <div class="panel-faq-container">
                        <p class="panel-faq-title">Q. 캠핑장 이름은 무엇입니까?</p>
                    <div class="panel-faq-answer">
                        <p>A. 아직 미정입니다.</p>
                        
                    </div>
                    </div>
                  </td>
                
                </tr>
                <tr>
                  <td>2</td>
                  <td class="text-left" width="90%">
                    <div class="panel-faq-container">
                        <p class="panel-faq-title">Q. 기준인원은 몇명입니까?</p>
                    <div class="panel-faq-answer">
                        <p>A. 최대 성인2명입니다.</p>
                        
                      </div>
                    </div>
                  </td>
                 </tr>

                <tr>
                  <td>3</td>
                  <td class="text-left" width="90%">
                    <div class="panel-faq-container">
                      <p class="panel-faq-title">Q. 매너타임은 몇시부터 입니까?</p>
                      <div class="panel-faq-answer">
                        <p>A. 밤 10시부터 아침 8시까지 매너타임입니다.</p>
                        
                      </div>
                    </div>
                  </td>
                </tr>

                <tr>
                  <td>4</td>
                  <td class="text-left" width="90%">
                    <div class="panel-faq-container">
                      <p class="panel-faq-title">Q. 캠핑장 1박 가격은 얼마입니까?</p>
                      <div class="panel-faq-answer">
                        <p>A. 글램핑은 1박에 12만원, 카라반은 6만원, 오토캠핑은 3만원입니다. </p>
                        
                      </div>
                    </div>
                  </td>
                </tr>


                <tr>
                  <td>5</td>
                  <td class="text-left" width="90%">
                    <div class="panel-faq-container">
                      <p class="panel-faq-title">Q. 캠핑장 주소는 어디입까?</p>
                      <div class="panel-faq-answer">
                        <p>A.대전광역시 중구 오류동 삼성아파트 옆입니다.</p>
                        
                      </div>
                    </div>
                  </td>
                </tr>
                
                
                 <tr>
                  <td>6</td>
                  <td class="text-left" width="90%">
                    <div class="panel-faq-container">
                      <p class="panel-faq-title">Q. 캠핑장 주소는 어디입까?</p>
                      <div class="panel-faq-answer">
                        <p>A.대전광역시 중구 오류동 삼성아파트 옆입니다.</p>
                        
                      </div>
                    </div>
                  </td>
                </tr>
                
                
                 <tr>
                  <td>7</td>
                  <td class="text-left" width="90%">
                    <div class="panel-faq-container">
                      <p class="panel-faq-title">Q. 캠핑장 주소는 어디입까?</p>
                      <div class="panel-faq-answer">
                        <p>A.대전광역시 중구 오류동 삼성아파트 옆입니다.</p>
                        
                      </div>
                    </div>
                  </td>
                </tr>
              
              
                <tr>
                  <td>8</td>
                  <td class="text-left" width="90%">
                    <div class="panel-faq-container">
                      <p class="panel-faq-title">Q. 캠핑장 주소는 어디입까?</p>
                      <div class="panel-faq-answer">
                        <p>A.대전광역시 중구 오류동 삼성아파트 옆입니다.</p>
                        
                      </div>
                    </div>
                  </td>
                </tr>
                
                
                 <tr>
                  <td>9</td>
                  <td class="text-left" width="90%">
                    <div class="panel-faq-container">
                      <p class="panel-faq-title">Q. 캠핑장 주소는 어디입까?</p>
                      <div class="panel-faq-answer">
                        <p>A.대전광역시 중구 오류동 삼성아파트 옆입니다.</p>
                        
                      </div>
                    </div>
                  </td>
                </tr>
                
                
                
                                <tr>
                  <td>10</td>
                  <td class="text-left" width="90%">
                    <div class="panel-faq-container">
                      <p class="panel-faq-title">Q. 캠핑장 주소는 어디입까?</p>
                      <div class="panel-faq-answer">
                        <p>A.대전광역시 중구 오류동 삼성아파트 옆입니다.</p>
                        
                      </div>
                    </div>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>

       <br>
       
       		<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
    <li class="page-item">
      <a class="page-link" href="#">이전</a>
    </li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item"><a class="page-link" href="#">4</a></li>
    <li class="page-item"><a class="page-link" href="#">5</a></li>
    <li class="page-item">
      <a class="page-link" href="#">다음</a>
    </li>
  </ul>
</nav>
       
<br><br>




	</section>
	<footer id="footer"></footer>
</body>
</html>
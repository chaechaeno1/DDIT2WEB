<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/NOTICE.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/basic.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/infoPage.css" />
<script src="<%=request.getContextPath()%>/js/jquery-3.7.1.min.js"></script>




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
</head>


<body>
	
	<!-- 헤더(고정) -->
	<header id="header"></header>
	
	
	
	
	<section id="NOTICE">




        <div class="container">
            <h1>공지사항</h1>

            <table style="color: #9A4444;" class="table table-bordered table-striped table-hover table-warning">
              
              <thead>
	                <tr>
	                    <th>번호</th>
	                    <th>제목</th>
	                    <th>등록일</th>
	                    <th>조회수</th>
	                </tr>
              </thead>
              
              
              <tbody class="text-center">
                <tr>
                  <td>1</td>
                  <td class="text-left" width="50%">
                    <div class="panel-faq-container">
                      <p class="panel-faq-title">다음주 태풍 상륙 예정임으로 휴장합니다.</p>
                      <div class="panel-faq-answer">
                        <p>일기예보 확인하시고 예약하시기 바랍니다.</p>
                    
                      </div>
                    </div>
                  </td>
                  
                  <td>2032.01.01</td>
                  <td>84</td>
                </tr>
                
                
                
                
                <tr>
                  <td>2</td>
                  <td class="text-left" width="50%">
                    <div class="panel-faq-container">
                      <p class="panel-faq-title">23년 동계장박캠퍼 모집합니다.</p>
                      <div class="panel-faq-answer">
                        <p>11월~24년3월까지 장박 캠퍼 모집합니다.</p>
                        <p>장박신청은 010-1234-5678로 문의해주세요.</p>
                      </div>
                    </div>
                  </td>
                  
                  <td>2032.02.02</td>
                  <td>114</td>
                </tr>
                
                
                
                
                <tr>
                  <td>3</td>
                  <td class="text-left" width="50%">
                    <div class="panel-faq-container">
                      <p class="panel-faq-title">캠핑장 내 분리수거 철저히 해주세요.</p>
                      <div class="panel-faq-answer">
                        <p>지구가 아파합니다</p>
                      </div>
                    </div>
                  </td>
                  
                  <td>2032.03.03</td>
                  <td>98</td>
                </tr>
                
                
                
                
                <tr>
                  <td>4</td>
                  <td class="text-left" width="50%">
                    <div class="panel-faq-container">
                      <p class="panel-faq-title">초대캠은 금지입니다.</p>
                      <div class="panel-faq-answer">
                        <p>적발시 즉각 퇴실조치입니다.</p>
                      </div>
                    </div>
                  </td>
                  
                  <td>2032.04.04</td>
                  <td>43</td>
                </tr>
                
                
                
                <tr>
                  <td>5</td>
                  <td class="text-left" width="50%">
                    <div class="panel-faq-container">
                      <p class="panel-faq-title">노키즈존 캠핑장입니다.</p>
                      <div class="panel-faq-answer">
                        <p>14세 미만은 집으로 가주세요.</p>
                      </div>
                    </div>
                  </td>
                  
                  <td>2032.05.05</td>
                  <td>90</td>
                </tr>
                
                
                
                     <tr>
                  <td>6</td>
                  <td class="text-left" width="50%">
                    <div class="panel-faq-container">
                      <p class="panel-faq-title">노키즈존 캠핑장입니다.</p>
                      <div class="panel-faq-answer">
                        <p>14세 미만은 집으로 가주세요.</p>
                      </div>
                    </div>
                  </td>
                  
                  <td>2032.05.05</td>
                  <td>90</td>
                </tr>
                
                
                
                     <tr>
                  <td>7</td>
                  <td class="text-left" width="50%">
                    <div class="panel-faq-container">
                      <p class="panel-faq-title">노키즈존 캠핑장입니다.</p>
                      <div class="panel-faq-answer">
                        <p>14세 미만은 집으로 가주세요.</p>
                      </div>
                    </div>
                  </td>
                  
                  <td>2032.05.05</td>
                  <td>90</td>
                </tr>
                
                
                
                
                
                     <tr>
                  <td>8</td>
                  <td class="text-left" width="50%">
                    <div class="panel-faq-container">
                      <p class="panel-faq-title">노키즈존 캠핑장입니다.</p>
                      <div class="panel-faq-answer">
                        <p>14세 미만은 집으로 가주세요.</p>
                      </div>
                    </div>
                  </td>
                  
                  <td>2032.05.05</td>
                  <td>90</td>
                </tr>
                
                
                     <tr>
                  <td>9</td>
                  <td class="text-left" width="50%">
                    <div class="panel-faq-container">
                      <p class="panel-faq-title">노키즈존 캠핑장입니다.</p>
                      <div class="panel-faq-answer">
                        <p>14세 미만은 집으로 가주세요.</p>
                      </div>
                    </div>
                  </td>
                  
                  <td>2032.05.05</td>
                  <td>90</td>
                </tr>
                
                
                
                
                     <tr>
                  <td>10</td>
                  <td class="text-left" width="50%">
                    <div class="panel-faq-container">
                      <p class="panel-faq-title">노키즈존 캠핑장입니다.</p>
                      <div class="panel-faq-answer">
                        <p>14세 미만은 집으로 가주세요.</p>
                      </div>
                    </div>
                  </td>
                  
                  <td>2032.05.05</td>
                  <td>90</td>
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
       
	<div id="search">
         <input type="text" size="40">&nbsp;&nbsp;
         <button type="button" class="btn text-light btn-sm">검색</button>
    </div>




	</section>
	
	
	<!-- 푸터(고정) -->
	<footer id="footer"></footer>
</body>
</html>
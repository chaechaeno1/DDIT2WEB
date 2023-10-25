<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주 묻는 질문</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/basic.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/FAQ.css" />	
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
	
	<!-- 헤더(고정)!! -->
	<header id="header"></header>
	
	
	
	
	<section id="NOTICE">
         
        	<div id="titleImg">
				<h1>FAQ</h1>
				<img src="../images/imageSlide04.jpg"alt="" />
			</div>	
        

            <table>
              
              <thead> 
	                <tr>
	                    <th id="num">번호</th>
	                    <th id="subject">자주 묻는 질문</th>
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
                      <br><br>
                        <p>11월~24년3월까지 장박 캠퍼 모집합니다.</p>
                        <p>장박신청은 010-1234-5678로 문의해주세요.</p>
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
       <br>
       

	</section>
	
	
	<!-- 푸터(고정) -->
	<footer id="footer"></footer>
</body>
</html>
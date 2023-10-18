<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/basic.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/NOTICE.css" />	
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
         
        	<div id="titleImg">
				<h1>공지사항</h1>
				<img src="../images/imageSlide04.jpg"alt="" />
			</div>	
        

            <table>
              
              <thead> 
	                <tr>
	                    <th id="num">번호</th>
	                    <th id="subject">제목</th>
	                    <th id="date">등록일</th>
	                    <th id="hit">조회수</th>
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
                  
                  <td>2032.02.02</td>
                  <td>114</td>
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
                  
                  <td>2032.02.02</td>
                  <td>114</td>
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
                  
                  <td>2032.02.02</td>
                  <td>114</td>
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
                  
                  <td>2032.02.02</td>
                  <td>114</td>
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
                  
                  <td>2032.01.01</td> <!-- 등록일 -->
                  <td>84</td> <!-- 조회수 -->
                </tr>
                

              </tbody>
            </table>
       <br>
       
       
       <!-- 하단 페이징 처리 -->
<nav>
  <ul class="pagination justify-content-center">
	    <li class="page-item">
	      <a id="prev" class="page-link" href="#">prev</a>
	    </li>
	    <li class="page-item"><a class="page-link" href="#">1</a></li>
	    <li class="page-item"><a class="page-link" href="#">2</a></li>
	    <li class="page-item"><a class="page-link" href="#">3</a></li>
	    <li class="page-item"><a class="page-link" href="#">4</a></li>
	    <li class="page-item"><a class="page-link" href="#">5</a></li>
	    <li class="page-item">
	      <a id="next" class="page-link " href="#">next</a>
	    </li>
  </ul>
</nav>
       
	<div id="search">
         <input type="text" size="40">&nbsp;&nbsp;
         <button type="button" class="btn btn-sm">검색</button>
    </div>




	</section>
	
	
	<!-- 푸터(고정) -->
	<footer id="footer"></footer>
</body>
</html>
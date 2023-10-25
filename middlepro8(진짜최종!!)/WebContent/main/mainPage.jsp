<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<link rel="icon" href="<%=request.getContextPath()%>/images/favicon.ico">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/basic.css" />
<style type="text/css">
#location * {
	color: #4d2222;
	text-align: center;
}
</style>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/mainPage.css" />
<script src="<%=request.getContextPath()%>/js/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<script>
$(function(){
	$("#header").load("<%=request.getContextPath()%>/main/header.jsp");
	$("#footer").load("<%=request.getContextPath()%>/main/footer.jsp");
	
    $(".slide_gallery").bxSlider({
        auto: true,
        stopAutoOnClick: true,
        pager: false,
        speed: 300,
        mode: "fade",
        controls: true,
      });

     $("#sideclose").on("click", function () {
       $(this).parent().css({ display: "none" });
     });
     
     $(".way").on("click", function () {
         $(this).next().toggleClass("on");
     });
})
</script>
<style type="text/css">
.bx-wrapper {
border: none;
}
</style>
</head>
<body>
	<header id="header"></header>
	
      <!-- 메인 이미지 슬라이더 -->
      <section id="imageSlide">
        <div id="gallery_wrap">
          <ul class="slide_gallery">
            <li>
              <div class="slideCont">
                <p>A new cultural relaxation space</p>
                <p>where you can feel freedom.</p>
                <h1>자유를 느끼는</h1>
                <h1>새로운 문화 휴식공간</h1>
              </div>
              <img src="../images/imageSlide01.jpg" alt="imageSlide01" />
            </li>
            <li>
              <div class="slideCont">
                <p>A new cultural relaxation space</p>
                <p>where you can feel freedom.</p>
                <h1>자유를 느끼는</h1>
                <h1>새로운 문화 휴식공간</h1>
              </div>
              <img src="../images/imageSlide02.jpg" alt="imageSlide02" />
            </li>
            <li>
              <div class="slideCont">
                <p>A new cultural relaxation space</p>
                <p>where you can feel freedom.</p>
                <h1>자유를 느끼는</h1>
                <h1>새로운 문화 휴식공간</h1>
              </div>
              <img src="../images/imageSlide03.jpg" alt="imageSlide03" />
            </li>
            <li>
              <div class="slideCont">
                <p>A new cultural relaxation space</p>
                <p>where you can feel freedom.</p>
                <h1>자유를 느끼는</h1>
                <h1>새로운 문화 휴식공간</h1>
              </div>
              <img src="../images/imageSlide04.jpg" alt="imageSlide04" />
            </li>
            <li>
              <div class="slideCont">
                <p>A new cultural relaxation space</p>
                <p>where you can feel freedom.</p>
                <h1>자유를 느끼는</h1>
                <h1>새로운 문화 휴식공간</h1>
              </div>
              <img src="../images/imageSlide05.jpg" alt="imageSlide05" />
            </li>
          </ul>
        </div>
      </section>
      
      <section id="location">
        <div id="map">
          <h1>캠핑장 오시는길</h1>
          <div id="mnflex">
            <div id="iframeBox">
              <iframe
                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3214.4756791098603!2d127.40630887631937!3d36.325019694340405!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x35654ed2a5624215%3A0xd5804494a6b5b505!2z64yA642V7J247J6s6rCc67Cc7JuQ!5e0!3m2!1sko!2skr!4v1698106137034!5m2!1sko!2skr"
                width="600"
                height="450"
                style="border: 0"
                allowfullscreen=""
                loading="lazy"
                referrerpolicy="no-referrer-when-downgrade"
              ></iframe>
            </div>
            <div id="iframeRight">
              <p>주소 :</p>
              <p>대전광역시 중구 계룡로 846</p>
              <br />
              <p>찾아오시는길</p>
              <ul id="waybox">
                <li>
                  <a class="way">버스이용</a>
                  <ul class="wul">
                    <li>
                      서대전네거리역4번출구 정류장
                      <p>: 101, 103, 315, 618, 614</p>
                    </li>
                    <li>
           IBK기업은행 서대전 정류장
                      <p>: 119, 201, 202, 311, 314, 513,<br> 608, 612, 613, 618, 2002, 1</p>
                    </li>
                    <li>
                      용두동주민센터 정류장
                      <p>: 603</p>
                    </li>
                  </ul>
                </li>
                <li>
                  <a class="way">지하철이용</a>
                  <ul class="wul">
                    <li>
                      <p>: 서대전네거리역 4번출구</p>
                      <p>하차 후 도보 10분</p>
                    </li>
                    <li>
                      <p>: 오룡역 1번출구</p>
                      <p>하차 후 도보 10분</p>
                    </li>
                  </ul>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </section>
    
	<!-- 고정배너 -->
      <div id="sidebanner">
        <a id="sideclose">
          <span class="material-symbols-outlined">close</span>
        </a>
        <div id="sideCont">
          <h3><a href="../reservation/reservationMain.jsp" class="cc">실시간 예약</a></h3>
          <p><span>문의시간: </span><span>9:00~17:40</span></p>
          <p><span>점심시간: </span><span>12:50~13:50</span></p>
          <p><span>대표번호: </span><span>042-222-8202</span></p>
        </div>
        <div></div>
      </div>
	
	<footer id="footer"></footer>
</body>
</html>
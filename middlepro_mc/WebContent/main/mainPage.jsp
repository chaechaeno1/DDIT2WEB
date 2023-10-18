<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
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
                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3213.6628148030627!2d127.2938575761591!3d36.344721072380565!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ab33559821aed%3A0xbd8c48a0b07e99c0!2z64yA7KCE6rSR7Jet7IucIOycoOyEseq1rCDqs4TsgrDrj5kgMjQy!5e0!3m2!1sko!2skr!4v1697364350256!5m2!1sko!2skr"
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
              <p>대전광역시 유성구 계산동 242</p>
              <br />
              <p>찾아오시는길</p>
              <ul id="waybox">
                <li>
                  <a class="way">버스이용</a>
                  <ul class="wul">
                    <li>
                      조아시장 앞 입구 정류장
                      <p>: 101, 102</p>
                    </li>
                    <li>
                      대덕구청 입구 정류장
                      <p>: 103, 142, 152, 272</p>
                    </li>
                    <li>
                      후문(병아리초등학교 앞)
                      <p>: 240, 2012, 2013</p>
                    </li>
                  </ul>
                </li>
                <li>
                  <a class="way">지하철이용</a>
                  <ul class="wul">
                    <li>
                      <p>: 4호선 캠핑역 1번출구</p>
                      <p>하차 후 도보 10분</p>
                    </li>
                    <li>
                      <p>: 6호선 아웃도어역 4번출구</p>
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
          <h3><a href="#" class="cc">실시간 예약</a></h3>
          <p><span>문의시간: </span><span>9:00~19:00</span></p>
          <p><span>점심시간: </span><span>12:00~13:30</span></p>
          <p><span>대표번호: </span><span>042-123-4567</span></p>
        </div>
        <div></div>
      </div>
	
	<footer id="footer"></footer>
</body>
</html>
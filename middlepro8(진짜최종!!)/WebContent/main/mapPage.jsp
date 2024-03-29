<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오시는 길</title>
<link rel="icon" href="<%=request.getContextPath()%>/images/favicon.ico">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/basic.css" />
<style type="text/css">
#map * {
	color: #4d2222;
	text-align: center;
}
</style>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/mapPage.css" />
<script src="<%=request.getContextPath()%>/js/jquery-3.7.1.min.js"></script>
<script>
$(function(){
	$("#header").load("<%=request.getContextPath()%>/main/header.jsp");
	$("#footer").load("<%=request.getContextPath()%>/main/footer.jsp");

    $(".way").on("click", function () {
        $(this).next().toggleClass("on");
    });
})
</script>
</head>
<body>
<section>
<header id="header"></header>
        <!-- 메뉴타이틀 & 배경 -->
        <div id="mapback">
          <h1>오시는 길</h1>
          <img src="<%=request.getContextPath()%>/images/imageSlide01.jpg" alt="" />
        </div>
        <!-- 지도 -->
        <div id="map">
          <h1>캠핑장 오시는길</h1>
          <div id="mnflex">
            <div id="iframeBox">
              <iframe
                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3214.4756791098603!2d127.40630887631937!3d36.325019694340405!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x35654ed2a5624215%3A0xd5804494a6b5b505!2z64yA642V7J247J6s6rCc67Cc7JuQ!5e0!3m2!1sko!2skr!4v1698106137034!5m2!1sko!2skr" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"
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
                      <p>: 119, 201, 202, 311, 314, 513,<br> 608, 612, 613, 2002, 1</p>
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
      <footer id="footer"></footer>
</body>
</html>
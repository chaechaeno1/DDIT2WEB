<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 페이지</title>

<script src="../js/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/basic.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/reservationMain.css">
  <!-- 헤더와 푸터를 위한 JSP 태그 포함 -->
    <script type="text/javascript">
    
    $(document).ready(function() {
    	
    	/* 오류주의!! 잘못 설정하면 footer가 section보다 위로 올라감 */
    	$("#header").load("<%=request.getContextPath()%>/main/header.jsp");
    	$("#footer").load("<%=request.getContextPath()%>/main/footer.jsp");
    	
      // 기본 선택된 버튼과 배경색 설정
      $("#resG").css("background-color", "#89C427");

      // 예약 버튼이 클릭될 때의 핸들러
      $(".resbtn").click(function() {
        $(".resbtn").css("background-color", "");  // 모든 버튼의 배경색 초기화
        $(this).css("background-color", "#89C427");  // 클릭된 버튼에 배경색 설정
      });

      /* 글램핑 예약하기 클릭 시 버튼 배경색 유지*/
      $("#resG").click(function() {
        $(".resbtn").css("background-color", "");  // 모든 버튼의 배경색 초기화
        $("#resG").css("background-color", "#89C427");  // 선택된 버튼에 배경색 설정
      });

      /* 오토캠핑 예약하기 클릭 시 버튼 배경색 유지*/
      $("#resA").click(function() {
        $(".resbtn").css("background-color", "");  // 모든 버튼의 배경색 초기화
        $("#resA").css("background-color", "#89C427");  // 선택된 버튼에 배경색 설정
      });

      /* 카라반 예약하기 클릭 시 버튼 배경색 유지*/
      $("#resC").click(function() {
        $(".resbtn").css("background-color", "");  // 모든 버튼의 배경색 초기화
        $("#resC").css("background-color", "#89C427");  // 선택된 버튼에 배경색 설정
      });
    });
  </script>
</head>
<body>
  <header id="header"></header>

  <section>
    <div id="subject">
      <h2>캠핑장 예약하기</h2>	
    </div>

    <nav>
      <div id="resbutton">
        <a href="reservationCalendar.jsp" class="resbtn" id="resG" target="if_rescal">글램핑 예약하기</a>
        <a href="reservationCalendar.jsp" class="resbtn" id="resA" target="if_rescal">오토캠핑 예약하기</a>
        <a href="reservationCalendar.jsp" class="resbtn" id="resC" target="if_rescal">카라반 예약하기</a>
      </div>
    </nav>

    <iframe src="reservationCalendar.jsp" name="if_rescal" title="캘린더 api예정" ></iframe>

  </section>

  <footer id="footer"></footer>

</body>
</html>
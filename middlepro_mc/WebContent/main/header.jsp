<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
<script src="<%=request.getContextPath()%>/js/jquery-3.7.1.min.js"></script>
<script>
$(function(){
    $(".menuitem").hover(
        function () {
          // 마우스를 올렸을 때
          $(".submenu").css({ visibility: "visible", height: "160px" });
          $(".subbck").css({ visibility: "visible", height: "160px" });
        },
        function () {
          // 마우스를 벗어났을 때
          $(".submenu").css({ visibility: "hidden", height: "0" });
          $(".subbck").css({ visibility: "hidden", height: "0" });
        }
     );
 	

})
</script>
<style>
/* 헤더 */
header {
  width: 100%;
  height: auto;
  display: flex;
  justify-content: space-between;
  background: #d6d46d;
  padding: 0 30px;
}
header  * {
	color: #4d2222;
	text-align: center;
}
#mnflex {
  display: flex;
}
#logo {
  margin: 10px;
  height: 50px;
}
#menu {
  margin-left: 30px;
  display: flex;
}
#menu li {
  cursor: pointer;
  line-height: 30px;
}
.subbck {
  visibility: hidden;
  height: 0;
  position: fixed;
  top: 70px;
  left: 0;
  transition: all 0.7s;
  width: 100%;
  background: #d6d46dda;
  z-index: 9;
}
.submenu {
  visibility: hidden;
  height: 0;
  position: absolute;
  top: 70px;
  left: 0;
  transition: all 0.7s;
  overflow: hidden;
  width: 100%;
  z-index: 10;
}
.menuitem {
  position: relative;
  width: 150px;
  padding: 20px;
  overflow: visible;
}
.subitem {
  box-sizing: border-box;
  width: 150px;
  padding: 10px;
}
#log {
  height: 50px;
  margin: 10px;
  padding: 10px;
  box-sizing: border-box;
  line-height: 30px;
}
</style>
</head>
<body>
      <!-- 헤더 -->
      <header>
        <div id="mnflex">
          <div id="logo">
            <a href="<%=request.getContextPath()%>/main/mainPage.jsp"
              ><img src="<%=request.getContextPath()%>/images/perm_logo.png" alt="perm_logo"
            /></a>
          </div>
          <ul id="menu">
            <li class="menuitem">
              <a>시설안내</a>
              <div class="subbck"></div>
              <ul class="submenu">
                <li class="subitem">
                  <a href="<%=request.getContextPath()%>/main/infoPage.jsp" class="cc">캠핑장 소개</a>
                </li>
                <li class="subitem">
                  <a href="<%=request.getContextPath()%>/main/mapPage.jsp" class="cc">오시는 길</a>
                </li>
              </ul>
            </li>
            <li class="menuitem">
              <a>고객센터</a>
              <ul class="submenu">
                <li class="subitem"><a href="<%=request.getContextPath()%>/board/FAQ.jsp" class="cc">FAQ</a></li>
                <li class="subitem"><a href="<%=request.getContextPath()%>/board/NOTICE.jsp" class="cc">공지사항</a></li>
                <li class="subitem"><a href="<%=request.getContextPath()%>/board/review.jsp" class="cc">이용후기</a></li>
              </ul>
            </li>
            <li class="menuitem"><a href="<%=request.getContextPath()%>/reservation/reservationMain.jsp" class="cc">예약하기</a></li>
          </ul>
        </div>
        <div id="log">
<%
		// 로그인 체크 - 서블릿에서 저장한 session값을 얻어온다
		MemberVO vo = (MemberVO)session.getAttribute("loginMember");
	
		if(vo==null) {	// 로그인 상태가 아닐 때
%>
				
          <a href="<%=request.getContextPath()%>/login/userlogin.jsp" id="logstatus">
            <span class="cc">로그인</span>
            <!--로그인/로그아웃-->
          </a>
          <span class="bar"> | </span>
          <a href="<%=request.getContextPath()%>/member/join.jsp" id="logpage">
            <span class="cc">회원가입</span>
            <!--회원가입/마이페이지-->
          </a>
	
	<%	} else { // 로그인 상태일 때 %>	
			<a href="<%=request.getContextPath()%>/memberLogout.do" id="logstatus">
            <span class="cc">로그아웃</span>
            <!--로그인/로그아웃-->
          </a>
          <span class="bar"> | </span>
          <a href="<%=request.getContextPath()%>/member/mypage.jsp" id="logpage">
            <span class="cc">마이페이지</span>
            <!--회원가입/마이페이지-->
          </a>
		
	<%
		}
	%>
		
        </div>
      </header>
</body>
</html>
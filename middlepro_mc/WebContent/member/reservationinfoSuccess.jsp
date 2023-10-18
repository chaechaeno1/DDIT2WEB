<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약조회</title>
<script src="../js/jquery-3.7.1.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="../css/basic.css">
<link rel="stylesheet" href="../css/mypage_iframe.css">

<!-- 스타일 부분 -->
<style>

#ressus{
	height: 500px;
	/* display: flex; */
    justify-content: center;
    padding : 200px;
    font-size : 2.0rem;
}
#ressus span, b{
	color: red;
}
#ressus p{
	font-size: 1.1rem;
}

</style>


<!-- 내부 스크립트 부분  -->
<script>

</script>


</head>
<body>
<div class="infoIframeDiv">
  
 		 <div id="ressus">
				<h2>홍길동님, <br>
				예약이 <span>취소</span>되었습니다.</h2>
				<br><br>
				<h5>예약 취소 내역은 <b>‘마이페이지-취소 내역 조회’</b>에서<br>
				확인하실 수 있습니다.
				</h5>
			</div>

</div>



</body>
</html>
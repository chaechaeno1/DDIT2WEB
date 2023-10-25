<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인페이지</title>

<!-- 모달사용 -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  
<script src="<%=request.getContextPath()%>/js/jquery-3.7.1.min.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/basic.css" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
	


<script>
	$(function() {
		/* 검색 input 이벤트 */
		$('#searchbtn').on('click', function() {
			$(this).prev().toggleClass("on");
		})
		/* 메뉴 마우스후버 이벤트 */
		$('.submenu>li').on('mouseover', function() {
		    $(this).find('span').addClass("bck");
		});
		$('.submenu>li').on('mouseout', function() {
		    $(this).find('span').removeClass("bck");
		});
	})
	


	

</script>


<style type="text/css">
html {
	height: 100%;
}
body {
	height: 100%;
	box-sizing: border-box;
}

/* 관리자 예약 현황 조회 부분 css 시작 */

label{
	display : inline-block;
	width : 100px;
	height : 30px;
}
.modal-footer{
	display: flex;
    justify-content: center;
}
.modal-body{
	display: flex;
    justify-content: center;
}
#calendar{
	border: 1px solid gray;
	width: 65%;
	margin: 0 auto;
}
.cols{
	width: 14%;
}

.btn_pop{
	border: 1px solid gray;
}
.left{
	font-size : 10pt;
}
.possibleBtn{
	color: rgb(143, 195, 31); 
	font-weight: 300;
}
.sun{
	color : red;
}
.sat{
	color : blue;
}
.cal{
	padding-top: 10px;
}
.cal_l{
	margin-top: 10px;
}
#prevnextbtn{
	width : 15px;
	height : 20px;
}
.prev, .month, .next {
  display: inline-block;
}
.month{
	margin-left: 20px;
	margin-right: 20px;
}
.tflex {
	margin: 3%;
	display: flex;
	justify-content: center;
	flex-wrap: wrap;
	align-content: right;
}
#resList{
	border: 0;
}
.gbtn{
	font-size: 60%;
	margin: 3px;
}
#res1, #res2{
	border : 1px dotted;
	height : 300px;
	width : 80%;
	float : left;
	padding: 20px;
}
.resColor{
	text-align: right;
	margin-right: 15%;
}
.resColor img{
	width: 10px;
	height: 10px;
}
.btn_pop p{
	margin: 5% 5%;
}
.cal_yearmon{
	font-size: 1.2rem;
	display: flex;
  	align-items: baseline;
  	justify-content: center;
  	margin-left: 5px;
}
.resColor{
	text-align: right;
	margin-right: 18%;
}
.resColor img{
	width: 10px;
	height: 10px;
}




</style>
</head>
<body>
		
		
		<!-- 상단 : 연월 표시 부분 -->
		<div class="cal_yearmon">
				2023 October&nbsp;&nbsp;&nbsp;&nbsp;

				<p class="prev">
					<a href="/reservation/reserform/area_2d?pageview=1&amp;year=2023&amp;month=9"> <!-- 9월 캘린더로 이동  -->
					<img id="prevnextbtn" src="../images/btn_prev.png" alt="이전"></a>
				</p>
			<div class="month">
				<h3>
					<span>10</span>
				</h3>
			</div>
				<p class="next">
					<a href="/reservation/reserform/area_2d?pageview=1&amp;year=2023&amp;month=11"> <!-- 11월 캘린더로 이동  -->
						<img id="prevnextbtn" src="../images/btn_next.png" alt="다음"></a>
				</p>

			</div>
			
			<!-- 예약가능 예약불가 버튼 색깔 안내 -->
			<p class="resColor" style="user-select: auto;">
				<img src="../images/예약가능.PNG" alt="예약가능"> 
				<span class="blue" style="user-select: auto;">예약가능</span> &nbsp;
				<img src="../images/예약불가.PNG" alt="예약완료"> 
				<span class="red" style="user-select: auto;">예약완료</span>
			</p>
			
			
			<!-- 하단 : 일자 부분 -->
			<div class="cal_l">
				<table id="calendar" class="schedule">
					<colgroup>
							<col class="cols">						
							<col class="cols">						
							<col class="cols">						
							<col class="cols">						
							<col class="cols">						
							<col class="cols">						
							<col class="cols">											
					</colgroup>
					<thead>
						<tr>
							<th class="sun">SUN</th>
							<th >MON</th>
							<th >TUE</th>
							<th >WED</th>
							<th >THU</th>
							<th >FRI</th>
							<th class="sat">SAT</th>
						</tr>
					</thead>
					<tr class="tr_view">
							<td class="btn_pop sun" id="2023-10-01">
								<p>1</p>
									<div class="layerDiv">
											<table id="resList">
												<tr class="tflex">
													<td class="possibleBtn"> 
														<button type="button" id="g001" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-001)</button> 
														<input type="hidden" name="roomIdx" value="G001">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g002" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-002)</button> 
														<input type="hidden" name="roomIdx" value="G002">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g003" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-003)</button> 
														<input type="hidden" name="roomIdx" value="G003">
														<input type="hidden" name="roomAble" value="1">
													<td class="possibleBtn"> 
														<button type="button" id="g004" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-004)</button> 
														<input type="hidden" name="roomIdx" value="G004">
														<input type="hidden" name="roomAble" value="1">									
												</tr>
											</table>
									</div>														
							</td>
							<td class="btn_pop sun" id="2023-10-02">
								<p>2</p>
									<div class="layerDiv">
											<table id="resList">
												<tr class="tflex">
													<td class="possibleBtn"> 
														<button type="button" id="g001" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-001)</button> 
														<input type="hidden" name="roomIdx" value="G001">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g002" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-002)</button> 
														<input type="hidden" name="roomIdx" value="G002">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g003" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-003)</button> 
														<input type="hidden" name="roomIdx" value="G003">
														<input type="hidden" name="roomAble" value="1">
													<td class="possibleBtn"> 
														<button type="button" id="g004" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-004)</button> 
														<input type="hidden" name="roomIdx" value="G004">
														<input type="hidden" name="roomAble" value="1">									
												</tr>
											</table>
									</div>								
							</td>
							<td class="btn_pop sun" id="2023-10-03">
								<p>3</p>
									<div class="layerDiv">
											<table id="resList">
												<tr class="tflex">
													<td class="possibleBtn"> 
														<button type="button" id="g001" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-001)</button> 
														<input type="hidden" name="roomIdx" value="G001">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g002" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-002)</button> 
														<input type="hidden" name="roomIdx" value="G002">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g003" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-003)</button> 
														<input type="hidden" name="roomIdx" value="G003">
														<input type="hidden" name="roomAble" value="1">
													<td class="possibleBtn"> 
														<button type="button" id="g004" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-004)</button> 
														<input type="hidden" name="roomIdx" value="G004">
														<input type="hidden" name="roomAble" value="1">									
												</tr>
											</table>
									</div>														
							</td>
							<td class="btn_pop" id="2023-10-04">
								<p>4</p>
									<div class="layerDiv">
											<table id="resList">
												<tr class="tflex">
													<td class="possibleBtn"> 
														<button type="button" id="g001" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-001)</button> 
														<input type="hidden" name="roomIdx" value="G001">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g002" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-002)</button> 
														<input type="hidden" name="roomIdx" value="G002">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g003" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-003)</button> 
														<input type="hidden" name="roomIdx" value="G003">
														<input type="hidden" name="roomAble" value="1">
													<td class="possibleBtn"> 
														<button type="button" id="g004" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-004)</button> 
														<input type="hidden" name="roomIdx" value="G004">
														<input type="hidden" name="roomAble" value="1">									
												</tr>
											</table>
									</div>														
							</td>
							<td class="btn_pop" id="2023-10-05">
								<p>5</p>
									<div class="layerDiv">
											<table id="resList">
												<tr class="tflex">
													<td class="possibleBtn"> 
														<button type="button" id="g001" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-001)</button> 
														<input type="hidden" name="roomIdx" value="G001">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g002" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-002)</button> 
														<input type="hidden" name="roomIdx" value="G002">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g003" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-003)</button> 
														<input type="hidden" name="roomIdx" value="G003">
														<input type="hidden" name="roomAble" value="1">
													<td class="possibleBtn"> 
														<button type="button" id="g004" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-004)</button> 
														<input type="hidden" name="roomIdx" value="G004">
														<input type="hidden" name="roomAble" value="1">									
												</tr>
											</table>
									</div>														
							</td>
							<td class="btn_pop" id="2023-10-06">
								<p>6</p>
									<div class="layerDiv">
											<table id="resList">
												<tr class="tflex">
													<td class="possibleBtn"> 
														<button type="button" id="g001" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-001)</button> 
														<input type="hidden" name="roomIdx" value="G001">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g002" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-002)</button> 
														<input type="hidden" name="roomIdx" value="G002">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g003" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-003)</button> 
														<input type="hidden" name="roomIdx" value="G003">
														<input type="hidden" name="roomAble" value="1">
													<td class="possibleBtn"> 
														<button type="button" id="g004" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-004)</button> 
														<input type="hidden" name="roomIdx" value="G004">
														<input type="hidden" name="roomAble" value="1">									
												</tr>
											</table>
									</div>														
							</td>
							<td class="btn_pop sat" id="2023-10-07">
								<p>7</p>
									<div class="layerDiv">
											<table id="resList">
												<tr class="tflex">
													<td class="possibleBtn"> 
														<button type="button" id="g001" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-001)</button> 
														<input type="hidden" name="roomIdx" value="G001">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g002" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-002)</button> 
														<input type="hidden" name="roomIdx" value="G002">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g003" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-003)</button> 
														<input type="hidden" name="roomIdx" value="G003">
														<input type="hidden" name="roomAble" value="1">
													<td class="possibleBtn"> 
														<button type="button" id="g004" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-004)</button> 
														<input type="hidden" name="roomIdx" value="G004">
														<input type="hidden" name="roomAble" value="1">									
												</tr>
											</table>
									</div>														
							</td>	
						</tr>
						<tr class="tr_view">
							<td class="btn_pop sun" id="2023-10-08">
								<p>8</p>
							<div class="layerDiv">
											<table id="resList">
												<tr class="tflex">
													<td class="possibleBtn"> 
														<button type="button" id="g001" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-001)</button> 
														<input type="hidden" name="roomIdx" value="G001">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g002" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-002)</button> 
														<input type="hidden" name="roomIdx" value="G002">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g003" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-003)</button> 
														<input type="hidden" name="roomIdx" value="G003">
														<input type="hidden" name="roomAble" value="1">
													<td class="possibleBtn"> 
														<button type="button" id="g004" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-004)</button> 
														<input type="hidden" name="roomIdx" value="G004">
														<input type="hidden" name="roomAble" value="1">									
												</tr>
											</table>
									</div>													
							</td>
							<td class="btn_pop sun" id="2023-10-09">
								<p>9</p>
									<div class="layerDiv">
											<table id="resList">
												<tr class="tflex">
													<td class="possibleBtn"> 
														<button type="button" id="g001" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-001)</button> 
														<input type="hidden" name="roomIdx" value="G001">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g002" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-002)</button> 
														<input type="hidden" name="roomIdx" value="G002">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g003" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-003)</button> 
														<input type="hidden" name="roomIdx" value="G003">
														<input type="hidden" name="roomAble" value="1">
													<td class="possibleBtn"> 
														<button type="button" id="g004" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-004)</button> 
														<input type="hidden" name="roomIdx" value="G004">
														<input type="hidden" name="roomAble" value="1">									
												</tr>
											</table>
									</div>								
							</td>
							<td class="btn_pop" id="2023-10-10">
								<p>10</p>
									<div class="layerDiv">
											<table id="resList">
												<tr class="tflex">
													<td class="possibleBtn"> 
														<button type="button" id="g001" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-001)</button> 
														<input type="hidden" name="roomIdx" value="G001">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g002" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-002)</button> 
														<input type="hidden" name="roomIdx" value="G002">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g003" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-003)</button> 
														<input type="hidden" name="roomIdx" value="G003">
														<input type="hidden" name="roomAble" value="1">
													<td class="possibleBtn"> 
														<button type="button" id="g004" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-004)</button> 
														<input type="hidden" name="roomIdx" value="G004">
														<input type="hidden" name="roomAble" value="1">									
												</tr>
											</table>
									</div>													
							</td>
							<td class="btn_pop" id="2023-10-11">
								<p>11</p>
									<div class="layerDiv">
											<table id="resList">
												<tr class="tflex">
													<td class="possibleBtn"> 
														<button type="button" id="g001" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-001)</button> 
														<input type="hidden" name="roomIdx" value="G001">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g002" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-002)</button> 
														<input type="hidden" name="roomIdx" value="G002">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g003" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-003)</button> 
														<input type="hidden" name="roomIdx" value="G003">
														<input type="hidden" name="roomAble" value="1">
													<td class="possibleBtn"> 
														<button type="button" id="g004" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-004)</button> 
														<input type="hidden" name="roomIdx" value="G004">
														<input type="hidden" name="roomAble" value="1">									
												</tr>
											</table>
									</div>														
							</td>
							<td class="btn_pop" id="2023-10-12">
								<p>12</p>
									<div class="layerDiv">
											<table id="resList">
												<tr class="tflex">
													<td class="possibleBtn"> 
														<button type="button" id="g001" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-001)</button> 
														<input type="hidden" name="roomIdx" value="G001">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g002" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-002)</button> 
														<input type="hidden" name="roomIdx" value="G002">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g003" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-003)</button> 
														<input type="hidden" name="roomIdx" value="G003">
														<input type="hidden" name="roomAble" value="1">
													<td class="possibleBtn"> 
														<button type="button" id="g004" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-004)</button> 
														<input type="hidden" name="roomIdx" value="G004">
														<input type="hidden" name="roomAble" value="1">									
												</tr>
											</table>
									</div>														
							</td>
							<td class="btn_pop" id="2023-10-13">
								<p>13</p>
									<div class="layerDiv">
											<table id="resList">
												<tr class="tflex">
													<td class="possibleBtn"> 
														<button type="button" id="g001" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-001)</button> 
														<input type="hidden" name="roomIdx" value="G001">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g002" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-002)</button> 
														<input type="hidden" name="roomIdx" value="G002">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g003" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-003)</button> 
														<input type="hidden" name="roomIdx" value="G003">
														<input type="hidden" name="roomAble" value="1">
													<td class="possibleBtn"> 
														<button type="button" id="g004" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-004)</button> 
														<input type="hidden" name="roomIdx" value="G004">
														<input type="hidden" name="roomAble" value="1">									
												</tr>
											</table>
									</div>														
							</td>
							<td class="btn_pop sat" id="2023-10-14">
								<p>14</p>
									<div class="layerDiv">
											<table id="resList">
												<tr class="tflex">
													<td class="possibleBtn"> 
														<button type="button" id="g001" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-001)</button> 
														<input type="hidden" name="roomIdx" value="G001">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g002" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-002)</button> 
														<input type="hidden" name="roomIdx" value="G002">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g003" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-003)</button> 
														<input type="hidden" name="roomIdx" value="G003">
														<input type="hidden" name="roomAble" value="1">
													<td class="possibleBtn"> 
														<button type="button" id="g004" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-004)</button> 
														<input type="hidden" name="roomIdx" value="G004">
														<input type="hidden" name="roomAble" value="1">									
												</tr>
											</table>
									</div>														
							</td>	
						</tr>
						<tr class="tr_view">
							<td class="btn_pop sun" id="2023-10-15">
								<p>15</p>
									<div class="layerDiv">
											<table id="resList">
												<tr class="tflex">
													<td class="possibleBtn"> 
														<button type="button" id="g001" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-001)</button> 
														<input type="hidden" name="roomIdx" value="G001">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g002" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-002)</button> 
														<input type="hidden" name="roomIdx" value="G002">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g003" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-003)</button> 
														<input type="hidden" name="roomIdx" value="G003">
														<input type="hidden" name="roomAble" value="1">
													<td class="possibleBtn"> 
														<button type="button" id="g004" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-004)</button> 
														<input type="hidden" name="roomIdx" value="G004">
														<input type="hidden" name="roomAble" value="1">									
												</tr>
											</table>
									</div>														
							</td>
							<td class="mon btn_pop" id="2023-10-16">
								<p>16</p>
									<div class="layerDiv">
											<table id="resList">
												<tr class="tflex">
													<td class="possibleBtn"> 
														<button type="button" id="g001" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-001)</button> 
														<input type="hidden" name="roomIdx" value="G001">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g002" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-002)</button> 
														<input type="hidden" name="roomIdx" value="G002">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g003" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-003)</button> 
														<input type="hidden" name="roomIdx" value="G003">
														<input type="hidden" name="roomAble" value="1">
													<td class="possibleBtn"> 
														<button type="button" id="g004" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-004)</button> 
														<input type="hidden" name="roomIdx" value="G004">
														<input type="hidden" name="roomAble" value="1">									
												</tr>
											</table>
									</div>
							</td>
								
							<td class="mon btn_pop" id="2023-10-17">
								<p>17</p>
									<div class="layerDiv">
											<table id="resList">
												<tr class="tflex">
													<td class="possibleBtn"> 
														<button type="button" id="g001" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-001)</button> 
														<input type="hidden" name="roomIdx" value="G001">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g002" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-002)</button> 
														<input type="hidden" name="roomIdx" value="G002">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g003" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-003)</button> 
														<input type="hidden" name="roomIdx" value="G003">
														<input type="hidden" name="roomAble" value="1">
													<td class="possibleBtn"> 
														<button type="button" id="g004" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-004)</button> 
														<input type="hidden" name="roomIdx" value="G004">
														<input type="hidden" name="roomAble" value="1">									
												</tr>
											</table>
									</div>
								
							</td>
							<td class="mon btn_pop" id="2023-10-18">
								<p>18</p>
									<div class="layerDiv">
											<table id="resList">
												<tr class="tflex">
													<td class="possibleBtn"> 
														<button type="button" id="g001" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-001)</button> 
														<input type="hidden" name="roomIdx" value="G001">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g002" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-002)</button> 
														<input type="hidden" name="roomIdx" value="G002">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g003" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-003)</button> 
														<input type="hidden" name="roomIdx" value="G003">
														<input type="hidden" name="roomAble" value="1">
													<td class="possibleBtn"> 
														<button type="button" id="g004" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-004)</button> 
														<input type="hidden" name="roomIdx" value="G004">
														<input type="hidden" name="roomAble" value="1">									
												</tr>
											</table>
									</div>								
								
							</td>
							<td class="mon btn_pop" id="2023-10-19">
								<p>19</p>
									<div class="layerDiv">
											<table id="resList">
												<tr class="tflex">
													<td class="possibleBtn"> 
														<button type="button" id="g001" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-001)</button> 
														<input type="hidden" name="roomIdx" value="G001">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g002" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-002)</button> 
														<input type="hidden" name="roomIdx" value="G002">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g003" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-003)</button> 
														<input type="hidden" name="roomIdx" value="G003">
														<input type="hidden" name="roomAble" value="1">
													<td class="possibleBtn"> 
														<button type="button" id="g004" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-004)</button> 
														<input type="hidden" name="roomIdx" value="G004">
														<input type="hidden" name="roomAble" value="1">									
												</tr>
											</table>
									</div>														
							</td>
							<td class="mon btn_pop" id="2023-10-20">
								<p>20</p>
									<div class="layerDiv">
											<table id="resList">
												<tr class="tflex">
													<td class="possibleBtn"> 
														<button type="button" id="g001" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-001)</button> 
														<input type="hidden" name="roomIdx" value="G001">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g002" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-002)</button> 
														<input type="hidden" name="roomIdx" value="G002">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g003" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-003)</button> 
														<input type="hidden" name="roomIdx" value="G003">
														<input type="hidden" name="roomAble" value="1">
													<td class="possibleBtn"> 
														<button type="button" id="g004" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-004)</button> 
														<input type="hidden" name="roomIdx" value="G004">
														<input type="hidden" name="roomAble" value="1">									
												</tr>
											</table>
									</div>														
							</td>
							<td class="btn_pop sat" id="2023-10-21">
								<p>21</p>
									<div class="layerDiv">
											<table id="resList">
												<tr class="tflex">
													<td class="possibleBtn"> 
														<button type="button" id="g001" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-001)</button> 
														<input type="hidden" name="roomIdx" value="G001">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g002" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-002)</button> 
														<input type="hidden" name="roomIdx" value="G002">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g003" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-003)</button> 
														<input type="hidden" name="roomIdx" value="G003">
														<input type="hidden" name="roomAble" value="1">
													<td class="possibleBtn"> 
														<button type="button" id="g004" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-004)</button> 
														<input type="hidden" name="roomIdx" value="G004">
														<input type="hidden" name="roomAble" value="1">									
												</tr>
											</table>
									</div>														
							</td>	
						</tr>
						<tr class="tr_view">
							<td class="sun btn_pop" id="2023-10-22">
								<p>22</p>
									<div class="layerDiv">
											<table id="resList">
												<tr class="tflex">
													<td class="possibleBtn"> 
														<button type="button" id="g001" class="btn btn-danger btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-001)</button> 
														<input type="hidden" name="roomIdx" value="G001">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g002" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-002)</button> 
														<input type="hidden" name="roomIdx" value="G002">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g003" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-003)</button> 
														<input type="hidden" name="roomIdx" value="G003">
														<input type="hidden" name="roomAble" value="1">
													<td class="possibleBtn"> 
														<button type="button" id="g004" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-004)</button> 
														<input type="hidden" name="roomIdx" value="G004">
														<input type="hidden" name="roomAble" value="1">									
												</tr>
											</table>
									</div>														
							</td>
							<td class="mon btn_pop" id="2023-10-23">
								<p>23</p>
									<div class="layerDiv">
											<table id="resList">
												<tr class="tflex">
													<td class="possibleBtn"> 
														<button type="button" id="g001" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-001)</button> 
														<input type="hidden" name="roomIdx" value="G001">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g002" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-002)</button> 
														<input type="hidden" name="roomIdx" value="G002">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g003" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-003)</button> 
														<input type="hidden" name="roomIdx" value="G003">
														<input type="hidden" name="roomAble" value="1">
													<td class="possibleBtn"> 
														<button type="button" id="g004" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-004)</button> 
														<input type="hidden" name="roomIdx" value="G004">
														<input type="hidden" name="roomAble" value="1">									
												</tr>
											</table>
									</div>								
								
							</td>
							<td class="mon btn_pop" id="2023-10-24">
								<p>24</p>
									<div class="layerDiv">
											<table id="resList">
												<tr class="tflex">
													<td class="possibleBtn"> 
														<button type="button" id="g001" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-001)</button> 
														<input type="hidden" name="roomIdx" value="G001">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g002" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-002)</button> 
														<input type="hidden" name="roomIdx" value="G002">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g003" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-003)</button> 
														<input type="hidden" name="roomIdx" value="G003">
														<input type="hidden" name="roomAble" value="1">
													<td class="possibleBtn"> 
														<button type="button" id="g004" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-004)</button> 
														<input type="hidden" name="roomIdx" value="G004">
														<input type="hidden" name="roomAble" value="1">									
												</tr>
											</table>
									</div>														
							</td>
							<td class="mon btn_pop" id="2023-10-25">
								<p>25</p>
									<div class="layerDiv">
											<table id="resList">
												<tr class="tflex">
													<td class="impossibleBtn"> 
														<button type="button" id="g001" class="btn btn-danger btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G001)</button> 
														<input type="hidden" name="roomIdx" value="G001">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g002" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G002)</button> 
														<input type="hidden" name="roomIdx" value="G002">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g003" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G003)</button> 
														<input type="hidden" name="roomIdx" value="G003">
														<input type="hidden" name="roomAble" value="1">
													<td class="possibleBtn"> 
														<button type="button" id="g004" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G004)</button> 
														<input type="hidden" name="roomIdx" value="G004">
														<input type="hidden" name="roomAble" value="1">									
												</tr>
											</table>
									</div>														
							</td>
							<td class="mon btn_pop" id="2023-10-26">
								<p>26</p>
									<div class="layerDiv">
											<table id="resList">
												<tr class="tflex">
													<td class="possibleBtn"> 
														<button type="button" id="g001" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-001)</button> 
														<input type="hidden" name="roomIdx" value="G001">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g002" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-002)</button> 
														<input type="hidden" name="roomIdx" value="G002">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g003" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-003)</button> 
														<input type="hidden" name="roomIdx" value="G003">
														<input type="hidden" name="roomAble" value="1">
													<td class="possibleBtn"> 
														<button type="button" id="g004" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-004)</button> 
														<input type="hidden" name="roomIdx" value="G004">
														<input type="hidden" name="roomAble" value="1">									
												</tr>
											</table>
									</div>														
							</td>
							<td class="mon btn_pop" id="2023-10-27">
								<p>27</p>
									<div class="layerDiv">
											<table id="resList">
												<tr class="tflex">
													<td class="possibleBtn"> 
														<button type="button" id="g001" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-001)</button> 
														<input type="hidden" name="roomIdx" value="G001">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g002" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-002)</button> 
														<input type="hidden" name="roomIdx" value="G002">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g003" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-003)</button> 
														<input type="hidden" name="roomIdx" value="G003">
														<input type="hidden" name="roomAble" value="1">
													<td class="possibleBtn"> 
														<button type="button" id="g004" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-004)</button> 
														<input type="hidden" name="roomIdx" value="G004">
														<input type="hidden" name="roomAble" value="1">									
												</tr>
											</table>
									</div>														
							</td>
							<td class="btn_pop sat" id="2023-10-28">
								<p>28</p>
									<div class="layerDiv">
											<table id="resList">
												<tr class="tflex">
													<td class="possibleBtn"> 
														<button type="button" id="g001" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-001)</button> 
														<input type="hidden" name="roomIdx" value="G001">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g002" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-002)</button> 
														<input type="hidden" name="roomIdx" value="G002">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g003" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-003)</button> 
														<input type="hidden" name="roomIdx" value="G003">
														<input type="hidden" name="roomAble" value="1">
													<td class="possibleBtn"> 
														<button type="button" id="g004" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-004)</button> 
														<input type="hidden" name="roomIdx" value="G004">
														<input type="hidden" name="roomAble" value="1">									
												</tr>
											</table>
									</div>														
							</td>	
						</tr>
						<tr class="tr_view">
							<td class="btn_pop sun" id="2023-10-29">
								<p>29</p>
									<div class="layerDiv">
											<table id="resList">
												<tr class="tflex">
													<td class="possibleBtn"> 
														<button type="button" id="g001" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-001)</button> 
														<input type="hidden" name="roomIdx" value="G001">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g002" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-002)</button> 
														<input type="hidden" name="roomIdx" value="G002">
														<input type="hidden" name="roomAble" value="1">
													</td>								
												</tr>
											</table>
									</div>														
							</td>
							<td class="btn_pop" id="2023-10-30">
								<p>30</p>
									<div class="layerDiv">
											<table id="resList">
												<tr class="tflex">
													<td class="possibleBtn"> 
														<button type="button" id="g001" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-001)</button> 
														<input type="hidden" name="roomIdx" value="G001">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g002" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-002)</button> 
														<input type="hidden" name="roomIdx" value="G002">
														<input type="hidden" name="roomAble" value="1">
													</td>
				
												</tr>
											</table>
									</div>								
								
							</td>
							<td class="btn_pop" id="2023-10-31">
								<p>31</p>
									<div class="layerDiv">
											<table id="resList">
												<tr class="tflex">
													<td class="possibleBtn"> 
														<button type="button" id="g001" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-001)</button> 
														<input type="hidden" name="roomIdx" value="G001">
														<input type="hidden" name="roomAble" value="1">
													</td>
													<td class="possibleBtn"> 
														<button type="button" id="g002" class="btn btn-success btn-sm gbtn" 
														data-bs-toggle="modal" data-bs-target="#resModal">글램핑(G-002)</button> 
														<input type="hidden" name="roomIdx" value="G002">
														<input type="hidden" name="roomAble" value="1">
													</td>						
												</tr>
											</table>
									</div>														
							</td>
							<td class="nextmon btn_pop" id="2023-11-01">
							</td>
							<td class="nextmon btn_pop" id="2023-11-02">
							</td>
							<td class="nextmon btn_pop" id="2023-11-03">
							</td>
							<td class="nextmon btn_pop" id="2023-11-04">
							</td>	
						</tr>												
					
					
					
					
				
		
				</table>
			</div>






		
			
			
				
					
					


<!-- 여기 건들면 굉장히 위험합니다......다 날라가... 예약못해.. 결제 못해... -->
<!-- 여기 건들면 굉장히 위험합니다......다 날라가... 예약못해.. 결제 못해... -->
<!-- 여기 건들면 굉장히 위험합니다......다 날라가... 예약못해.. 결제 못해... -->
<!-- 여기 건들면 굉장히 위험합니다......다 날라가... 예약못해.. 결제 못해... -->
<!-- 여기 건들면 굉장히 위험합니다......다 날라가... 예약못해.. 결제 못해... -->
<!-- 여기 건들면 굉장히 위험합니다......다 날라가... 예약못해.. 결제 못해... -->
<!-- 여기 건들면 굉장히 위험합니다......다 날라가... 예약못해.. 결제 못해... -->
<!-- 여기 건들면 굉장히 위험합니다......다 날라가... 예약못해.. 결제 못해... -->
<!-- 여기 건들면 굉장히 위험합니다......다 날라가... 예약못해.. 결제 못해... -->
<!-- 여기 건들면 굉장히 위험합니다......다 날라가... 예약못해.. 결제 못해... -->

<!-- 캘린더 내의 예약 가능한 캠핑장 유형 클릭했을 때 나오는 예약화면 모달 -->
<div class="modal fade" id="resModal" >
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">


      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">예약 상세정보</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
      
		       	<div id="res1">
		       		<form>
			       		<label>예약자명 : </label>
						<input type="text" name="name" value="최예원">	       		
		       		
			       		<label>예약날짜 : </label>
						<input type="text" name="resday" value="2023.10.25.">
						
						<label>캠핑장 유형 : </label>
						<input type="text" name="camptype" value="글램핑(G)">
						
						<label>자리 번호 : </label>
						<input type="text" name="campnum" value="001">	
						
						<label>인원수 : </label>
						<input type="text" name="people" value="2">

						<label id="내용">입실일 :</label>
						<input type="text" name="campnum" value="2023.10.25.">
						
						<label>퇴실일 : </label>
						<input type="text" name="campnum" value="2023.10.26.">

						
						<label>금액 : </label>
						<input type="text" name="money" value="200,000원">
		       		</form>
		       		
		       	</div>
		       
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">	
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">닫기</button>
        <!-- data-bs-toggle="modal" data-bs-target="#payModal" 때문에 애썼다.. 주의하기.. -->
      </div>

    </div>
  </div>
</div>


</body>
</html>
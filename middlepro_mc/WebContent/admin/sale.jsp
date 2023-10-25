<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날짜별매출조회</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>
<script type="text/javascript">
	$(function() {
		/* 그래프 */
		/* 연간 */
		const ych = document.getElementById('yearChart').getContext('2d');
		const yearChart = new Chart(ych, {
			type : 'bar', // 바 차트로 변경
			data : {
				labels : [ '2022', '2023', '2024' ],
				datasets : [ {
					label : '오토캠핑',
					data : [ 10, 20, 30 ],
					borderColor : 'rgb(255, 99, 132)',
					backgroundColor : 'pink'
				}, {
					type : 'bar', // 바 차트로 변경
					label : '글램핑',
					data : [ 30, 40, 10 ],
					borderColor : 'rgb(255, 99, 132)',
					backgroundColor : 'lightgreen'
				}, {
					type : 'bar', // 바 차트로 변경
					label : '카라반',
					data : [ 10, 30, 30 ],
					borderColor : 'rgb(255, 99, 132)',
					backgroundColor : 'skyblue'
				}, {
					type : 'line',
					label : '총 매출',
					data : [ 50, 90, 70 ],
					fill : false,
					borderColor : 'rgb(54, 162, 235)'
				} ]
			}
		});
		/* 월별 */
		const mch = document.getElementById('monthChart').getContext('2d');
		const monthChart = new Chart(mch, {
			type : 'bar', // 바 차트로 변경
			data : {
				labels : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
						'9월', '10월', '11월', '12월' ],
				datasets : [
						{
							type : 'bar',
							label : '오토캠핑',
							data : [ 10, 20, 30, 25, 20, 50, 60, 30, 48, 22,
									13, 25 ],
							borderColor : 'rgb(255, 99, 132)',
							backgroundColor : 'pink'
						},
						{
							type : 'bar',
							label : '글램핑',
							data : [ 30, 40, 10, 45, 37, 29, 30, 60, 20, 58,
									37, 55 ],
							borderColor : 'rgb(255, 99, 132)',
							backgroundColor : 'lightgreen'
						},
						{
							type : 'bar',
							label : '카라반',
							data : [ 10, 30, 30, 40, 53, 51, 45, 20, 52, 37,
									25, 25 ],
							borderColor : 'rgb(255, 99, 132)',
							backgroundColor : 'skyblue'
						},

						{
							type : 'line',
							label : '총 매출',
							data : [ 50, 90, 70, 110, 110, 130, 135, 110, 120,
									117, 75, 105 ],
							fill : false,
							borderColor : 'rgb(54, 162, 235)'
						} ]

			}
		});
		/* 일별 */
		function generateDailyData(days) {
			const data = [];
			for (let i = 1; i <= days; i++) {
				data.push(i);
			}
			return data;
		}
		const daysData = generateDailyData(31);

		const dch = document.getElementById('dayChart').getContext('2d');
		const dayChart = new Chart(dch, {
			type : 'bar', // 바 차트로 변경
			data : {
				labels : daysData,
				datasets : [
						{
							type : 'bar',
							label : '오토캠핑',
							data : [ 10, 20, 30, 25, 20, 50, 60, 30, 48, 22,
									13, 25 ],
							borderColor : 'rgb(255, 99, 132)',
							backgroundColor : 'pink'
						},
						{
							type : 'bar',
							label : '글램핑',
							data : [ 30, 40, 10, 45, 37, 29, 30, 60, 20, 58,
									37, 55 ],
							borderColor : 'rgb(255, 99, 132)',
							backgroundColor : 'lightgreen'
						},
						{
							type : 'bar',
							label : '카라반',
							data : [ 10, 30, 30, 40, 53, 51, 45, 20, 52, 37,
									25, 25 ],
							borderColor : 'rgb(255, 99, 132)',
							backgroundColor : 'skyblue'
						},

						{
							type : 'line',
							label : '총 매출',
							data : [ 50, 90, 70, 110, 110, 130, 135, 110, 120,
									117, 75, 105 ],
							fill : false,
							borderColor : 'rgb(54, 162, 235)'
						} ]
			}
		});

		/* 클릭 버튼에 따라 그래프 보이기 */
	    // 초기에 연간 매출 그래프 표시
	    $('canvas').hide();
	    $('#yearChart').show();

	    // 연간 매출 버튼 클릭
	    $('#btns li:eq(0)').click(function() {
	        $('canvas').hide(); // 모든 canvas를 숨김
	        $('#yearChart').show(); // 연간 매출 canvas를 표시
	    });

	    // 월간 매출 버튼 클릭
	    $('#btns li:eq(1)').click(function() {
	        $('canvas').hide(); // 모든 canvas를 숨김
	        $('#monthChart').show(); // 월간 매출 canvas를 표시
	    });

	    // 일간 매출 버튼 클릭
	    $('#btns li:eq(2)').click(function() {
	        $('canvas').hide(); // 모든 canvas를 숨김
	        $('#dayChart').show(); // 일간 매출 canvas를 표시
	    });
	});
</script>
<!-- **** sale CSS -->
<style type="text/css">
#section h1 {
text-align: center;
margin: 40px 0;
}
#section * {
	color: #4d2222;
}
#section .flx {
	display: flex;
	flex-direction: row;
	width: 70%;
	margin: 20px auto;
    justify-content: space-between;
}
#section p {
    margin-top: 13px;
}
#chartBox {
	border: 1px solid #DE8F5F;
	border-radius: 30px;
	width: 75%;
	height: 75%;
	padding: 50px;
	margin: 0 auto;
	position: relative;
}
#btns {
	display: flex;
	flex-direction: row;
}
#btns li {
	background: #f1f0cb;
	margin-left: 20px;
	padding: 10px 15px;
	border-radius: 30px; 
	cursor: pointer;
}
#totalSale {
	color: #DE8F5F;
}
</style>
</head>
<body>
	<h1>기간별 매출 조회</h1>
	<div class="flx">
		<!-- span#totalSale : 총 매출 DB 들어감 -->
		<p>총 매출 | <span id="totalSale"></span></p>
		<ul id="btns">
			<li>연간 매출</li>
			<li>월간 매출</li>
			<li>일간 매출</li>
		</ul>
	</div>
	<div id="chartBox">
		<!-- 차트 -->
		<canvas id="yearChart"></canvas>
		<canvas id="monthChart"></canvas>
		<canvas id="dayChart"></canvas>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날짜별매출조회</title>
<link rel="icon" href="<%=request.getContextPath()%>/images/favicon_admin.ico">
<script src="<%=request.getContextPath()%>/js/jquery-3.7.1.min.js"></script>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>
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
<script type="text/javascript">
// 전역변수
monthChart = null;

currentYearAndMonth = getCurrentYearAndMonth();
dayChart = null;


$(function() {
	
	// 현재 년도와 월을 가져와서 드롭다운 메뉴에서 선택
    currentYearAndMonth = getCurrentYearAndMonth();
    $('#selectMonth').val(currentYearAndMonth);

    // 초기에 월매출 차트를 표시
    $('.canvasContainer').hide();
    createMonthChart();
    $('#monthChart').show();

    // 월간 매출 버튼 클릭
    $('#monthbtn').click(function() {
        $('.canvasContainer').hide();
        createMonthChart();
        $('#monthChart').show();
    });

    // 일간 매출 버튼 클릭
    $('#daybtn').click(function() {
        $('.canvasContainer').hide();
        createDayChart(currentYearAndMonth);
        $('#dayChartContainer').show();
    });

	// 월 선택 드롭다운이 변경될 때 호출되는 함수
    $(document).on('change', '#selectMonth', function() {
    	currentYearAndMonth = $(this).val();
        createDayChart(currentYearAndMonth);
        //console.log(currentYearAndMonth);
    });
   

});		
	


function createMonthChart(){
	
	if (monthChart) {
	      monthChart.destroy();
	}
	
	// 서버로부터 데이터 가져오는 AJAX 요청
    $.ajax({
        url: '<%= request.getContextPath()%>/adminMonthSale.do', 
        method: 'POST',
        success: function(data) {
			var monthSalesArray = [];
			var SalesArray = [];
	     
			for (var i = 0; i < data.list.length; i++) {
			    var item = data.list[i];
			    var month = item.MONTH;
			    var totalPayAmount = item.TOTAL_PAY_AMOUNT;
			    
			    console.log("month : " + month);
			    console.log("totalPayAmount : " + totalPayAmount);
			
			    monthSalesArray.push(month);
			    SalesArray.push(totalPayAmount);
			}			
			 
	        const mch = document.getElementById('monthChart').getContext('2d');
			monthChart = new Chart(mch, {
				type : 'bar', // 바 차트로 변경
				data : {
					labels : monthSalesArray,//[monthSalesArray[1],monthSalesArray[3],monthSalesArray[5],monthSalesArray[7] ], 
					datasets : [{
							type : 'bar',
							label : '2023',
							data : SalesArray,//[SalesArray[1],SalesArray[3],SalesArray[5],SalesArray[7]] ,
							borderColor : 'rgb(255, 99, 132)',
							backgroundColor : 'pink'
						}]
				 	}
			});
		 // month(monthSalesArray,SalesArray);
        },
        error: function(xhr) {
        	alert("상태 : " + xhr.status);
        }
    });
}
	

function createDayChart(yearAndMonth){
	
	if (dayChart) {
		dayChart.destroy();
	}
	
	
	// 서버로부터 해당 월의 일간 매출 데이터를 가져오는 AJAX 요청
    $.ajax({
        url: '<%= request.getContextPath()%>/adminDaySale.do',
        method: 'POST',
        data: { month: currentYearAndMonth }, // 선택한 월을 서버에 전달
        success: function(data) {
            var daySalesArray = [];
            var SalesArray = [];

            for (var i = 0; i < data.list.length; i++) {
                var item = data.list[i];
                var day = item.DATE;
                var dailyPayAmount = item.TOTAL_PAY_AMOUNT;

                console.log("day : " + day);
                console.log("dailyPayAmount : " + dailyPayAmount);

                daySalesArray.push(day);
                SalesArray.push(dailyPayAmount);
            }

            const dch = document.getElementById('dayChart').getContext('2d');
            dayChart = new Chart(dch, {
                type: 'bar',
                data: {
                    labels: daySalesArray,
                    datasets: [{
                        label: '일간 매출',
                        data: SalesArray,
                        fill: false,
                        borderColor: 'rgb(156, 215, 255)',
                        backgroundColor : 'rgb(156, 215, 255)'
                    }]
                }
            });
        },
        error: function(xhr) {
        	alert("상태 : " + xhr.status);
        }
    });
	
	
}

//현재 날짜를 가져오는 함수
function getCurrentYearAndMonth() {
    var today = new Date();
    var year = today.getFullYear();
    var month = today.getMonth() + 1; // getMonth()는 0부터 시작하므로 +1을 해줍니다.
    return year + '-' + (month < 10 ? '0' : '') + month;
}
</script>

</head>
<body>

<jsp:include page="adminHeader.jsp"></jsp:include>

<!-- 헤더 아래 모두 -->
	<div id="container">
		
		<!-- Include "adminMain.jsp"의 header 부분 -->
	    <jsp:include page="adminSidemenu.jsp"></jsp:include>


		<!-- 공지사항 게시물 -->
		<div id="section">
		
			<section id="adminFAQ">
				<h1> 매출 조회</h1>
				<!-- 게시물 시작 -->
	              
				<div class="flx">
					<!-- span#totalSale : 총 매출 DB 들어감 -->
					<!-- <p>총 매출 | <span id="totalSale"></span></p> -->
					<ul id="btns">
						<li id="monthbtn">월간 매출</li>
						<li id="daybtn">일간 매출</li>
					</ul>
				</div>
	            
				<div id="chartBox">
					<!-- 차트 -->
					<!-- <canvas id="yearChart"></canvas> -->
					<canvas class="canvasContainer" id="monthChart"></canvas>
					<div class="canvasContainer" id="dayChartContainer">
						<select id="selectMonth"> 
							<option value="2023-01">1월</option> 
							<option value="2023-02">2월</option> 
							<option value="2023-03">3월</option> 
							<option value="2023-04">4월</option> 
							<option value="2023-05">5월</option> 
							<option value="2023-06">6월</option> 
							<option value="2023-07">7월</option> 
							<option value="2023-08">8월</option> 
							<option value="2023-09">9월</option> 
							<option value="2023-10">10월</option> 
							<option value="2023-11">11월</option> 
							<option value="2023-12">12월</option> 
						</select>
						<canvas id="dayChart"></canvas>
					</div>
				</div>
			</section>
		</div>	
		
	</div>	
</body>
</html>
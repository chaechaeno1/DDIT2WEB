/**
 * 
 */

//예약취소에 따른 환불 유무 표시
$.updateRefundServer = function(rsvno) {
	
	 var selectedCheckboxes = $('input[type="checkbox"]:checked');

	selectedCheckboxes.each(function() {
		var rsvno = $(this).closest('tr').find('td:eq(1)').text(); // 예약 번호는 테이블의 두 번째 열에 있을 경우
	
    $.ajax({
        url: `${mypath}/Refund.do`,
        type: 'get',
        data: {	"rsvno": rsvno},
        success: function(res) {
            if (res === "성공") {
				
				canceltr = target.parents('tr');
                // 환불 유무를 화면 부분에서 가져오기
                var flag = canceltr.find('.refundflag');
                
                // 값을 가져오기
                var flagvalue = parseInt($(flag).text());
                $(flag).text(flagvalue);
                

            }
        },
        error: function(xhr) {
            alert("상태: " + xhr.status);
        },
        dataType: 'json'
        });
    });
}



// 예약내역 리스트 출력
$.listCancelServer = function(idInfo) {

    // AJAX 요청
    $.ajax({
        url: `${mypath}/RsvList.do`,
        type: 'post',
		data: { "mem_id" : idInfo },
        success: function(res) {
            // 서버에서 받아온 데이터(res)를 활용하여 웹 페이지에 데이터를 출력
            var table = $('#reservationCancelInfoForm table');
            $.each(res, function(i, v) {
	
				var refundStatus = v.REFUND_FLAG === 1 ? '취소' : '예약완료';
                var row = 
						`<tr>
								<td><input type="checkbox"></td>
					  			<td class="rsvno">${v.RSV_NO}</td>
					  			<td>${v.RSV_DATE}</td>
					  			<td>${v.CAMPSITE_NO}</td>
					  			<td>${v.RSV_START_DATE}</td>
					  			<td>${v.RSV_END_DATE}</td>
					  			<td>${v.RSV_PERSON_CNT}</td>
					  			<td>${v.PAY_AMT}</td>
					  			<td class="refundflag">${refundStatus}</td> 		
					  	</tr>`;
                table.append(row);

                // 여기서 환불 유무에 따른 처리 추가
                if (v.REFUND_FLAG === 1) {
                    var canceltr = table.find('tr:last'); // 현재 행을 가져옴
                    // 3. 체크박스 비활성화
                    canceltr.find('input[type="checkbox"]').prop('disabled', true);
                    // 4. 행 배경색을 회색으로 변경
                    canceltr.css('background-color', 'gray');
					}
					
				if(v.REFUND_FLAG === 1){
					
					
				}	
					
            });
        },
        error: function(xhr) {
            alert("상태: " + xhr.status);
        },
        dataType: 'json'
    });
}



// 캘린더 예약정보 클릭시 정보 출력 
$.SelectByRsvServer = function(rsvDate, campsiteNo){
	
	$.ajax({
		 url : `${mypath}/selectByRsv.do`,
		 type : 'post',
		 data : {"campsite_no" : campsiteNo, "rsv_start_date" : rsvDate},
		 success : function(res){
		 
		 console.log("res", res);
		 
		 if (Array.isArray(res) && res.length > 0) {
		     const data = res[0];
		 
		     code = `<label>예약번호 : </label>
						<span id="rsvNum" name="rsvNum">${data.rsv_no}</span><br>

						<label>예약자명 : </label>
						<span id="name" name="name">${data.payVo.pay_name}</span><br>
		       		
			       		<label>예약날짜 : </label>
						<span id="resDate" name="resDate">${data.rsv_date}</span><br>

						<label>캠핑장 번호 : </label>
						<span id="campNum" name="campNum">${data.campsite_no}</span><br>

						<label>인원수 : </label>
						<span id="people" name="people">${data.rsv_person_cnt}</span><br>

						<label>입실일 :</label>
						<span id="startday" name="startday">${data.rsv_start_date}</span><br>

						<label>퇴실일 :</label>
						<span id="exitday" name="exitday">${data.rsv_end_date}</span><br>

						<label>금액 : </label>
						<span id="pay" name="pay">${data.payVo.pay_amt}</span><br>`;
	
	
		     $('#infoForm').html(code);
		 }
			
		 },
		 error : function(xhr){
			 alert("상태 : " + xhr.status)
		 },
		 dataType : 'json'
	 })

}



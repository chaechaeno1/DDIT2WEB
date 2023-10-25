/**
 * 
 */

// 공지사항 수정
$.updateNoticeServer = function() {
	
	$.ajax({
		url : `${mypath}/noticeUpdate.do`,
		type : 'post',
		// vdata는 수정창에서 전송 버튼을 클릭했을 때 form의 내용들
		data : vdata, // notice_no, notice_title, notice_date, notice_content
		success : function(res) {
			if(res == "성공") {
				alert(vidx + "번째 공지사항 수정 완료!");
				// vdata의 내용으로 화면의 본문 내용 변경
				vparent.find('.panel-faq-title').text(vdata.notice_title);
				cont = vdata.notice_content;  //\r\n
				cont = cont.replace(/\n/g, "<br>");
				vparent.find('.cont').html(cont);
			} else {
				alert("공지사항 수정 실패!");
			}
		},
		error : function(xhr) {
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	});
}


// 공지사항 삭제
$.deleteNoticeServer = function() {
	
	$.ajax({
		url : `${mypath}/noticeDelete.do`,
		type : 'get',
		data : { "num" : vidx },
		success : function(res) {
			if(res == "성공") {
				alert(vidx + "번째 공지사항 삭제 성공!");
				$.listNoticeServer(currentpage);
			} else {
				alert("공지사항 삭제 실패!");
			}
		},
		error : function(xhr) {
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	});
}


// 공지사항 작성
$.insertNoticeServer = function() {
	
	$.ajax({
		url : `${mypath}/noticeInsert.do`,
		type : 'post', 
		data : vdata,
		success : function(res) {
			if(res == "성공") {
				alert("공지사항 등록 완료!");
				currentpage = 1;
				$.listNoticeServer(currentpage);
			} else {
				alert("공지사항 등록 실패");
			}
		},
		error : function(xhr) {
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	});
}





// read 관련---------------------------------------------------
// 조회수 증가하기
$.updateHitServer = function() {
	
	$.ajax({
		url : `${mypath}/noticeHitUpdate.do`,
		type : 'get',
		data : { "num" : vidx },
		success : function(res) {
			if(res == "성공") {
				// 화면 부분의 조회수를 변경
				vhit = target.parents('tr').find('.hit');
				
				// 값을 가져온다 - 1증가
				hitvalue = parseInt($(vhit).text()) + 1;
				
				$(vhit).text(hitvalue);
			}
		},
		error : function(xhr) {
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	});
}



// 페이지 리스트
pageList = function(sp, ep, tp) {
	
	pager = `<ul class="pagination justify-content-center">`;
	
	// 이전
	if(sp > 1) {
		pager += `<li class="page-item"><a id="prev" class="page-link">prev</a></li>`;
	}
	
	if(currentpage > tp) currentpage = tp;
	
	for(i=sp; i<=ep; i++) {
		if(i==currentpage) {
			pager += `<li class="page-item"><a class="page-link pageno" id="cpageno">${i}</a></li>`;
		} else {
			pager += `<li class="page-item"><a class="page-link pageno">${i}</a></li>`;
		}
	}
	
	// 다음
	if(ep < tp) {
		pager += `<li class="page-item"><a id="next" class="page-link">next</a></li>`;
	}
	
	
	pager += "</ul>";
	
	return pager;
	
}


// 공지사항 리스트 출력
$.listNoticeServer = function(cpage) {
	
	vtype = $('#stype option:selected').val().trim();
	vword = $('#sword').val().trim();
	
	$.ajax({
		url : `${mypath}/noticeList.do`,
		type : 'post',
		data : {
			"page" : cpage,
			"stype" : vtype,
			"sword" : vword
		},
		success : function(res) {
			code = '';
			
			$.each(res.datas, function(i,v) {
				
				cont = v.notice_content;
				cont = cont.replaceAll(/\n/g, "<br>");
				
				code += `<tr>
                  <td>${v.notice_no}</td> <!-- 번호 -->
                  <td class="text-left">
                    <div class="panel-faq-container">
                      <p class="panel-faq-title action" name="title" idx="${v.notice_no}">${v.notice_title}</p> <!-- 제목 -->
                      <div class="panel-faq-answer"> <!-- class에 active가 있으면 펼쳐짐  -->
                      <br><br>
                        <p class="cont">${cont}</p> <!-- 내용 -->
						<p class="pbtn">
							<input idx="${v.notice_no}" type="button" value="수정" name="modify" class="btn action" data-bs-toggle="modal" data-bs-target="#updateNoticeModal">
							<input idx="${v.notice_no}" type="button" value="삭제" name="delete" class="btn action">
                        </p>
                      </div>
                    </div>
                    
                  </td>
                  
                  <td class="date">${v.notice_date}</td> <!-- 등록일 -->
                  <td class="hit">${v.notice_hit}</td> <!-- 조회수 -->
                </tr>`;
			});
			$('#NOTICE tbody').html(code);
			
			// 페이지번호 만들기
			pager = pageList(res.sp, res.ep, res.tp);
			
			// 출력
			$('.paging').html(pager);
		},
		error : function(xhr) {
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	});
	
}
/**
 * 
 */

$.listReplyServer = function(){
	$.ajax({
		url : `${mypath}/ReplyList.do`,
		type : 'post',
		data : { "bonum" : vidx},
		success : function(res){
			
		},
		error : function(xhr){
			alert("상태 : "+xhr.status)
		},
		datrType : 'json'
		
	})
}




$.insertReplyServer = function(){
	$.ajax({
		url : `${mypath}/ReplyInsert.do`,
		type : 'post',
		data : reply, /* name, bonum, cont*/
		success : function(res){
			
		},
		error : function(xhr){
			alert("상태 : "+xhr.status)
		},
		datrType : 'json'
		
	})
	
}


$.listBoardServer = function(cpage){
	
	 //실행 하자마자 리스트 출력 - stype, sword 없는 상태
	 
	 vtype = $('#stype option:selected').val().trim();
	 vword = $('#sword').val().trim();
	 
	 console.log(vtype, vword);
	 
	$.ajax({
		url : `${mypath}/BoardList.do`,
		type : 'post',
		data : {
				"page" : cpage,
				"stype" : vtype,
				"sword" : vword
		},
		success : function(res){ //res는 지역변수
			code = '<div class="container mt-3">'
			code += '<div id="accordion">'
			
			$.each(res.datas, function(i,v){
				code += `<div class="card">
			      			<div class="card-header">
			       			 <a class="collapsed btn action" name="title" idx="${v.num}" data-bs-toggle="collapse" href="#collapse${v.num}">
			         		${v.subject} 
			      			  </a>
			      			</div>
			      <div id="collapse${v.num}" class="collapse" data-bs-parent="#accordion">
			        <div class="card-body">
			         <div class="pp">
			         	<p class="p1">작성자 <span class="wr">${v.writer}</span>
			         				   이메일 <span class="em">${v.mail}</span>
			         				   조회수<span class="hit">${v.hit}</span> 
			         				   날짜<span class="dat">${v.wdate}</span>
			         	</p>
			         	<p class="p2">
			         		<input idx="${v.num}" type="button" value="수정" class="action" name="modify">
			         		<input idx="${v.num}" type="button" value="삭제" class="action" name="delete">         		
			         	</p>
			         </div>
			         <p class="p3">${v.content}</p>
			         <p class="p4">
						<textarea rows="3" cols="50"></textarea>
						<input type="button" idx="${v.num}" class="action" name="reply" value="등록">
					</p>
			        </div>
			      </div>
			    </div>`
				
				
			}) /* 반복문 끝 */
			
			code += "</div>";
			code += "</div>";
			
			//글 목록 list 출력
			$('#result').html(code);
			
			//페이지 번호 만들기
			pager = pageList(res.sp, res.ep, res.tp)
			
			//출력
			$('#pageList').html(pager);
			
			
		},
		error : function(xhr){
			alert("상태 : "+xhr.status)
		},
		dataType : 'json'
		
	}) 
	
}/* list 끝*/


pageList = function(sp, ep, tp){
	
	pager = '<ul class="pagination">';
	
	//이전
	if(sp > 1){
		pager += `<li class="page-item"><a id="prev" class="page-link">Previous</a></li>`
	}
	//페이지 번호
	for(i = sp; i<=ep; i++){
		if(i==currentpage){
			pager += `<li class="page-item active"><a class="page-link pageno">${i}</a></li>`
		}else{
			pager += `<li class="page-item"><a class="page-link pageno">${i}</a></li>`
			
		}
	}
	
	//다음
	if(ep < tp){
		pager += `<li class="page-item"><a id="next" class="page-link">Next</a></li>`
	}
	

	pager += "</ul>";
	
	return pager;
	
}
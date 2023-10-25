/**
 * 
 */



// FAQ 글 수정 
$.updateFAQServer = function(){
	
	$.ajax({
		url  : `${mypath}/faqUpdate.do`,
		type : 'post',
		data : vdata, 
		success : function(res){
			console.log("res", res);
			if(res == "성공"){
				//vdata의 내용으로 화면의 본문 내용을 변경한다 
				vparent.find('.panel-faq-title').text(vdata.faq_title);
				
				cont = vdata.faq_content;  //\r\n 
				console.log("vdata.faq_content==" , cont );
				
				cont = cont.replace(/\n/g, "<br>");
				
				vparent.find('.p3').html(cont);
			}
			
		},
		dataType : 'json',
		error : function(xhr){
			alert("상태 : " + xhr.status);
		}
	})
}



//FAQ 글 삭제
$.deleteFAQServer = function(){
	
	$.ajax({
		url  : `${mypath}/faqDelete.do`,
		type : 'get',
		data : {"faq_no" : vidx},
		success : function(res){
			$.listFAQServer(currentpage);
			
		},
		dataType : 'json'
	})
}






//FAQ 글 저장 
$.insertFAQServer = function(){
	
	$.ajax({
		url  : `${mypath}/faqInsert.do`,
		type : 'post',
		data : vdata,
		success : function(res){
			currentpage = 1;
			$.listFAQServer(currentpage);
			
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
		
	})
}







//FAQ 글 리스트 출력 
$.listFAQServer = function(cpage){
	

	 $.ajax({
		 url : `${mypath}/faqList.do`,
		 type : 'post',
		 data : {
			 "page" : cpage
			 
		 },
		 success : function(res){
		
			code = `<table>
              		<thead> 
	                <tr>
	                    <th id="num">번호</th>
	                    <th id="subject">제목</th>
	                </tr>
              		</thead>
						<tbody>`
		
			$.each(res.datas, function(i, v){
				
				cont = v.faq_content;
				cont = cont.replace(/\n/g, "<br>");
				
 				code += `<tr>
                  <td>${v.faq_no}</td>
                  <td class="text-left">
                    <div class="panel-faq-container">
                      <p class="panel-faq-title" name="title">${v.faq_title}</p>
  						<p class="pbtn">
                          <input idx="${v.faq_no}" type="button" value="수정" class="action" name="modify">
		                  <input idx="${v.faq_no}" type="button" value="삭제" class="action" name="delete">
                        </p>
                      <div class="panel-faq-answer">
                      <br>
                        <p class="p3">${cont}</p>
                      
                      </div>
                      
                    </div>
                  </td>

                </tr> `



		
             				
			})   /*반복문 끝*/
			
			code +="</tbody>";
			code +="</table>";
		
			
			
			//글 목록 list 출력 
			$('#result').html(code);
			
	//페이지번호 만들기
			pagenumber = pageList(res.sp, res.ep, res.tp)
			
			//출력 
			$('#pageList').html(pagenumber);
			
		 },
		 error : function(xhr){
			 alert("상태 : " + xhr.status)
		 },
		 dataType : 'json'
	 })

}  /* 리스트 끝 */






pageList = function(sp, ep, tp){
	
	pager = `<ul class="pagination">`;
	
	//이전 
	if(sp > 1){
	    pager += `<li class="page-item"><a id="prev" class="page-link" >이전</a></li>`
	}
	//페이지 번호 - 마지막페이지-currentpage-에서 한개의 데이타만 남아있고 
	//그 한개의 데이타를 지웠을때 현재페이지번호-currentpage-
	//는 없는 번호가 된다 - 	currentpage을 totalpage 값으로 변경한다 
	if(currentpage > tp) currentpage = tp;
	
	for(i = sp; i<=ep ; i++){
		if(i == currentpage){
			pager += `<li class="page-item active"><a class="page-link pageno" >${i}</a></li>`
		}else{
			pager += `<li class="page-item"><a class="page-link pageno" >${i}</a></li>`
		}
	}
	
	//다음 
	if(ep < tp){
		pager += `<li class="page-item"><a id="next" class="page-link" >다음</a></li>`
	}
	
	pager += "</ul>";
	
	return pager;
	
}

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
			
			if(res == "성공"){
				//vdata의 내용으로 화면의 본문 내용을 변경한다 
				vparent.find('.panel-faq-title').text(vdata.faq_title);
				cont = vdata.faq_content;  //\r\n 
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
					<tbody>`;
		
				$.each(res.datas, function(i, v){
				
					cont = v.faq_content;
					cont = cont.replace(/\n/g, "<br>");
				
 			code += `<tr>
                  <td>${v.faq_no}</td>
                  <td class="text-left">
                    <div class="panel-faq-container">
                      <p class="panel-faq-title action" idx="${v.faq_no}" name="title">${v.faq_title}</p>
  						
                      <div class="panel-faq-answer">
                      <br>
                        <p class="p3">${cont}</p>
						<p class="pbtn">
					   	<input idx="${v.faq_no}" type="button" value="수정" class="action" name="modify">
		                 <input idx="${v.faq_no}" type="button" value="삭제" class="action" name="delete">
                        </p></div>
                      </div>
                 	 </td>
				 </tr> `
    				
			})   /*반복문 끝*/
			
			code +="</tbody>";
			code +="</table>";
		
			
			
			//글 목록 list 출력 
			$('#adminFAQtable').html(code);
			

		 },
		 error : function(xhr){
			 alert("상태 : " + xhr.status)
		 },
		 dataType : 'json'
	 })

}  /* 리스트 끝 */





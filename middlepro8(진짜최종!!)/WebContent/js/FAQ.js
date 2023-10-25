/**
 * 
 */







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
					   	</div>
                      </div>
                 	 </td>
				 </tr> `
    				
			})   /*반복문 끝*/
			
			code +="</tbody>";
			code +="</table>";
		
			
			
			//글 목록 list 출력 
			$('#FAQtable').html(code);
			

		 },
		 error : function(xhr){
			 alert("상태 : " + xhr.status)
		 },
		 dataType : 'json'
	 })

}  /* 리스트 끝 */





/**
 * 
 */







$.listMemberServer = function(cpage){
     stype  = $('#searchType option:selected').val().trim();
     vword = $('#searchMem').val().trim();
	
    $.ajax({
       url : `${mypath}/memberList.do`,
       type : 'post',
       data : {
           "page" : cpage,
          "searchType"  : stype,
          "searchMem" : vword
       },
       success : function(res){
         
         code = `<div><ul id="firlist" class="list">
                  <li>번호</li>
                  <li>아이디</li>
                  <li>이름</li>
                  <li>이메일</li>
                  <li>전화번호</li>
               </ul>`;
      
            $.each(res.datas, function(i, v){
               
             code += `<ul class="list">
               <li>${v.rnum}</li>
               <li>${v.mem_id}</li>
               <li>${v.mem_name}</li>
               <li>${v.mem_mail}</li>
               <li>${v.mem_hp}</li>
                  </ul>`
                
         })   /*반복문 끝*/
         
         code +="</div>";

		$('#searchCnt').html(res.tc);
      
         
         //글 목록 list 출력 
         $('#listBox').html(code);
         
         //페이지번호 만들기
         pager = mempageList(res.sp, res.ep, res.tp)
         
         //출력 
         $('#mpageList').html(pager);
         



       },
       error : function(xhr){
          alert("상태 : " + xhr.status)
       },
       dataType : 'json'
    })

}  /* 리스트 끝 */




mempageList = function(sp, ep, tp){
	
	pager = `<ul class="pagination justify-content-center">`;
	
	//이전 
	if(sp > 1){
	    pager += `<li class="page-item"><a id="prev" class="page-link">prev</a></li>`;
	}
	//페이지 번호 - 마지막페이지-currentpage-에서 한개의 데이타만 남아있고 
	//그 한개의 데이타를 지웠을때 현재페이지번호-currentpage-
	//는 없는 번호가 된다 - 	currentpage을 totalpage 값으로 변경한다 
	if(currentpage > tp) currentpage = tp;
	
	for(i=sp; i<=ep ; i++){
		if(i == currentpage){
			pager += `<li class="page-item"><a class="page-link pageno" id="cpageno">${i}</a></li>`;
		}else{
			pager += `<li class="page-item"><a class="page-link pageno">${i}</a></li>`;
		}
	}
	
	//다음 
	if(ep < tp){
		pager += `<li class="page-item"><a id="next" class="page-link">next</a></li>`;
	}
	
	pager += "</ul>";
	
	return pager;
	
}



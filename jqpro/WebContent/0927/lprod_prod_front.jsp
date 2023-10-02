<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="true"%>
<!-- 
JSP(JavaServer Pages) 페이지에서 EL(Expression Language)을 비활성화하는 지시자
isELIgnored="true"로 설정하면 EL을 사용할 수 없으며 ${...} 형식의 표현식이 그대로 출력
 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<!-- 외부CSS -->
<link rel="stylesheet" href="../css/public.css">

<!-- 외부스크립트 -->
<script src="../js/jquery-3.7.1.min.js"></script>


<script>
$(function(){
	//lprodlist 출력
	$('#btn1').on('click', function(){
		
		//$.get(url, data, success, dataType)
		//$.getJSON(url, data, success)
		
		<%-- $.get('<%=request.getContextPath()%>/LprodList.do', 
				function(res){
				code = "";
				
				$.each(res,function(i,v){
					code += `<option value="${v.lprod_gu}">${v.lprod_nm}</option>`;
				})
				
				$('#lpord').html(code);
			
				}, 
				'json'
			)
				
		$.getJSON('<%=request.getContextPath()%>/LprodList.do', 
				function(res){
				code = "";
				
				$.each(res,function(i,v){
					code += `<option value="${v.lprod_gu}">${v.lprod_nm}</option>`;
				})
				
				$('#lpord').html(code);
			
				}
			) --%>
		
		
		$.ajax({
			//url : 'http://localhost/jqpro/서블릿이름',
			url : '<%=request.getContextPath()%>/LprodList.do',
			type : 'get',
			success : function(res){
				code = "";
				
				$.each(res,function(i,v){
					code += `<option value="${v.lprod_gu}">${v.lprod_nm}</option>`;
				});
				
				$('#lpord').html(code);
				
			},
			error : function(xhr){
				alert("상태 : "+xhr.status);
			},
			dataType : 'json'
			
		})
	})
	
	//lprod의 결과 중 option 하나를 선택하면
	$(document).on('change', '#lpord', function(){
		//alert($('option:selected',this).val());
		
		vdata = $('option:selected',this).val();
		
		$.ajax({
			url: '<%=request.getContextPath()%>/ProdList.do',
			type: 'get',
			data: {"lgu": vdata},
			success: function(res){
				
				code="";
				
				if(res.sw=="ok"){
				
					$.each(res.datas, function(i,v){
							//res.datas[i].prod_id
							//===> v.prod_id
							code += `<option value="${v.prod_id}">${v.prod_name}</option>`;
							
					})
				}else{
					code += `<option value="0">데이터 없음</option>`;
					
				}	
					
					$('#prod').html(code);
			},
			error: function(xhr){
				alert("상태: "+xhr.status)
			},
			dataType: 'json'
			
		})

	})
	
	//prod list 결과 중 option하나를 선택하면
	$(document).on('change', '#prod', function(){
		
		//alert($('option:selected',this).val());
		vdata = $('option:selected',this).val();
		
		if(vdata == 0) return false;
		
		$.ajax({
			url : '<%=request.getContextPath()%>/ProdDetail.do', 	
			data : {"pid" : vdata},
			type : 'post',
			success: function(res){
			
				code = `<table border="1">`;
				code += `<tr><td>PROD_ID</td>`
				code += `<td> ${res.prod_id} </td></tr>`
				
				code += `<tr><td>PROD_NAME</td>`
				code += `<td> ${res.prod_name} </td></tr>`
				
				code += `<tr><td>PROD_LGU</td>`
				code += `<td> ${res.prod_lgu} </td></tr>`					
					
				code += `<tr><td>PROD_BUYER</td>`
				code += `<td> ${res.prod_buyer} </td></tr>`	
				
				code += `<tr><td>PROD_OUTLINE</td>`
				code += `<td> ${res.prod_outline} </td></tr>`
				
				code += `<tr><td>PROD_SIZE</td>`
				code += `<td> ${res.prod_size} </td></tr>`
				
				code += `<tr><td>PROD_COLOR</td>`
				code += `<td> ${res.prod_color} </td></tr>`
					
				code += `<tr><td>PROD_COST</td>`
				code += `<td> ${res.prod_cost} </td></tr>`
				
				code += `<tr><td>PROD_PRICE</td>`
				code += `<td> ${res.prod_price} </td></tr>`	
					
				code += `<tr><td>PROD_SALE</td>`
				code += `<td> ${res.prod_sale} </td></tr>`	
				
				
				
				code += `<tr><td>PROD_DETAIL</td>`
				code += `<td> ${res.prod_detail} </td></tr>`
						
				code += `</table>`;	
				
				$('#result1').html(code);
					
			},
			error : function(xhr){
				alert("상태: "+xhr.status);
			},
			dataType: 'json'
			
			
		})
		

	})	 

})	

</script>

<body>

	<input type="button" value="확인" id="btn1">
	<br>
	<br>
	<select id="lpord">
		<!-- 상단 script에서 btn1을 활성화 함으로써 select option 출력 -->
	</select>

	<select id="prod">
	</select>

	<div id="result1"></div>
	<br>
	<br>

</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 <meta name="viewport" content="width=device-width, initial-scale=1">

<script src="../js/jquery-3.7.1.min.js"></script>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<script>

mypath = "<%=request.getContextPath()%>";

$(function(){
	
	 //실행 하자마자 리스트 출력 - stype, sword 없는 상태
	 
	 vtype = $('#stype option:selected').val().trim();
	 vword = $('#sword').val().trim();
	 
	 console.olg(vtype, vword);
	 
	$.ajax({
		url : `${mypath}/BoardList.do`,
		type : 'post',
		data : {
				"page" : "1",
				"stype" : vtype,
				"sword" : vword
		},
		success : function(res){
			
			
		},
		error : fucntion(xhr){
			alert("상태 : "+xhr.status)
		},
		dataType : 'json'
		
	}) 
	
})
</script>


<style>
.card-body{
	display: flex;
	flex-direction: column;
}
p{
	border: 1px dotted gold;
	margin: 2px;
	padding: 3px;
}

.pp{
	display: flex;
	flex-direction: low;
}
.p1{
	flex: 70%;
}
.p2{
	flex: 30%;
}
nav{
	margin : 2%;
}
nav a{
	/* display: none; */  /* 영역까지 숨김 */
	visibility: hidden;  /* 영역을 가지고 있음 */
}


</style>

</head>
<body>
	<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="javascript:void(0)">Logo</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="mynavbar">
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link" href="javascript:void(0)">Link</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="javascript:void(0)">Link</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="javascript:void(0)">Link</a>
        </li>
      </ul>
      <form class="d-flex">
      
      	<select class="form-select" id="stype">
      		<option value="">전체</option>
      		<option value="writer">작성자</option>
      		<option value="subject">제목</option>
      		<option value="content">내용</option>
      		
      	</select>
      
        <input class="form-control me-2" id="sword" type="text" placeholder="Search">
        <button class="btn btn-primary" type="button">Search</button>
      </form>
    </div>
  </div>
</nav>

	<br><br>
	
	<div id="result"></div>
	<div id="pageList"></div>


</body>
</html>
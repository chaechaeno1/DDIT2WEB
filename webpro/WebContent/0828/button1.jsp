<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	table{
		border: 1px solid lightpink;
		margin: 20px auto;
		text-align: center;
	}
	.title{
		background: lightyellow;
		color: black;
		font-size:1.2rem;
		font-weight: bold;
	}
	td{
	width: 200px;
	height : 50px;
	text-align: center;		
	}
	h1{
	text-align: center;
	color: red;
	}
	
	
</style>

</head>
<body>
<h1>JSP : Java Server Page</h1>

<%
//클라이언트에서 전송된 데이터 가져오기
	request.setCharacterEncoding("UTF-8");
	
	String userId = request.getParameter("id");
	String userName = request.getParameter("name");
	String info = request.getParameter("area");
	
	//info에는 enter기호(\r\n)이 포함되어 있음 - \n을 <br>태그로 변환
	//\r 이 앞으로 한칸 가는 것
	
	//\r\n을 <br>태그로 변환
	info = info.replaceAll("\r\n", "<br>");
			
%>

<table border="1">
	<tr>
		<td class="title">아이디</td>
		<td><%=userId %></td>
	</tr>
	
	<tr>
		<td class="title">이름</td>
		<td><%=userName %></td>
	</tr>	
	
	<tr>
		<td class="title">자기소개</td>
		<td><%=info %></td>
	</tr>	


</table>

</body>
</html>
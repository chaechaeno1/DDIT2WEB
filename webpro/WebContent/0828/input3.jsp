<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>JSP : Java Server Page</h1>
<p>클라이언트 전송시 보내진 데이터를 가져온다.</p>

<%
	request.setCharacterEncoding("UTF-8");
	
	String userId = request.getParameter("id");
	String userName = request.getParameter("name");
	String userGender = request.getParameter("gender");
	String upfile = request.getParameter("file");
	
	String fr[] = request.getParameterValues("fruit");
	
	
	String str="";
	
	for(int i=0; i<fr.length; i++){
		str += fr[i]+"&nbsp;&nbsp;";
	}
	
/* 	for(String ff : fr){
		str += ff;
	} */
	
%>

<table border="1">
	<tr>
		<td>아이디</td>
		<td><%= userId %></td>
	</tr>	
	
	<tr>
		<td>이름</td>
		<td><%= userName %></td>
	</tr>	

	<tr>
		<td>파일</td>
		<td><%= upfile %></td>
	</tr>		
	
	<tr>
		<td>성별</td>
		<td><%= userGender %></td>
	</tr>	
	
	<tr>
		<td>과일</td>
		<td><%= str %></td>
	</tr>	

</table>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
p{
	border: 2px dotted red;
	padding: 20px;
}
</style>

</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");

	String userId = request.getParameter("id"); //사용가능
	String userPass = request.getParameter("pass");  //사용가능
	String userSel = request.getParameter("disSelect"); //사용불가능
	String userAge = request.getParameter("age");
	
	
%>

<p><%= userId %>님 환영합니다!</p>
<p><%= userPass %></p>
<p><%= userSel %></p>
<p><%= userAge %></p>


</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
h1{
	text-align: center;
	color: red;

}


</style>

</head>
<body>
<h1>JSP : Java Server Page</h1>

<%
	request.setCharacterEncoding("utf-8");

	String userAddr = request.getParameter("addr"); //readonly
	String userPass = request.getParameter("pass"); //disabled
	
	out.print("주소 : "+userAddr+"<br>");	
	out.print("PASS : "+userPass+"<br>");

%>

<%= userAddr%>
<%= userPass%>



</body>
</html>
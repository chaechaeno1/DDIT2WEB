<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
h1 {
	color: red;
	text-align: center;
}

table {
	border: 2px solid blue;
	margin: 20px auto;
}
/* td,th에서 height는 한군데만 지정해줘도됨 */
td {
	width: 300px;
	height: 50px;
	text-align: center;
}

th {
	width: 300px;
	background: lightpink;
}
</style>


</head>
<body>
	<h1>JSP : Java Server Page</h1>
	<!-- 선택문(select)이 있기 때문에  jsp에서 바로 실행하면 오류뜸-->
	<!-- HTTP Status 500 – Internal Server Error -->

	<%
		/* 한글깨짐 방지하기 위해 인코딩 설정 */
	request.setCharacterEncoding("utf-8");

	/* name : id, pass, bir, food */

	String userId = request.getParameter("id");
	String userPass = request.getParameter("pass");
	String userBir = request.getParameter("bir");
	String userFood = request.getParameter("food");

	String foodmulti[] = request.getParameterValues("foodmulti");

	String str = ""; /* for문에 쓰일 문자열 초기값 변수 설정 */

	/* for문을 안돌리면 주소값이 출력되므로 */
	/* for문만 있었을 때, 값이 선택되지 않은 상태에서 실행되면 NullPointerException 발생*/

	if (foodmulti != null && foodmulti.length > 0) { 
		//조건값이 순서가 뒤바뀌어도 오류남
		for (int i = 0; i < foodmulti.length; i++) {
			str += foodmulti[i] + "&nbsp;&nbsp;&nbsp;";
		}
	}
	%>

	<table border="1">
		<tr>
			<th>아이디</th>
			<td><%=userId%></td>
		</tr>

		<tr>
			<th>비밀번호</th>
			<td><%=userPass%></td>
		</tr>

		<tr>
			<th>생일</th>
			<td><%=userBir%></td>
		</tr>

		<tr>
			<th>좋아하는 음식</th>
			<td><%=userFood%></td>
		</tr>

		<tr>
			<th>좋아하는 음식들</th>
			<td><%=str%></td>
		</tr>

	</table>


</body>
</html>
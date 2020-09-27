<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en" dir="ltr">

<head>
<meta charset="UTF-8">
<title>Delphinium</title>
<link rel="stylesheet" href="style/member.css">
</head>
<body>
	<jsp:include page="../home/fixed.jsp" />

	<h2 align="center">JOIN MEMBER</h2>
	<hr width=40%>

	<br>

	<table class="consumer container"
		style="width: 40%; text-align: center;"
		onclick="javascript:location.href='orderList.do'">
		<tr>
			<td height="100px">👕</td>
		</tr>
		<tr>
			<th>주문내역</th>
		</tr>
	</table>
	<br>
	<br>
	<table class="marketer container"
		style="width: 40%; text-align: center;"
		onclick="javascript:location.href='memberEditForm.do'">
		<tr>
			<td height="100px">📝</td>
		</tr>
		<tr>
			<th>정보수정</th>
		</tr>
	</table>

	<br>
	<hr width=40%>

	<br>
	<br>
	<br>
	<br>


</body>

</html>
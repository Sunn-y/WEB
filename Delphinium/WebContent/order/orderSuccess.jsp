<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
<meta charset="UTF-8">
<title>Delphinium</title>
<link rel="stylesheet" href="style/member.css">
</head>

<body>
	<jsp:include page="../home/fixed.jsp" />

	<h2 align="center">ORDER</h2>
	<hr width=40%>

	<div class="textBox container" align="center">
		${loginUser}님<br> 주문이 완료되었습니다.

	</div>

	<hr width=40%>
	<table class="container" style="width: 40%">
		<tr>
			<td align="center"><input type="button" name="mainBTN"
				id="mainBTN" value="주문목록"
				onclick="javascript:location.href='orderList.do'"></td>
		</tr>
	</table>
	<br>
	<br>
	<br>
	<br>

</body>

</html>

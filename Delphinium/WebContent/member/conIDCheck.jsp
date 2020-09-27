<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
<meta charset="UTF-8">
<title>Delphinium</title>
<link rel="stylesheet" href="style/member.css">
<script type="text/javascript" src="script/memberCheck.js"></script>
</head>

<body>
	<%
		String decodeID = URLDecoder.decode(request.getParameter("userID"), "UTF-8");
	%>
	<form action="conIDCheck.do" name="idCheckForm" method="post">
		<table class="idCheckBox container">
			<tr>
				<td style="text-align: center; margin: 0; padding: 0;"><img
					src="img/blue_flower.png" alt="blue_flower.png" width=10%></td>
			</tr>
			<tr>
				<th style="font-size: 1.5em;" style="margin-top:0;">아이디<br></th>
			</tr>
			<tr>
				<td><input type="text" name="userID" id="userIDCheck"
					value="<%=decodeID%>"> <input type="submit" value="중복체크"
					id="idCheckBTN"> <br></td>
			</tr>

			<tr>
				<td><c:if test="${result == 1}">
						<script type="text/javascript">
							opener.document.idCheckForm.userID.value == "";
						</script>
						<%=decodeID%>는 이미 사용중인 아이디입니다.
		</c:if> <c:if test="${result == -1}">
						<script type="text/javascript">
							opener.document.idCheckForm.userID.value == "";
						</script>
						<%=decodeID%>는 사용 가능한 아이디입니다.
			<input type="button" value="사용" id="idOKBTN" class="cancel"
							onclick="return conIDOK()">
					</c:if></td>
			</tr>
		</table>
	</form>

</body>

</html>
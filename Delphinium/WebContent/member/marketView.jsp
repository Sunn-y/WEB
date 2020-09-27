<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
<meta charset="UTF-8">
<title>Delphinium</title>
<link rel="stylesheet" href="style/member.css">
</head>

<body>
	<jsp:include page="../home/fixed.jsp" />

	<h2 align="center">MARKET INFORMATION</h2>
	<hr width=40%>

	<table class="marketView container" style="width: 40%">
		<tr>
			<th>회사명</th>
			<td>${mVo.CName}</td>
		</tr>
		<tr>
			<th>대표자명</th>
			<td>${mVo.name}</td>
		</tr>
		<tr>
			<th>연락처</th>
			<td>${mVo.phone}</td>
		</tr>
		<tr>
			<th>홈페이지/SNS</th>
			<td><a href='${mVo.SNS}'>${mVo.SNS}</a></td>
		</tr>
		<tr>
			<th style="border: none;" height="20">주소</th>
			<td style="border: none;">${mVo.address}</td>
		</tr>
	</table>
	<hr width=40%>
	<br>
	<br>
	<br>
	<br>
</body>
</html>
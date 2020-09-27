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

	<h2 align="center">MEMBER's INFORMATION</h2>
	<hr width=40%>

	<table class="memberView container" style="width: 40%">
		<tr>
			<th width=40%><c:if test="${mVo.userLevel == 0}">아이디</c:if> <c:if
					test="${mVo.userLevel == 1}">아이디</c:if> <c:if
					test="${mVo.userLevel == 2}">사업자등록번호</c:if></th>
			<td>${mVo.userID}</td>
		</tr>
		<c:if test="${mVo.userLevel == 2}">
			<tr>
				<th>회사명</th>
				<td>${mVo.CName}</td>
			</tr>
		</c:if>
		<tr>
			<th><c:if test="${mVo.userLevel == 0}">이름</c:if> <c:if
					test="${mVo.userLevel == 1}">이름</c:if> <c:if
					test="${mVo.userLevel == 2}">대표자명</c:if></th>
			<td>${mVo.name}</td>
		</tr>
		<c:if test="${mVo.userLevel == 1}">
			<tr>
				<th>생년월일</th>
				<td>${mVo.birth}</td>
			</tr>
			<tr>
				<th height="30">성별</th>
				<td><c:choose>
						<c:when test="${mVo.gender == 1}">여성</c:when>
						<c:when test="${mVo.gender == 2}">남성</c:when>
					</c:choose></td>
			</tr>
		</c:if>
		<tr>
			<th>연락처</th>
			<td>${mVo.phone}</td>
		</tr>
		<c:if test="${mVo.userLevel == 2}">
			<tr>
				<th>홈페이지/SNS</th>
				<td><a href="${mVo.SNS}">${mVo.SNS}</a></td>
			</tr>
		</c:if>
		<c:if test="${mVo.userLevel == 1}">
			<tr>
				<th>주소</th>
				<td>${mVo.address}</td>
			</tr>
		</c:if>
		<c:if test="${mVo.userLevel == 2}">
			<tr>
				<th style="border: none;" height="20">주소</th>
				<td style="border: none;">${mVo.address}</td>
			</tr>
		</c:if>
		<c:if test="${mVo.userLevel == 1}">
			<tr>
				<th style="border: none;" height="20">이벤트 정보</th>
				<td style="border: none;"><c:choose>
						<c:when test="${mVo.event == 1}">수신</c:when>
						<c:when test="${mVo.event == 2}">수신 거부</c:when>
					</c:choose></td>
			</tr>
		</c:if>
	</table>
	<hr width=40%>
	<table class="container" style="width: 40%;">
		<tr>
			<td style="border: none; text-align: right;">
				<button class="BTN"
					onclick="javascript:location.href='memberList.do'">목록으로</button>
			</td>
		</tr>
	</table>
	<br>
	<br>
	<br>
	<br>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
<meta charset="UTF-8">
<title>Delphinium</title>
<link rel="stylesheet" href="style/member.css">
</head>

<body>
	<jsp:include page="../home/fixed.jsp" />

	<h2 align="center">MEMBER LIST</h2>

	<hr width=40%>
	<br>
	<table class="memberList container" style="width: 40%">
		<tr>
			<th>Date</th>
			<th>Level</th>
			<th>ID</th>
			<th>Name</th>
			<th>Gender</th>
			<th>Phone</th>
		</tr>
		<c:forEach items="${mVoList}" var="mVo">
			<tr>
				<td><fmt:formatDate value="${mVo.regiDate}" /></td>
				<td><c:choose>
						<c:when test="${mVo.userLevel==0}">관리자</c:when>
						<c:when test="${mVo.userLevel==1}">일반</c:when>
						<c:when test="${mVo.userLevel==2}">기업</c:when>
					</c:choose></td>
				<td style="cursor: pointer;"
					onclick="javascript:location.href='memberView.do?userID=${mVo.userID}'">${mVo.userID}</td>
				<td style="cursor: pointer;"
					onclick="javascript:location.href='memberView.do?userID=${mVo.userID}'">${mVo.name}</td>
				<td><c:choose>
						<c:when test="${mVo.userLevel==2}">-</c:when>
						<c:when test="${mVo.gender==1}">여</c:when>
						<c:when test="${mVo.gender==2}">남</c:when>
					</c:choose></td>
				<td>${mVo.phone}</td>
			</tr>
		</c:forEach>
	</table>
	<form name="memberSearchForm" action="memberSearch.do">
		<table class="container search" style="width: 40%">
			<tr>
				<td><select id="searchOption" name="where">
						<option value="userLevel">구분</option>
						<option value="userID">아이디</option>
						<option value="name">이름</option>
				</select> <input type="text" name="query" id="memberSearchTB"
					placeholder="   search"> <input type="submit"
					id="memberSearchBTN" value="🔍"></td>
			</tr>
		</table>
	</form>
	<br>
	<br>
	<br>
	<br>

</body>

</html>
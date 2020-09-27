<%@page import="com.delphinium.dto.MerchandiseVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Delphinium</title>
<link rel="stylesheet" href="style/md.css">
</head>
<body>
	<jsp:include page="../home/fixed.jsp" />

	<h2 align="center">SEARCH RESULTS</h2>

	<hr width=60%>
	<br>
	<c:if test="${empty mdVoQueryList}">
		<table class="container" style="width: 60%; text-align: center;">
			<tr>
				<td>검색어에 대한 내용을 찾을 수 없습니다.</td>
			</tr>
		</table>
	</c:if>
	<div class='container' style="width: 60%">
		<c:if test="${not empty mdVoQueryList}">
			<c:forEach items="${mdVoQueryList}" var="mdVo">

				<table class="MDList"
					style="width: 30%; font-size: 10px; text-align: left;"
					onclick="javascript:location.href='detail.do?md_num=${mdVo.md_num}'">
					<tr>
						<td style="text-align: center;"><img src="${mdVo.md_sim_pic}"
							style="width: 200px; height: 250px;"></td>
					</tr>
					<tr>
						<td><strong>${mdVo.md_name}</strong></td>
					</tr>
					<tr>
						<td>${mdVo.md_price}원</td>
					</tr>
					<tr>
						<td style="font-size: 0.8em; color: gray;">${mdVo.md_sim_info}</td>
					</tr>
				</table>
			</c:forEach>
		</c:if>
	</div>
	<br>
	<br>
	<br>
	<br>
</body>
</html>
<%@page import="com.delphinium.dto.PageVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Delphinium</title>
<link rel="stylesheet" href="style/md.css">
</head>
<body>
	<jsp:include page="../home/fixed.jsp" />

	<h2 align="center">REGISTERED MERCHANDISE</h2>

	<hr width=60%>
	<br>
	<table class="marMDList container" style="width: 60%;">
		<tr>
			<th>MD_PIC</th>
			<th>MD_NAME</th>
			<th>MD_NUM</th>
			<th>MD_DATE</th>
		</tr>
		<c:if test="${empty mdVoQueryList}">
			<tr>
				<td colspan="4" align="center">검색하신 상품이 존재하지 않습니다.</td>
			</tr>
		</c:if>
		<c:if test="${not empty mdVoQueryList}">
			<c:forEach items="${mdVoQueryList}" var="mdVo">
				<tr style="cursor: pointer;"
					onclick="javascipt:location.href='MDEdit.do?md_num=${mdVo.md_num}'">
					<td width=20%><img src="${mdVo.md_sim_pic}" width=100%></td>
					<td>${mdVo.md_name}</td>
					<td>${mdVo.md_num}</td>
					<td><fmt:formatDate value="${mdVo.md_date}" /></td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	<table class="container search" style="width: 60%">
		<tr>
			<td>
				<button class="BTN"
					onclick="javascript:location.href='marMDList.do'">목록으로</button>
			</td>
		</tr>
	</table>
	<br>
	<br>
	<br>
	<br>
</body>
</html>
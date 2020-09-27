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
	<h2 align="center">${md_cate}</h2>

	<hr width=80%>
	<br>
	<c:if test="${empty mdVoList}">
		<table class="container" style="width: 90%; text-align: center">
			<tr>
				<td>등록된 상품이 없습니다.</td>
			</tr>
		</table>
	</c:if>
	<div class='container' style="width: 90%">
		<c:if test="${not empty mdVoList}">
			<c:forEach items="${mdVoList}" var="mdVo">

				<table class="MDList"
					onclick="javascript:location.href='detail.do?md_num=${mdVo.md_num}'">
					<tr>
						<th style="text-align: center;"><img src="${mdVo.md_sim_pic}"
							style="width: 300px; height: 300px;"><br></th>
					</tr>
					<tr>
						<td><strong><br>${mdVo.md_name}</strong></td>
					</tr>
					<tr>
						<td align="right">${mdVo.cname}</td>
					</tr>
					<tr>
						<td>${mdVo.md_price}</td>
					</tr>
					<tr>
						<td style="font-size: 0.8em; color: gray;">${mdVo.md_sim_info}</td>
					</tr>
				</table>
			</c:forEach>
		</c:if>
	</div>
	<div class="clear"></div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

</body>
</html>
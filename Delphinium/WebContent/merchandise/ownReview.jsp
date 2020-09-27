<%@page import="com.delphinium.dto.PageVO"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="com.delphinium.dto.MerchandiseVO"%>
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
<script type="text/javascript" src="script/mdCheck.js"></script>
</head>
<body>
	<jsp:include page="../home/fixed.jsp" />

	<h2>REVIEW</h2>
	<hr width=40%>
	<c:if test="${empty rVoList}">
		<table class="container" style="width: 40%">
			<tr>
				<td align="center">리뷰를 작성해 주세요.</td>
			</tr>
		</table>
	</c:if>
	<c:if test="${not empty rVoList}">
		<c:forEach items="${rVoList}" var="rVo">
			<table id="review" class="container"
				style="width: 40%; background: aliceblue; margin-top: 30px; padding: 15px;">

				<tr>
					<th align="left" width=50%>${rVo.userID}님&nbsp;&nbsp;&nbsp;&nbsp;<span
						style="color: #0F4c81;"> <c:if test="${rVo.rv_md_star==1}">★☆☆☆☆</c:if>
							<c:if test="${rVo.rv_md_star==2}">★★☆☆☆</c:if> <c:if
								test="${rVo.rv_md_star==3}">★★★☆☆</c:if> <c:if
								test="${rVo.rv_md_star==4}">★★★★☆</c:if> <c:if
								test="${rVo.rv_md_star==5}">★★★★★</c:if></span>
					</th>
					<th align="right"><fmt:formatDate value="${rVo.rv_date}" />&nbsp;&nbsp;
						<button
							onclick="javascript:location.href='reviewEditForm.do?md_num=${rVo.md_num}&rv_num=${rVo.rv_num}'"
							class="BTN">✎</button>&nbsp;&nbsp;
						<button
							onclick="javascript:location.href='reviewDelete.do?md_num=${rVo.md_num}&rv_num=${rVo.rv_num}'"
							class="BTN">✖</button></th>
				</tr>
				<tr>
					<td align="left" colspan="2">${rVo.rv_content}</td>
				</tr>
			</table>
		</c:forEach>
	</c:if>
	<br>
	<hr width=40%>
	<table class="container" style="width: 40%; text-align: center;">
		<tr>
			<td style="border: none; text-align: right;">
				<button class="BTN"
					onclick="javascript:location.href='reviewWriteForm.do?md_num=${md_num}'">
					리뷰작성</button>&nbsp;&nbsp;&nbsp;&nbsp;
				<button class="BTN"
					onclick="javascript:location.href='orderList.do?'">주문내역</button>
			</td>
		</tr>
	</table>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
</body>
</html>
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
	<h2>Q &amp; A</h2>
	<hr width=40%>
	<c:if test="${empty qVoList}">
		<table class="container" style="width: 40%">
			<tr>
				<td align="center">작성한 Q &amp; A 가 없습니다.</td>
			</tr>
		</table>
	</c:if>
	<c:if test="${not empty qVoList}">
		<c:forEach items="${qVoList}" var="qVo">
			<table id="review" class="container"
				style="width: 40%; text-align: left; background: aliceblue; margin-top: 30px; padding: 15px;">
				<tr>
					<td style="border: none; margin: none;">${qVo.userID}님</td>
					<th align="right" style="border: none; padding: none;"><fmt:formatDate
							value="${qVo.qa_date}" /> &nbsp;&nbsp;
						<button
							onclick="javascript:location.href='qnaEditForm.do?md_num=${qVo.md_num}&qa_num=${qVo.qa_num}'"
							class="BTN">✎</button>&nbsp;&nbsp;
						<button
							onclick="javascript:location.href='qnaDelete.do?md_num=${qVo.md_num}&qa_num=${qVo.qa_num}'"
							class="BTN">✖</button></th>
				</tr>
				<tr>
					<td colspan="2"><strong>Q. ${qVo.qa_title}</strong><br> <br>
						&nbsp;&nbsp; &nbsp;&nbsp;${qVo.qa_content}</td>
				</tr>
				<tr>
					<td colspan="2" align="center">${qVo.qa_ans}</td>
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
					onclick="javascript:location.href='qnaWriteForm.do?md_num=${md_num}'">Q
					&amp; A 작성</button>&nbsp;&nbsp;&nbsp;&nbsp;
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
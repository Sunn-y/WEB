<%@page import="com.delphinium.dto.PageVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
<meta charset="UTF-8">
<title>Delphinium</title>
<link rel="stylesheet" href="style/board.css">
<script type="text/javascript" src="script/memberCheck.js"></script>
</head>

<body>
	<jsp:include page="../home/fixed.jsp" />

	<h2 align="center">PROMOTION</h2>

	<table class="container promotion"
		style="width: 60%; text-align: center;">
		<tr>
			<th>No</th>
			<th>Title</th>
			<th>Date</th>
		</tr>
		<c:choose>
			<c:when test="${empty proVoList}">
				<tr>
					<td colspan="3" style="text-align: center;">등록된 게시물이 없습니다.</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${proVoList}" var="proVo">
					<tr>
						<td>${proVo.b_num}</td>
						<td style="cursor: pointer;"
							onclick="javascript:location.href='promotionView.do?b_num=${proVo.b_num}'">${proVo.b_title}</td>
						<td><fmt:formatDate value="${proVo.b_date}" /></td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<tr>
			<td colspan="3"
				style="border-top: 3px solid #0F4C81; border-bottom: none;"><br>
				<%
					PageVO pVo = (PageVO) request.getAttribute("pVo");
				int startPage = pVo.getStartPage();
				int endPage = pVo.getEndPage();
				int pageCount = pVo.getPageCount();
				int pageBlock = pVo.getPageBlock();

				if (endPage > pageCount) {
					endPage = pageCount;
				}
				if (startPage > pageBlock) {
					out.print("<a style='text-decoration: none;' href='promotionList.do?pageNum=" + (startPage - pageBlock)
					+ "'>&lt;</a>&nbsp;&nbsp;");
				}
				for (int i = startPage; i <= endPage; i++) {
					out.print("<a style='text-decoration: none;' href='promotionList.do?pageNum=" + i + "'>&nbsp;&nbsp; " + i
					+ "&nbsp;&nbsp; </a>");
				}
				if (endPage < pageCount) {
					out.print("&nbsp;&nbsp;<a style='text-decoration: none;' href='promotionList.do?pageNum=" + (startPage + pageBlock)
					+ "'>&gt;</a>");
				}
				%></td>
		</tr>
		<c:if test="${userLevel==0}">
			<tr>
				<td colspan="3" style="border: none;"><br>
					<button id="promotionWriteBTN"
						onclick="javascript:location.href='promotionWriteForm.do'">글쓰기</button></td>
			</tr>
		</c:if>
	</table>
	<br>
	<br>
	<br>
	<br>

</body>

</html>
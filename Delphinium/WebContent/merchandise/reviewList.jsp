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
	<c:if test="${not empty rVoList}">
		<c:forEach items="${rVoList}" var="rVo">
			<table id="review" class="container"
				style="width: 40%; background: aliceblue; margin-top: 30px; padding: 15px;">
				<tr>
					<th align="left" width=70%>${rVo.userID}님&nbsp;&nbsp;&nbsp;&nbsp;<span
						style="color: #0F4c81;"> <c:if test="${rVo.rv_md_star==1}">★☆☆☆☆</c:if>
							<c:if test="${rVo.rv_md_star==2}">★★☆☆☆</c:if> <c:if
								test="${rVo.rv_md_star==3}">★★★☆☆</c:if> <c:if
								test="${rVo.rv_md_star==4}">★★★★☆</c:if> <c:if
								test="${rVo.rv_md_star==5}">★★★★★</c:if></span>
					</th>
					<th align="right"><fmt:formatDate value="${rVo.rv_date}" /></th>
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
					onclick="javascript:location.href='detail.do?md_num=${md_num}'">상품페이지로</button>
			</td>
		</tr>
		<tr>
			<td>
				<%
					PageVO pVo = (PageVO) request.getAttribute("pVo");
				int startPage = pVo.getStartPage();
				int endPage = pVo.getEndPage();
				int pageCount = pVo.getPageCount();
				int pageBlock = pVo.getPageBlock();
				String md_num = request.getParameter("md_num");

				if (endPage > pageCount) {
					endPage = pageCount;
				}
				if (startPage > pageBlock) {
					out.print("<a style='text-decoration: none;' href='reviewList.do?md_num=" + md_num + "&pageNum="
					+ (startPage - pageBlock) + "'>&lt;</a>&nbsp;&nbsp;");
				}
				for (int i = startPage; i <= endPage; i++) {
					out.print("<a style='text-decoration: none;' href='reviewList.do?md_num=" + md_num + "&pageNum=" + i
					+ "'>&nbsp;&nbsp; " + i + "&nbsp;&nbsp; </a>");
				}
				if (endPage < pageCount) {
					out.print("&nbsp;&nbsp;<a style='text-decoration: none;' href='reviewList.do?md_num=" + md_num + "&pageNum="
					+ (startPage + pageBlock) + "'>&gt;</a>");
				}
				%>
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
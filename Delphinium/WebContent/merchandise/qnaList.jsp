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
		<table id="review" class="container" style="width: 40%">
			<tr>
				<td colspan="2" align="center">등록된 Q&amp;A가 아직 없습니다.</td>
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
							value="${qVo.qa_date}" /> <c:if test="${loginUser == marketer}">&nbsp;&nbsp;
							<button class="BTN"
								onclick="javascript:location.href='qnaEditForm.do?md_num=${qVo.md_num}&qa_num=${qVo.qa_num}&userID=${qVo.userID}&userLevel=${userLevel}'">
								답변작성</button>
						</c:if></th>
				</tr>
				<tr>
					<td colspan="2"><strong>Q. ${qVo.qa_title}</strong><br> <br>
						&nbsp;&nbsp; &nbsp;&nbsp;${qVo.qa_content}</td>
				</tr>
				<tr>
					<c:choose>
						<c:when test="${qVo.qa_ans =='답변이 아직 등록되지 않았습니다.'}">
							<td colspan="2" align="center">${qVo.qa_ans}</td>
						</c:when>
						<c:otherwise>
							<td colspan="2">A. ${qVo.qa_ans}</td>
						</c:otherwise>
					</c:choose>
				</tr>
			</table>
		</c:forEach>
	</c:if>
	<br>
	<hr width=40%>
	<table class="container" style="width: 40%; text-align: center;">
		<tr>
			<td style="border: none; text-align: right;"><c:if
					test="${userLevel == 1 }">
					<button class="BTN"
						onclick="javascript:location.href='detail.do?md_num=${md_num}'">상품페이지
					</button>
				</c:if> <c:if test="${userLevel == 2 }">
					<button class="BTN"
						onclick="javascript:location.href='marMDList.do'">상품목록</button>
				</c:if></td>
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
					out.print("<a style='text-decoration: none;' href='qaList.do?md_num=" + md_num + "&pageNum="
					+ (startPage - pageBlock) + "'>&lt;</a>&nbsp;&nbsp;");
				}
				for (int i = startPage; i <= endPage; i++) {
					out.print("<a style='text-decoration: none;' href='qaList.do?md_num=" + md_num + "&pageNum=" + i + "'>&nbsp;&nbsp; "
					+ i + "&nbsp;&nbsp; </a>");
				}
				if (endPage < pageCount) {
					out.print("&nbsp;&nbsp;<a style='text-decoration: none;' href='qaList.do?md_num=" + md_num + "&pageNum="
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
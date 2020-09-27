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
			<th>MANAGEMENT</th>
		</tr>
		<c:if test="${empty mdVoList}">
			<tr>
				<td colspan="5" align="center">아직 등록하신 상품이 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${not empty mdVoList}">
			<c:forEach items="${mdVoList}" var="mdVo">
				<tr>
					<td width=20%><img src="${mdVo.md_sim_pic}" width=100%></td>
					<td class="order" style="cursor: pointer;"
						onclick="javascipt:location.href='MDEditForm.do?md_num=${mdVo.md_num}'">${mdVo.md_name}</td>
					<td>${mdVo.md_num}</td>
					<td><fmt:formatDate value="${mdVo.md_date}" /></td>
					<td><button class="BTN"
							onclick="javascript:location.href='qaList.do?md_num=${mdVo.md_num}'">
							&nbsp;&nbsp;Q &amp; A&nbsp;&nbsp;</button>
						<br>
					<br>
						<button class="BTN"
							onclick="javascript:location.href='detail.do?md_num=${mdVo.md_num}'">상세페이지</button></td>
				</tr>
			</c:forEach>
		</c:if>
		<tr>
			<td colspan="5" style="border: none; text-align: center;"><br>
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
					out.print("<a style='text-decoration: none;' href='marMDList.do?pageNum=" + (startPage - pageBlock)
					+ "'>&lt;</a>&nbsp;&nbsp;");
				}
				for (int i = startPage; i <= endPage; i++) {
					out.print("<a style='text-decoration: none;' href='marMDList.do?pageNum=" + i + "'>&nbsp;&nbsp; " + i
					+ "&nbsp;&nbsp; </a>");
				}
				if (endPage < pageCount) {
					out.print("&nbsp;&nbsp;<a style='text-decoration: none;' href='marMDList.do?pageNum=" + (startPage + pageBlock)
					+ "'>&gt;</a>");
				}
				%></td>
		</tr>
	</table>
	<table class="container search" style="width: 60%">
		<tr>
			<td>
				<form name="search" action="marMDSearch.do">
					<select name="where">
						<option value="md_name">상품명</option>
						<option value="md_num">상품번호</option>
					</select> <input type="text" name="query" id="searchTB"
						placeholder="   search"> <input type="submit"
						id="searchBTN" value="🔍">
				</form>
			</td>
		</tr>
	</table>
	<br>
	<br>
	<br>
	<br>
</body>
</html>
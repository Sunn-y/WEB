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
	<h2 align="center">ORDER LIST</h2>

	<hr width=60%>
	<br>
	<table class="orderList container" style="width: 60%">
		<tr>
			<th>주문일자</th>
			<th>사진</th>
			<th>상품명</th>
			<th>수량</th>
			<th>총 가격</th>
			<th>판매처</th>
			<th>바로가기</th>
		</tr>
		<c:if test="${empty oVoList}">
			<tr>
				<td colspan="7" align="center">주문하신 상품이 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${not empty oVoList}">
			<c:forEach items="${oVoList}" var="oVo">
				<tr>
					<td><fmt:formatDate value="${oVo.od_date}" /></td>
					<td><img src="${oVo.md_sim_pic}" width="100"></td>
					<td class="order" style="cursor: pointer"
						onclick="javascript:location.href='orderView.do?od_num=${oVo.od_num}'">${oVo.md_name}</td>
					<td>${oVo.qty}</td>
					<td>${oVo.md_price}</td>
					<td>${oVo.cname}</td>
					<td><button class="BTN"
							onclick="javascript:location.href='ownQnAView.do?md_num=${oVo.md_num}'">
							&nbsp;&nbsp;Q &amp; A&nbsp;&nbsp;</button> <br> <br>
						<button class="BTN"
							onclick="javascript:location.href='ownReview.do?md_num=${oVo.md_num}'">
							&nbsp;REVIEW&nbsp;</button></td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	<form name="search" action="orderSearch.do">
		<table class="container search" style="width: 60%">
			<tr>
				<td>상품명 : <input type="text" name="query" id="ODSearchTB"
					placeholder="   search"> <input type="submit"
					id="ODSearchBTN" value="🔍"></td>
			</tr>
		</table>
	</form>
	<table class="orderList container" style="width: 60%">
		<tr>
			<td colspan="6" style="border: none;"><br> <%
 	PageVO pVo = (PageVO) request.getAttribute("pVo");
 int startPage = pVo.getStartPage();
 int endPage = pVo.getEndPage();
 int pageCount = pVo.getPageCount();
 int pageBlock = pVo.getPageBlock();

 if (endPage > pageCount) {
 	endPage = pageCount;
 }
 if (startPage > pageBlock) {
 	out.print("<a style='text-decoration: none;' href='orderList.do?pageNum=" + (startPage - pageBlock)
 	+ "'>&lt;</a>&nbsp;&nbsp;");
 }
 for (int i = startPage; i <= endPage; i++) {
 	out.print("<a style='text-decoration: none;' href='orderList.do?pageNum=" + i + "'>&nbsp;&nbsp; " + i
 	+ "&nbsp;&nbsp; </a>");
 }
 if (endPage < pageCount) {
 	out.print("&nbsp;&nbsp;<a style='text-decoration: none;' href='orderList.do?pageNum=" + (startPage + pageBlock)
 	+ "'>&gt;</a>");
 }
 %></td>
		</tr>
	</table>
	<br>
	<br>
	<br>
	<br>
</body>
</html>
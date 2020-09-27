<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delphinium</title>
<link rel="stylesheet" href="style/board.css">
</head>
<body>
	<jsp:include page="../home/fixed.jsp" />
	<h2 align="center">PROMOTION</h2>
	<table class="container promotionView" style="width: 60%">
		<tr>
			<th style="text-align: left;">${bVo.b_title}</th>
			<th style="text-align: right;"><fmt:formatDate
					value="${bVo.b_date}" /></th>
		</tr>
		<tr>
			<td colspan="2"
				style="border: 1px solid #of4c81; padding-left: 120px;">
				${bVo.b_content}</td>
		</tr>
		<c:if test="${bVo.b_pic1 != '사진없음'}">
			<tr>
				<td align="center" colspan="2"><img src="${bVo.b_pic1}"
					width=100%></td>
			</tr>
		</c:if>
		<c:if test="${bVo.b_pic2 != '사진없음'}">
			<tr>
				<td align="center" colspan="2"><img src="${bVo.b_pic2}"
					width=100%></td>
			</tr>
		</c:if>
		<c:if test="${bVo.b_pic3  != '사진없음'}">
			<tr>
				<td align="center" colspan="2"><img src="${bVo.b_pic3}"
					width=100%></td>
			</tr>
		</c:if>
		<tr>
			<td colspan="2"
				style="border-top: 3px solid #0F4C81; border-bottom: none; text-align: center;">
				<button id="promotionListBTN2"
					onclick="javascript:location.href='promotionList.do'">목록으로</button>
			</td>
		</tr>
	</table>
	<c:if test="${userLevel==0}">
		<table class="container" style="width: 60%">
			<tr>
				<td colspan="2" style="text-align: center;">
					<button id="promotionEditBTN"
						onclick="javascript:location.href='promotionEditForm.do?b_num=${bVo.b_num}'">수정하기</button>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<button id="promotionDeleteBTN"
						onclick="javascript:location.href='promotionDelete.do?b_num=${bVo.b_num}'">삭제하기</button>
				</td>
			</tr>
		</table>
	</c:if>
	<br>
	<br>
	<br>
	<br>
</body>
</html>
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
	<h2 align="center">NOTICE</h2>
	<table class="container noticeView" style="width: 40%">
		<tr>
			<th style="text-align: left;">${bVo.b_title}</th>
			<th style="text-align: right;"><fmt:formatDate
					value="${bVo.b_date}" /></th>
		</tr>
		<tr>
			<td colspan="2" style="border: 1px solid #of4c81;">
				${bVo.b_content}</td>
		</tr>
		<tr>
			<td colspan="2"
				style="border-top: 3px solid #0F4C81; border-bottom: none; text-align: center;">
				<button id="noticeListBTN2"
					onclick="javascript:location.href='noticeList.do'">목록으로</button>
			</td>
		</tr>
	</table>
	<br>
	<br>
	<br>
	<c:if test="${userLevel==0}">
		<table class="container" style="width: 40%">
			<tr>
				<td colspan="2" style="text-align: center;">
					<button id="noticeEditBTN"
						onclick="javascript:location.href='noticeEditForm.do?b_num=${bVo.b_num}'">수정하기</button>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<button id="noticeDeleteBTN"
						onclick="javascript:location.href='noticeDelete.do?b_num=${bVo.b_num}'">삭제하기</button>
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
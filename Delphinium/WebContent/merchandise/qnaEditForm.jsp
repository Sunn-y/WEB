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
	<form name="qaForm" action="qnaEdit.do" method="post">
		<input type="hidden" name="md_num" value="${md_num}"> <input
			type="hidden" name="userID" value="${qVo.userID}"> <input
			type="hidden" name="userLevel" value="${userLevel}"><input
			type="hidden" name="qa_num" value="${qa_num}">
		<c:if test="${userLevel == 1}">
			<table id="QATable" class="container" style="width: 40%">
				<tr>
					<td><input type="text" name="qa_title" style="width: 100%;"
						value="${qVo.qa_title}"></td>
				</tr>
				<tr>
					<td><textarea name="qa_content"
							style="width: 100%; height: 100px;">${qVo.qa_content}</textarea></td>
				</tr>
			</table>
			<table class="container" style="width: 40%">
				<tr>
					<td align="right"><input type="submit" value="수정하기"
						class="BTN" onclick="return qaCheck()"></td>
				</tr>
			</table>
		</c:if>
		<c:if test="${userLevel == 2}">
			<table id="QATable" class="container" style="width: 40%">
				<tr>
					<td><input type="text" name="qa_title" style="width: 100%;"
						value="${qVo.qa_title}" readonly="readonly"></td>
				</tr>
				<tr>
					<td><textarea name="qa_content"
							style="width: 100%; height: 100px;" readonly="readonly">${qVo.qa_content}</textarea></td>
				</tr>
				<tr>
					<td><textarea name="qa_ans"
							style="width: 100%; height: 100px;" placeholder="답변을 등록해 주세요"></textarea></td>
				</tr>
			</table>
			<table class="container" style="width: 40%">
				<tr>
					<td align="right"><input type="submit" value="등록하기"
						class="BTN" onclick="return qaCheck()"></td>
				</tr>
			</table>
		</c:if>
	</form>
	<br>
	<hr width=40%>
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
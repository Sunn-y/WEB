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
	<form name="reviewForm" action="reviewWrite.do" method="post">
		<input type="hidden" name="md_num" value="${md_num}">
		<table id="reviewTable" class="container" style="width: 40%">
			<tr>
				<td><label for="rv_md_star">평가 : </label> <input type="range"
					name="rv_md_star" min="0" max="5"></td>
			</tr>
			<tr>
				<td><textarea name="rv_content"
						style="width: 100%; height: 100px;" placeholder="리뷰를 입력해 주세요."></textarea>
				</td>
			</tr>
		</table>
		<table class="container" style="width: 40%">
			<tr>
				<td align="right"><input type="submit" value="작성완료" class="BTN"
					onclick="return reviewCheck()"></td>
			</tr>
		</table>
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
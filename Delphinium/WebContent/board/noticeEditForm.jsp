<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

	<form name="noticeEditForm" action="noticeEdit.do" method="post">
		<input type="hidden" name="b_num" value="${bVo.b_num}">
		<table class="container noticeEdit" style="width: 40%">
			<tr>
				<td><input type="text" name="b_title" id="b_title"
					value="${bVo.b_title}"></td>
			</tr>
			<tr>
				<td><textarea id="b_content" name="b_content">${bVo.b_content}</textarea></td>
			</tr>
			<tr>
				<td align=center><input type="submit" id="noticeEditBTN"
					value="수정하기">&nbsp;&nbsp;&nbsp;&nbsp; <input type="reset"
					id="noticeEditBTN" value="다시작성"></td>
			</tr>
		</table>
	</form>
	<br>
	<br>
	<br>
	<br>
</body>
</html>
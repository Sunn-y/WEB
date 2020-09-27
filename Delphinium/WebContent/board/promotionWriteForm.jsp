<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delphinium</title>
<link rel="stylesheet" href="style/board.css">
<script type="text/javascript" src="script/boardCheck.js"></script>
</head>
<body>
	<jsp:include page="../home/fixed.jsp" />
	<h2 align="center">PROMOTION</h2>
	<form name="promotionWriteForm" action="promotionWrite.do"
		method="post" enctype="multipart/form-data">
		<table class="container promotionWrite" style="width: 40%">
			<tr>
				<td><input type="text" name="b_title" id="b_title"
					placeholder="  글 제목"></td>
			</tr>
			<tr>
				<td><textarea id="b_content" name="b_content"
						placeholder="  글 내용"></textarea></td>
			</tr>
			<tr>
				<td><input type="file" name="b_pic1"></td>
			</tr>
			<tr>
				<td><input type="file" name="b_pic2"></td>
			</tr>
			<tr>
				<td><input type="file" name="b_pic3"></td>
			</tr>
			<tr>
				<td align=center><br> <input type="submit"
					id="promotionWriteBTN" value="등록하기"
					onclick="return proWriteCheck()">&nbsp;&nbsp;&nbsp;&nbsp; <input
					type="reset" id="promotionResetBTN" value="다시작성"></td>
			</tr>
		</table>
	</form>
	<br>
	<br>
	<br>
	<br>
</body>
</html>
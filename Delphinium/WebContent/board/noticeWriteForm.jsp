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
	<h2 align="center">NOTICE</h2>


	<form name="noticeWriteForm" action="noticeWrite.do" method="post">
		<input type="hidden" name="b_cate" value="0">

		<hr width=40%>
		<table class="container noticeWrite" style="width: 40%">
			<tr>
				<td><input type="text" id="b_title" name="b_title"
					placeholder="  글 제목"></td>
			</tr>
			<tr>
				<td><textarea id="b_content" name="b_content"
						placeholder="  글 내용"></textarea>
			</tr>
			<tr>
				<td align=center><input type="submit" id="noticeWriteBTN"
					value="등록하기" onclick="return noWriteCheck()">&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="reset" id="noticeResetBTN" value="다시작성"></td>
			</tr>
		</table>
	</form>
	<br>
	<br>
	<br>
	<br>
</body>
</html>
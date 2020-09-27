<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<form name="promotionEditForm" action="promotionEdit.do" method="post"
		enctype="multipart/form-data">
		<input type="hidden" name="b_num" value="${b_num}">
		<table class="container promotionEdit" style="width: 40%">
			<tr>
				<td><input type="text" name="b_title" id="b_title"
					value="${bVo.b_title}"></td>
			</tr>
			<tr>
				<td><textarea id="b_content" name="b_content">${bVo.b_content}</textarea></td>
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
					id="promotionEditBTN" value="수정">&nbsp;&nbsp;&nbsp;&nbsp;
					<button id="promotionDeleteBTN"
						onclick="javascript:location.href='promotionDelete.do'">삭제</button>
				</td>
			</tr>
		</table>
	</form>
	<br>
	<br>
	<br>
	<br>
</body>
</html>
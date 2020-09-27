<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
<meta charset="UTF-8">
<title>Delphinium</title>
<link rel="stylesheet" href="style/member.css">
<script type="text/javascript" src="script/memberCheck.js"></script>


</head>

<body>
	<jsp:include page="../home/fixed.jsp" />

	<h2 align="center">JOIN MEMBER</h2>
	<hr width=40%>

	<form name="marJoinForm" action="marJoin.do" method="post">
		<table id="joinMarTable" class="container" style="width: 40%">
			<tr>
				<th width=40%>사업자등록번호</th>
				<td><input type="text" id="userID" name="userID"
					placeholder="123-45-67890"> <input type="hidden"
					name="reID"> <input type="button" value="중복체크"
					id="idCheckBTN" onclick="marIDCheck()"></td>
			</tr>

			<tr>
				<th>비밀번호</th>
				<td><input type="password" id="userPW" name="userPW"
					placeholder="PASSWORD"></td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td><input type="password" id="PWCheck" name="PWCheck"
					placeholder="PASSWORD"></td>
			</tr>

			<tr>
				<th>회사명</th>
				<td><input type="text" id="CName" name="CName"
					placeholder="Delphinium"></td>
			</tr>

			<tr>
				<th>대표자명</th>
				<td><input type="text" id="name" name="name" placeholder="김연아">
				</td>
			</tr>
			<tr>
				<th>연락처</th>
				<td><input type="text" id="phone" name="phone"
					placeholder="031-123-4567"></td>
			</tr>
			<tr>
				<th>SNS / HOMEPAGE</th>
				<td><input type="url" id="sns" name="SNS"
					placeholder="https://example.com"></td>
			</tr>


			<tr>
				<th style="border: none;">회사주소</th>
				<td style="border: none;"><input type="text" id="address"
					name="address" placeholder="서울시 송파구"></td>
			</tr>

		</table>
		<hr width=40%>
		<table class="container" style="width: 40%">
			<tr>
				<td>
					<h4>
						<input type="checkbox" name="agree" id="agree"> 전체 동의합니다.
					</h4>
					<p style="line-height: 2em">
						전체 동의의 필수 및 선택 정보에 대한 동의도 포함되어 있으며, 개별적으로 동의를 선택하실 수 있습니다. <br>선택
						항목에 대한 동의를 거부하는 경우에도 회원 가입 서비스는 이용 가능합니다.
					</p>
				</td>
			</tr>
			<tr>
				<td align="center"><br> <br> <input type="submit"
					name="joinBTN" id="joinBTN" value="회원등록"
					onclick="return marJoinCheck()">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset"
					value="다시작성"></td>
			</tr>
		</table>
	</form>
	<br>
	<br>
	<br>
	<br>
</body>

</html>
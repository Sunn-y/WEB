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

	<form name="conJoinForm" action="conJoin.do" method="post">
		<table id="joinConTable" class="container" style="width: 40%">
			<tr>
				<th width=40%>아이디</th>
				<td><input type="text" name="userID" id="userID"
					placeholder="ID"> <input type="hidden" name="reID">
					<input type="button" value="중복체크" id="idCheckBTN"
					onclick="conIDCheck()"></td>
			</tr>

			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="userPW" id="userPW"
					placeholder="PASSWORD"></td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td><input type="password" name="PWCheck" id="PWCheck"
					placeholder="PASSWORD"></td>
			</tr>


			<tr>
				<th>이름</th>
				<td><input type="text" id="name" name="name" placeholder="김연아">
				</td>
			</tr>

			<tr>
				<th>생년월일</th>
				<td><input type="date" id="birth" name="birth"
					value="2001-01-01"></td>
			</tr>


			<tr>
				<th height="30">성별</th>
				<td><input type="radio" id="gender" name="gender" value="1"
					checked> 여성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="gender" value="2"> 남성</td>
			</tr>

			<tr>
				<th>연락처</th>
				<td><input type="text" id="phone" name="phone"
					placeholder="010-1234-5678"></td>
			</tr>

			<tr>
				<th>주소</th>
				<td><input type="text" id="address" name="address"
					placeholder="서울시 송파구"></td>
			</tr>

			<tr>
				<th style="border: none;" height="20">이벤트 정보</th>
				<td style="border: none;"><input type="radio" id="event"
					name="event" value="1" checked>
					수신&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
					type="radio" name="event" value="2"> 수신 거부</td>
			</tr>

		</table>
		<hr width=40%>
		<table class="container" style="width: 40%">
			<tr>
				<td>
					<h4>
						<input type="checkbox" id="agree" name="agree"> 전체 동의합니다.
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
					onclick="return conJoinCheck();">
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

	<h2 align="center">MY PAGE</h2>
	<hr width=40%>


	<c:choose>
		<c:when test="${userLevel==1}">
			<form name="conEditForm" action="conEdit.do" method="post">
				<table id="joinConTable" class="container" style="width: 40%">
					<tr>
						<th width=40%>아이디</th>
						<td><input type="text" id="mypageUserID" name="userID"
							value="${mVo.userID}" readonly></td>
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
						<th>이름</th>
						<td><input type="text" id="name" name="name"
							value="${mVo.name}" readonly></td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td><input type="text" id="birth" name="birth"
							value="${mVo.birth}" readonly></td>
					</tr>
					<tr>
						<th height="30">성별</th>
						<td><c:choose>
								<c:when test="${mVo.gender == 1}">
									<input type="radio" id="gender" name="gender" value="1" checked>
							여성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
										type="radio" name="gender" value="2"> 남성
						</c:when>
								<c:when test="${mVo.gender == 2}">
									<input type="radio" id="gender" name="gender" value="1">
							여성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
										type="radio" name="gender" value="2" checked> 남성
						</c:when>
							</c:choose></td>
					</tr>
					<tr>
						<th>연락처</th>
						<td><input type="text" id="phone" name="phone"
							value="${mVo.phone}"></td>
					</tr>
					<tr>
						<th>주소</th>
						<td><input type="text" id="address" name="address"
							value="${mVo.address}"></td>
					</tr>
					<tr>
						<th style="border: none;" height="20">이벤트 정보</th>
						<td style="border: none;"><c:choose>
								<c:when test="${mVo.event == 1}">
									<input type="radio" id="event" name="event" value="1" checked>
							수신&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
										type="radio" name="event" value="2"> 수신 거부
						</c:when>
								<c:when test="${mVo.event == 2}">
									<input type="radio" id="event" name="event" value="1">
							수신&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
										type="radio" name="event" value="2" checked> 수신 거부
						</c:when>
							</c:choose></td>
					</tr>

				</table>
				<hr width=40%>
				<table class="container" style="width: 40%">
					<tr>
						<td align="center"><input type="submit" name="joinBTN"
							id="joinBTN" value="정보 수정" onclick="return conEditCheck()"></td>
					</tr>
				</table>
			</form>
			<table class="container" style="width: 40%">
				<tr>
					<td align="right"
						style="text-decoration: underline; cursor: pointer;"
						onclick="return deleteCheck()">회원탈퇴</td>
				</tr>
			</table>
			<br>
			<br>
			<br>
			<br>
		</c:when>





		<c:when test="${userLevel==2}">
			<form name="marEditForm" action="marEdit.do" method="post">
				<table id="joinMarTable" class="container" style="width: 40%">
					<tr>
						<th width=40%>사업자등록번호</th>
						<td><input type="text" id="mypageUserID" name="userID"
							value="${mVo.userID}" readonly></td>
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
							value="${mVo.CName}" readonly></td>
					</tr>
					<tr>
						<th>대표자명</th>
						<td><input type="text" id="name" name="name"
							value="${mVo.name}"></td>
					</tr>
					<tr>
						<th>연락처</th>
						<td><input type="text" id="phone" name="phone"
							value="${mVo.phone}"></td>
					</tr>
					<tr>
						<th>SNS</th>
						<td><input type="url" id="sns" name="sns" value="${mVo.SNS}"></td>
					</tr>
					<tr>
						<th style="border: none;">회사주소</th>
						<td style="border: none;"><input type="text" id="address"
							name="address" value="${mVo.address}"></td>
					</tr>
				</table>
				<hr width=40%>
				<table class="container" style="width: 40%">
					<tr>
						<td align="center"><input type="submit" name="joinBTN"
							id="joinBTN" value="정보 수정" onclick="return marEditCheck()">
						</td>
					</tr>
				</table>
			</form>
			<table class="container" style="width: 40%">
				<tr>
					<td align="right"
						style="text-decoration: underline; cursor: pointer;"
						onclick="return deleteCheck()">기업탈퇴</td>
				</tr>
			</table>
			<br>
			<br>
			<br>
			<br>
		</c:when>
	</c:choose>
</body>
</html>
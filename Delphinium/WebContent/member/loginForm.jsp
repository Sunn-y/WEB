<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en" dir="ltr">

<head>
<meta charset="utf-8">
<title>Delphinium</title>
<link rel="stylesheet" href="style/member.css">
<script type="text/javascript" src="script/memberCheck.js"></script>
<style media="screen">
body {
	background: #0F4C81;
}
</style>
</head>

<body>

	<div class="loginBox container">
		<div class="container" align="center">
			<img src="img/logo.png" id="logo" alt="logo.png"
				style="cursor: pointer;"
				onclick="javascript:location.href='main.do'">
			<form name="loginForm" action="login.do" method="post">
				<input type="text" name="loginID" id="loginID"
					placeholder=" 😄   ID"> <input type="password"
					name="loginPW" id="loginPW" placeholder="  🔑  PASSWORD"> <input
					type="submit" name="loginBTN" id="loginBTN" value="LOGIN"
					onclick="return loginCheck()">
			</form>
			<h6 align=center>
			<button class = "BTN" onclick = "javascript:location.href='joinSelect.do'" style = "padding-top:5px;">회원가입</button>
			</h6>
			<div class="loginResult">${msg}</div>
		</div>
	</div>
</body>

</html>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Delphinium</title>
<link rel="stylesheet" href="style/delphinium.css">
</head>

<body>

	<header id="top">
		<div class="container0 toolBar">
			<div id="boardTB">
				<a href="noticeList.do">NOTICE</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a
					href="promotionList.do">PROMOTION</a>
			</div>
			<c:choose>
				<c:when test="${loginUser==null}">
					<div id="multiTB">
						<a href="joinSelect.do">JOIN</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a
							href="loginForm.do">LOGIN</a>
					</div>
				</c:when>
				<c:otherwise>
					<div id="multiTB">
						<c:choose>
							<c:when test="${userLevel==0}">
								<a href="memberList.do">MANAGEMENT</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						</c:when>
							<c:when test="${userLevel==1}">
								<a href="cart.do">CART</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="mypageSelect.do">MYPAGE</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</c:when>
							<c:when test="${userLevel==2}">
								<a href="MDSelect.do">MERCHANDISE</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
								<a href="memberEditForm.do">MYPAGE</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</c:when>
						</c:choose>
						<a href="logout.do">LOGOUT</a>
					</div>
					<div id="loginInfo">${loginUser}님
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
				</c:otherwise>
			</c:choose>

		</div>
		<table class="container0 search" style="width: 80%">
			<tr>
				<td width="33.3%">
					<div style="color: white"></div>
				</td>
				<td align="left" width="30%"><img src="img/logo.png" id="logo"
					alt="logo.png" onclick="javascript:location.href='main.do'"
					width="80%" style="cursor: pointer"></td>
				<td>
					<form name="search" action="searchMDList.do">
						<input type="text" name="query" id="searchTB"
							placeholder="   search"> <input type="submit"
							id="searchBTN" value="🔍">
					</form>
				</td>
			</tr>
		</table>
	</header>
	<nav>
		<table class="navBar container0" style="width: 80%">
			<tr>
				<td><a href='merchandiseList.do?sort=NEW'>NEW</a></td>
				<td><a href='merchandiseList.do?sort=FASHION'>FASHION</a></td>
				<td><a href='merchandiseList.do?sort=LIFE'>LIFE</a></td>
				<td><a href='merchandiseList.do?sort=BEAUTY'>BEAUTY</a></td>
				<td><a href='merchandiseList.do?sort=FOOD'>FOOD</a></td>
			</tr>
		</table>
	</nav>

	<footer>ⓒ 2020. Delphinium. ALL RIGHTS RESERVED.</footer>
	<div id="movingTool">
		<span onclick="javascript:location.href='#top'"
			style="cursor: pointer; font-size: 2em;">🔝</span>
	</div>

</body>
</html>
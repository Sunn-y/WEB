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
</head>

<body>
	<jsp:include page="../home/fixed.jsp" />

	<h2 align="center">ORDER VIEW</h2>

	<hr width=40%>
	<br>
	<table class="orderView container" style="width: 40%;">
		<tr>
			<td width=30% align="center" rowspan="3"><img
				src="${oVo.md_sim_pic}" width=100%></td>
			<td align="right"><strong>${oVo.md_name}</strong></td>
		</tr>
		<tr>
			<td align="right" style="text-indent: 2em;">${oVo.md_price}원</td>
		</tr>
		<tr>
			<td align="right">주문일자 : <fmt:formatDate value="${oVo.od_date}" /></td>
		</tr>
		<tr>
			<th colspan="2">${oVo.md_name}<c:if
					test=" ${not empty oVo.md_op1_val}"> / ${oVo.md_op1_val} </c:if> <c:if
					test=" ${not empty oVo.md_op2_val}"> / ${oVo.md_op2_val} </c:if> <c:if
					test=" ${not empty oVo.md_op3_val}"> / ${oVo.md_op3_val} </c:if> <br>
				(구매수량 : ${oVo.qty} 개)
			</th>
		</tr>
		<tr>
			<td>판매자 : ${oVo.cname}</td>
			<td align="right">문의 : ${phone}</td>
		</tr>
	</table>
	<table class="container search" style="width: 40%">
		<tr>
			<td align="right">
				<button class="BTN"
					onclick="javascript:location.href='orderList.do'">목록으로</button>
			</td>
		</tr>
	</table>
	<br>
	<br>
	<br>
	<br>
</body>
</html>
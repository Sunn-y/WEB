<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Delphinium</title>
<link rel="stylesheet" href="style/md.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#checkAll").click(function() {
			if ($("#checkAll").prop("checked")) {
				$("input[name=check]").prop("checked", true);
			} else {
				$("input[name=check]").prop("checked", false);
			}
			var total = $("input[name=check]:checked").length;
			$("#total").text(total);

			var sum = 0;
			$("input[name=check]:checked").each(function() {
				var values = $(this).val();
				var valueSplit = values.split(",");
				sum += Number(valueSplit[1]) * Number(valueSplit[2]);
			});
			$("#totalPrice").text(sum);
		});
		var total = $("input[name=check]:checked").length;
		$("#total").text(total);

		$("input[name=check]").click(function() {
			var total = $("input[name=check]:checked").length;
			$("#total").text(total);
		});
		var sum = 0;
		$("input[name=check]:checked").each(function() {
			var values = $(this).val();
			var valueSplit = values.split(",");
			sum += Number(valueSplit[1]) * Number(valueSplit[2]);
		});
		$("#totalPrice").text(sum);

		$("input[name=check]").click(function() {
			var sum2 = 0;
			$("input[name=check]:checked").each(function() {
				var values = $(this).val();
				var valueSplit = values.split(",");
				sum2 += Number(valueSplit[1]) * Number(valueSplit[2]);
			});
			$("#totalPrice").text(sum2);
		});

		$("#orderBTN").click(function() {
			var numbers = '';
			$("input[name=check]:checked").each(function() {
				var values = $(this).val();
				var valueSplit = values.split(",");
				numbers += valueSplit[0] + ',';
			});
			location.href = 'order.do?nums=' + numbers;
		});
	});
</script>
</head>
<body>
	<jsp:include page="../home/fixed.jsp" />
	<h2 align="center">CART</h2>
	<hr width=40%>
	<c:if test="${not empty cVoList }">
		<table class="container" style="width: 40%">
			<tr>
				<td><input type="checkbox" name="checkAll" id="checkAll"
					onclick="checkAll()" checked>전체상품(<span id="total"></span>개)</td>
			</tr>
		</table>
	</c:if>
	<c:if test="${empty cVoList }">
		<table class="container" style="width: 40%; text-align: center">
			<tr>
				<td>장바구니에 담긴 상품이 없습니다.</td>
			</tr>
		</table>
	</c:if>
	<c:if test="${not empty cVoList }">
		<c:forEach items="${cVoList}" var="cVo">
			<hr width=40%>
			<table class="container cart" style="width: 40%">
				<tr>
					<td colspan="2"><input type="checkbox" name="check" id="check"
						value="${cVo.number}, ${cVo.md_price}, ${cVo.qty}" checked>&nbsp;&nbsp;${cVo.md_name}
					</td>
					<td align=right>
						<button
							onclick="javascript:location.href='deleteCart.do?num=${cVo.number}'"
							class="BTN">✖</button>
					</td>
				</tr>
				<tr>
					<td rowspan="8" style="width: 50%; text-align: left;"><img
						src="${cVo.md_sim_pic}"
						style="width: 200px; height: 200px; cursor: pointer;"
						onclick="javascript:location.href='detail.do?md_num=${cVo.md_num}'"></td>
					<td class="forBorder1" colspan="2">${cVo.cname}</td>
				</tr>
				<tr>
					<td class="forBorder2" colspan="2">${cVo.md_name}</td>
				</tr>
				<tr>
					<th style="padding-top: 20px;">가격</th>
					<td style="padding-top: 20px;">${cVo.md_price}</td>
				</tr>
				<tr>
					<th>상품번호</th>
					<td>${cVo.md_num}</td>
				</tr>
				<tr>
					<th>수량</th>
					<td>${cVo.qty}</td>
				</tr>
				<c:if test="${ cVo.md_op1_name != '옵션없음'}">
					<tr>
						<th>${cVo.md_op1_name}</th>
						<td>${cVo.md_op1_val}</td>
					</tr>
				</c:if>
				<c:if test="${ cVo.md_op2_name != '옵션없음'}">
					<tr>
						<th>${cVo.md_op2_name}</th>
						<td>${cVo.md_op2_val}</td>
					</tr>
				</c:if>
				<c:if test="${ cVo.md_op3_name != '옵션없음'}">
					<tr>
						<th>${cVo.md_op3_name}</th>
						<td>${cVo.md_op3_val}</td>
					</tr>
				</c:if>
			</table>
		</c:forEach>
	</c:if>
	<hr width=40%>
	<br>
	<table class="container" style="width: 40%">
		<tr>
			<td align=right>
				<h3>
					총 주문금액&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="totalPrice"></span>
				</h3>
			</td>
		</tr>
		<tr>
			<td align=right><button id="orderBTN">주문하기</button></td>
		</tr>
	</table>
	<br>
	<br>
	<br>
	<br>
</body>
</html>
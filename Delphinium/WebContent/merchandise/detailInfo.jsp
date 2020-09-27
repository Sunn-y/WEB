<%@page import="java.net.URLEncoder"%>
<%@page import="com.delphinium.dto.MerchandiseVO"%>
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
<script type="text/javascript" src="script/mdCheck.js"></script>
</head>
<body>
	<%
		MerchandiseVO mdd = (MerchandiseVO) request.getAttribute("mdVo");
	String encodeName = URLEncoder.encode(mdd.getCname(), "UTF-8");
	%>
	<jsp:include page="../home/fixed.jsp" />
	<h2 align="center">DETAIL</h2>
	<form name="detailForm" method="post" action="addCart.do">
		<input type="hidden" name="wannaMove" value="true"> <input
			type="hidden" name="loginUser" value="${loginUser}"> <input
			type="hidden" name="md_name" value="${mdVo.md_name}"> <input
			type="hidden" name="md_num" value="${md_num}"> <input
			type="hidden" name="md_op1_name" value="${mdVo.md_op1_name}">
		<input type="hidden" name="md_op2_name" value="${mdVo.md_op2_name}">
		<input type="hidden" name="md_op3_name" value="${mdVo.md_op3_name}">
		<table class="detail container" style="width: 50%">
			<tr>
				<td rowspan="8" style="width: 50%; text-align: left;"><img
					src="${mdVo.md_sim_pic}" width="400" height="400"></td>
				<td class="forBorder1 marketView" colspan="2"
					onclick="javascript:location.href='market.do?cname=<%=encodeName%>'">${mdVo.cname}</td>
			</tr>
			<tr>
				<td class="forBorder2" colspan="2">${mdVo.md_name}</td>
			</tr>
			<tr>
				<th style="padding-top: 20px;">가격</th>
				<td style="padding-top: 20px;">${mdVo.md_price}</td>
			</tr>
			<tr>
				<th>상품번호</th>
				<td>${mdVo.md_num}</td>
			</tr>
			<tr>
				<th>수량</th>
				<td><input type="number" id="qty" name="qty" value="1" min="1"
					max="10"></td>
			</tr>
			<c:if test="${mdVo.md_op1_name != '옵션없음'}">
				<tr>
					<th>${mdVo.md_op1_name}</th>
					<td>
						<%
							MerchandiseVO md = (MerchandiseVO) request.getAttribute("mdVo");
						String op1 = md.getMd_op1_val();
						String[] opVal1 = op1.split(",");
						out.print("<select name = 'md_op1_val'>");
						for (int i = 0; i < opVal1.length; i++) {
							String op = opVal1[i];
							out.print("<option value ='" + op + "'>" + op + "</option>");
						}
						out.print("</select>");
						%>
					</td>
				</tr>
			</c:if>
			<c:if test="${mdVo.md_op2_name  != '옵션없음'}">
				<tr>
					<th>${mdVo.md_op2_name}</th>
					<td>
						<%
							MerchandiseVO md = (MerchandiseVO) request.getAttribute("mdVo");
						String op2 = md.getMd_op2_val();
						String[] opVal2 = op2.split(",");
						out.print("<select name = 'md_op2_val'>");
						for (int i = 0; i < opVal2.length; i++) {
							String op = opVal2[i];
							out.print("<option value ='" + op + "'>" + op + "</option>");
						}
						out.print("</select>");
						%>
					</td>
				</tr>
			</c:if>
			<c:if test="${mdVo.md_op3_name  != '옵션없음'}">
				<tr>
					<th>${mdVo.md_op3_name}</th>
					<td>
						<%
							MerchandiseVO md = (MerchandiseVO) request.getAttribute("mdVo");
						String op3 = md.getMd_op3_val();
						String[] opVal3 = op3.split(",");
						out.print("<select name = 'md_op3_val'>");
						for (int i = 0; i < opVal3.length; i++) {
							String op = opVal3[i];
							out.print("<option value ='" + op + "'>" + op + "</option>");
						}
						out.print("</select>");
						%>
					</td>
				</tr>
			</c:if>
			<c:choose>
				<c:when test="${userLevel == null}">
					<tr>
						<td colspan="2"><input type="submit" id="cart" name="req"
							value="ORDER" onclick="return orderCheck()">&nbsp;&nbsp;
							<input type="submit" id="cart" name="req" value="CART"
							onclick="return cartCheck()"></td>
					</tr>
				</c:when>
				<c:when test="${userLevel == 1}">
					<tr>
						<td colspan="2"><input type="submit" id="cart" name="req"
							value="ORDER" onclick="return orderCheck()">&nbsp;&nbsp;
							<input type="submit" id="cart" name="req" value="CART"
							onclick="return cartCheck()"></td>
					</tr>
				</c:when>
			</c:choose>
		</table>
	</form>
	<hr width=60%>
	<table class="container" style="width: 50%">
		<c:if test="${mdVo.md_det_pic != '사진없음'}">
			<tr>
				<td><img src="${mdVo.md_det_pic}" width=100%></td>
			</tr>
		</c:if>
		<tr>
			<td>${mdVo.md_det_info}</td>
		</tr>
	</table>
	<br>
	<br>




	<hr width=60%>
	<h2>REVIEW</h2>
	<hr width=60%>
	<c:if test="${empty rVo}">
		<table id="review" class="container" style="width: 40%">
			<tr>
				<td colspan="2" align="center">등록된 리뷰가 아직 없습니다.</td>
			</tr>
		</table>
	</c:if>
	<c:if test="${not empty rVo}">
		<table id="review" class="container" style="width: 40%;">
			<tr>
				<th align="right" colspan="2" style="margin: none;"><button
						class="BTN"
						onclick="javascript:location.href='reviewList.do?md_num=${md_num}'">
						+ 더보기</button></th>
			</tr>
			<tr>
				<th align="left" width=70%>${rVo.userID}님&nbsp;&nbsp;&nbsp;&nbsp;
					<c:if test="${rVo.rv_md_star==1}">★☆☆☆☆</c:if> <c:if
						test="${rVo.rv_md_star==2}">★★☆☆☆</c:if> <c:if
						test="${rVo.rv_md_star==3}">★★★☆☆</c:if> <c:if
						test="${rVo.rv_md_star==4}">★★★★☆</c:if> <c:if
						test="${rVo.rv_md_star==5}">★★★★★</c:if>
				</th>
				<th align="right"><fmt:formatDate value="${rVo.rv_date}" /></th>
			</tr>
			<tr>
				<td align="left" colspan="2">${rVo.rv_content}</td>
			</tr>
		</table>
	</c:if>


	<br>
	<br>
	<br>
	<br>

	<hr width=60%>
	<h2 align="center">Q &amp; A</h2>
	<hr width=60%>
	<c:if test="${empty qVo}">
		<table id="QA" class="container" style="width: 40%; cursor: pointer;">
			<tr>
				<td colspan="2" align="center">등록된 문의사항이 없습니다.</td>
			</tr>
		</table>
	</c:if>
	<c:if test="${not empty qVo}">
		<table id="QA" class="container" style="width: 40%">
			<tr>
				<th align="right" colspan="2"><button class="BTN"
						onclick="javascript:location.href='qnaList.do?md_num=${md_num}'">
						+ 더보기</button></th>
			</tr>
			<tr>
				<th align="left">${qVo.userID}님</th>
				<th align="right"><fmt:formatDate value="${qVo.qa_date}" /></th>
			</tr>
			<tr>
				<td colspan="2"><strong>Q. ${qVo.qa_title}</strong><br> <br>
					&nbsp;&nbsp; &nbsp;&nbsp;${qVo.qa_content}</td>
			</tr>
			<tr>
				<td colspan="2">${qVo.qa_ans}</td>
			</tr>
		</table>
	</c:if>



	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
</body>
</html>
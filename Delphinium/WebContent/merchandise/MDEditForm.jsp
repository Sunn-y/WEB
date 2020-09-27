<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Delphinium</title>
<link rel="stylesheet" href="style/md.css">
<script type="text/javascript" src="script/mdCheck.js"></script>
</head>
<body>
	<jsp:include page="../home/fixed.jsp" />
	<h2 align="center">MERCHANDISE EDIT</h2>
	<hr width=40%>
	<form name="MDEditForm" action="MDEdit.do" method="post"
		enctype="multipart/form-data">
		<input type="hidden" name="md_num" value="${mdVo.md_num}">
		<table class="MDEdit container" style="width: 40%">
			<tr>
				<th style="width: 30%">분류</th>
				<td colspan="3"><select id="MD_Cate" name="md_cate">
						<c:if test="${mdVo.md_cate == 'FASHION'}">
							<option value="FASHION" selected>FASHION</option>
							<option value="LIFE">LIFE</option>
							<option value="BEAUTY">BEAUTY</option>
							<option value="FOOD">FOOD</option>
						</c:if>
						<c:if test="${mdVo.md_cate == 'LIFE'}">
							<option value="FASHION">FASHION</option>
							<option value="LIFE" selected>LIFE</option>
							<option value="BEAUTY">BEAUTY</option>
							<option value="FOOD">FOOD</option>
						</c:if>
						<c:if test="${mdVo.md_cate == 'BEAUTY'}">
							<option value="FASHION">FASHION</option>
							<option value="LIFE">LIFE</option>
							<option value="BEAUTY" selected>BEAUTY</option>
							<option value="FOOD">FOOD</option>
						</c:if>
						<c:if test="${mdVo.md_cate == 'FOOD'}">
							<option value="FASHION">FASHION</option>
							<option value="LIFE">LIFE</option>
							<option value="BEAUTY">BEAUTY</option>
							<option value="FOOD" selected>FOOD</option>
						</c:if>
				</select>
			</tr>
			<tr>
				<th>상품명</th>
				<td colspan="3"><input type="text" id="MD_Name" name="md_name"
					value="${mdVo.md_name}"></td>
			</tr>
			<tr>
				<th style="width: 20%">섬네일 사진</th>
				<td><input type="file" id="MD_Sim_Pic" name="md_sim_pic"></td>
				<th style="width: 20%">상세 사진</th>
				<td><input type="file" id="MD_Det_Pic" name="md_det_pic"></td>
			</tr>
			<tr>
				<th>간략설명</th>
				<td colspan="3"><input type="text" id="MD_Sim_Info"
					name="md_sim_info" value="${mdVo.md_sim_info}"></td>
			</tr>
			<tr>
				<th>상품설명</th>
				<td colspan="3"><textarea id="MD_Det_Info" name="md_det_info"
						style="hegiht: 300px;">${mdVo.md_det_info}</textarea></td>
			</tr>
			<tr>
				<th>판매가</th>
				<td colspan="3"><input type="text" id="MD_Price"
					name="md_price" value="${mdVo.md_price}"></td>
			</tr>
			<tr>
				<th>옵션명1</th>
				<td><input type="text" id="MD_OP1_Name" name="md_op1_name"
					value="${mdVo.md_op1_name}"></td>
				<th>옵션1값</th>
				<td><input type="text" id="MD_OP1_Val" name="md_op1_val"
					value="${mdVo.md_op1_val}"></td>
			</tr>
			<tr>
				<th>옵션명2</th>
				<td><input type="text" id="MD_OP2_Name" name="md_op2_name"
					value="${mdVo.md_op2_name}"></td>
				<th>옵션2값</th>
				<td><input type="text" id="MD_OP2_Val" name="md_op2_val"
					value="${mdVo.md_op2_val}"></td>
			</tr>
			<tr>
				<th>옵션명3</th>
				<td><input type="text" id="MD_OP3_Name" name="md_op3_name"
					value="${mdVo.md_op3_name}"></td>
				<th>옵션3값</th>
				<td><input type="text" id="MD_OP3_Val" name="md_op3_val"
					value="${mdVo.md_op3_val}"></td>
			</tr>
			<tr>
				<td colspan="4" align="center"
					style="border-bottom: 2px solid #0F4C81;"><input type="submit"
					name="MDEditBTN" id="MDEditBTN" value="상품수정">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button id="MDEditBTN" onclick="return deleteCheck()">상품삭제</button>
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
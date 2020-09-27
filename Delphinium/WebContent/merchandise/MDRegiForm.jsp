<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Delphinium</title>
<link rel="stylesheet" href="style/md.css">
<script type="text/javascript" src="script/mdCheck.js"></script>
<script type="text/javascript">
	function numkeyCheck(e) {
		var keyValue = event.keyCode;
		if (((keyValue >= 48) && (keyValue <= 57)))
			return true;
		else {
			alert("금액을 숫자로 입력해 주세요")
		}
	}
</script>
</head>
<body>
	<jsp:include page="../home/fixed.jsp" />
	<form name="MDRegiForm" action="MDRegi.do" method="post"
		enctype="multipart/form-data">
		<h2 align="center">MERCHANDISE REGISTRATION</h2>
		<hr width=40%>

		<table class="MDRegi container" style="width: 40%">
			<tr>
				<th>분류</th>
				<td colspan="3"><select id="MD_Cate" name="md_cate">
						<option value="FASHION">FASHION</option>
						<option value="LIFE">LIFE</option>
						<option value="BEAUTY">BEAUTY</option>
						<option value="FOOD">FOOD</option>
				</select>
			</tr>
			<tr>
				<th>상품명</th>
				<td colspan="3"><input type="text" id="MD_Name" name="md_name"></td>
			</tr>
			<tr>
				<th>섬네일 사진</th>
				<td><input type="file" id="MD_Sim_Pic" name="md_sim_pic"></td>
				<th>상세 사진</th>
				<td><input type="file" id="MD_Det_Pic" name="md_det_pic"></td>
			</tr>
			<tr>
				<th>간략설명</th>
				<td colspan="3"><input type="text" id="MD_Sim_Info"
					name="md_sim_info"></td>
			</tr>
			<tr>
				<th>상품설명</th>
				<td colspan="3"><textarea id="MD_Det_Info" name="md_det_info"
						style="hegiht: 400px;"></textarea></td>
			</tr>
			<tr>
				<th>판매가</th>
				<td colspan="3"><input type="text" id="MD_Price"
					name="md_price" onkeypress="return numkeyCheck(event)"></td>
			</tr>
			<tr>
				<th>옵션명1</th>
				<td><input type="text" id="MD_OP1_Name" name="md_op1_name"
					placeholder="color"></td>
				<th>옵션1값</th>
				<td><input type="text" id="MD_OP1_Val" name="md_op1_val"
					placeholder="red, blue, green"></td>
			</tr>
			<tr>
				<th>옵션명2</th>
				<td><input type="text" id="MD_OP2_Name" name="md_op2_name"
					placeholder="size"></td>
				<th>옵션2값</th>
				<td><input type="text" id="MD_OP2_Val" name="md_op2_val"
					placeholder="95, 100, 105"></td>
			</tr>
			<tr>
				<th>옵션명3</th>
				<td><input type="text" id="MD_OP3_Name" name="md_op3_name"
					placeholder="etc"></td>
				<th>옵션3값</th>
				<td><input type="text" id="MD_OP3_Val" name="md_op3_val"
					placeholder=",(comma)로 구분해주세요"></td>
			</tr>
			<tr>
				<td colspan="4" align="center"
					style="border-bottom: 2px solid #0F4C81;"><input type="submit"
					name="MDRegiBTN" id="MDRegiBTN" value="상품등록"
					onclick="return mdCheck()">
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
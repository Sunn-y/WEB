function mdCheck() {
	if (document.MDRegiForm.md_name.value == "") {
		alert("상품명을 입력해 주세요.");
		document.MDRegiForm.md_name.focus();
		return false;
	}
	if (document.MDRegiForm.md_sim_pic.value == "") {
		alert("섬네일 사진을 입력해 주세요.");
		return false;
	}
	if (document.MDRegiForm.md_sim_info.value == "") {
		alert("상품에 대한 간략한 설명을 입력해 주세요.");
		document.MDRegiForm.md_sim_info.focus();
		return false;
	}
	if (document.MDRegiForm.md_det_info.value == "") {
		alert("상품에 대한 설명을 입력해 주세요.");
		document.MDRegiForm.md_det_info.focus();
		return false;
	}

	if (document.MDRegiForm.md_price.value == "") {
		alert("상품 판매가를 입력해 주세요.");
		document.MDRegiForm.md_price.focus();
		return false;
	}

	if (isNaN(document.MDRegiForm.md_price.value)) {
		alert("상품 판매가는 숫자만 입력가능합니다.");
		document.MDRegiForm.md_price.focus();
		return false;
	}
}

function cartCheck() {
	if (document.detailForm.loginUser.value == "") {
		alert("장바구니는 로그인 이후 사용 가능합니다. ");
		return false
	}

	var result = confirm("장바구니로 이동하시겠습니까?");
	if (result == false) {
		document.detailForm.wannaMove.value = false;
	}
}

function orderCheck() {
	if (document.detailForm.loginUser.value == "") {
		alert("주문은 로그인 이후 사용 가능합니다. ");
		return false
	}
}

function reviewCheck() {
	if (document.reviewForm.rv_content.value == "") {
		alert("내용을 작성해 주세요.");
		return false
	}
}

function qaCheck() {
	if (document.qaForm.qa_content.value == "") {
		alert("내용을 작성해 주세요.");
		return false;
	}
}

function ansCheck() {
	if (document.qaForm.qa_ans.value == "") {
		alert("내용을 작성해 주세요.");
		return false
	}
}

function deleteCheck() {
	var md_num = document.MDEditForm.md_num.value;
	var url = 'MDDelete.do?md_num=' + md_num;
	var result = confirm("정말로 삭제하시겠습니까?");
	if (result) {
		alert("삭제되었습니다.");
		location.href = url;
	} else {
		return false;
	}
}
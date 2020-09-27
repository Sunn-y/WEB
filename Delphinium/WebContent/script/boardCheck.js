function proWriteCheck() {
	if (document.promotionWriteForm.b_title.value == "") {
		alert("제목을 입력해주세요.");
		document.promotionWriteForm.b_title.focus();
		return false;
	}
	
	if (document.promotionWriteForm.b_content.value == "") {
		alert("내용을 입력해주세요.");
		document.promotionWriteForm.b_content.focus();
		return false;
	}
}

function noWriteCheck() {
	if (document.noticeWriteForm.b_title.value == "") {
		alert("제목을 입력해주세요.");
		document.noticeWriteForm.b_title.focus();
		return false;
	}
	
	if (document.noticeWriteForm.b_content.value == "") {
		alert("내용을 입력해주세요.");
		document.noticeWriteForm.b_content.focus();
		return false;
	}
}
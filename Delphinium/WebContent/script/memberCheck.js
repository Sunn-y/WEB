function loginCheck() {
	if (document.loginForm.loginID.value == "") {
		alert("아이디를 입력해주세요.");
		document.loginForm.loginID.focus();
		return false;
	}
	if (document.loginForm.loginPW.value == "") {
		alert("비밀번호를 입력해주세요.");
		document.loginForm.loginPW.focus();
		return false;
	}
}

function conJoinCheck() {
	if (document.conJoinForm.userID.value == "") {
		alert("아이디를 입력해주세요.");
		document.conJoinForm.userID.focus();
		return false;
	}
	
	if (document.conJoinForm.reID.value == "") {
		alert("아이디 중복체크를 하지 않았습니다.");
		document.conJoinForm.userID.focus();
		return false;
	}

	if (document.conJoinForm.userPW.value == "") {
		alert("비밀번호를 입력해주세요.");s
		document.conJoinForm.userPW.focus();
		return false;
	}
	var userPW = document.getElementById("userPW").value;
	var PWCheck = document.getElementById("PWCheck").value;

	if (userPW != "" || PWCheck != "") {
		if (userPW != PWCheck) {
			alert("비밀번호가 일치하지 않습니다.");
			document.conJoinForm.userPW.focus();
			return false;
		}
	}
	if (document.conJoinForm.name.value == "") {
		alert("이름을 입력해주세요.");
		document.conJoinForm.name.focus();
		return false;
	}
	if (document.conJoinForm.birth.value == "") {
		alert("생년월일을 입력해주세요.");
		document.conJoinForm.birth.focus();
		return false;
	}
	if (document.conJoinForm.phone.value == "") {
		alert("연락처를 입력해주세요.");
		document.conJoinForm.phone.focus();
		return false;
	}

	if (document.conJoinForm.address.value == "") {
		alert("주소를 입력해주세요.");
		document.conJoinForm.address.focus();
		return false;
	}

	if (document.getElementById("agree").checked == false) {
		alert("약관에 동의하지 않으시면 가입하실 수 없습니다.");
		return false;
	}
}

function marJoinCheck() {
	if (document.marJoinForm.userID.value == "") {
		alert("사업자등록번호를 입력해주세요.");
		document.marJoinForm.userID.focus();
		return false;
	}

	if (document.marJoinForm.reID.value == "") {
		alert("사업자등록번호 중복체크를 하지 않았습니다.");
		document.marJoinForm.userID.focus();
		return false;
	}

	if (document.marJoinForm.userPW.value == "") {
		alert("비밀번호를 입력해주세요.");
		document.marJoinForm.userPW.focus();
		return false;
	}
	var userPW = document.getElementById("userPW").value;
	var PWCheck = document.getElementById("PWCheck").value;

	if (userPW != "" || PWCheck != "") {
		if (userPW != PWCheck) {
			alert("비밀번호가 일치하지 않습니다.");
			document.marJoinForm.userPW.focus();
			return false;
		}
	}
	if (document.marJoinForm.CName.value == "") {
		alert("회사명을 입력해주세요.");
		document.marJoinForm.CName.focus();
		return false;
	}
	if (document.marJoinForm.name.value == "") {
		alert("대표자명을 입력해주세요.");
		document.marJoinForm.name.focus();
		return false;
	}
	if (document.marJoinForm.phone.value == "") {
		alert("연락처를 입력해주세요.");
		document.marJoinForm.phone.focus();
		return false;
	}
	if (document.marJoinForm.SNS.value == "") {
		alert("SNS 또는 홈페이지 주소를 입력해주세요.");
		document.marJoinForm.SNS.focus();
		return false;
	}
	if (document.marJoinForm.address.value == "") {
		alert("주소를 입력해주세요.");
		document.marJoinForm.address.focus();
		return false;
	}

	if (document.getElementById("agree").checked == false) {
		alert("약관에 동의하지 않으시면 가입하실 수 없습니다.");
		return false;
	}
}

function conIDCheck() {
	if (document.conJoinForm.userID.value == "") {
		alert("아이디를 입력해주세요.");
		document.conJoinForm.userID.focus();
		return false;
	}
	var id = document.conJoinForm.userID.value;
	var url = "conIDCheck.do?userID=" + encodeURI(encodeURIComponent(id));
	window
			.open(url, "IDCheck",
					"toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=500, height=400");
}

function marIDCheck() {
	if (document.marJoinForm.userID.value == "") {
		alert("사업자등록번호를 입력해주세요.");
		document.marJoinForm.userID.focus();
		return false;
	}
	var id = document.marJoinForm.userID.value;
	var url = "marIDCheck.do?userID=" + encodeURI(encodeURIComponent(id));
	window
			.open(url, "IDCheck",
					"toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=500, height=400");
}

function conIDOK() {
	opener.conJoinForm.userID.value = document.idCheckForm.userID.value
	opener.conJoinForm.reID.value = document.idCheckForm.userID.value
	self.close();
}

function marIDOK() {
	opener.marJoinForm.userID.value = document.idCheckForm.userID.value
	opener.marJoinForm.reID.value = document.idCheckForm.userID.value
	self.close();
}

function conEditCheck() {
	if (document.conEditForm.userPW.value == "") {
		alert("비밀번호를 입력하지 않으면 수정할 수 없습니다.");
		document.conEditForm.userPW.focus();
		return false;
	}
	var userPW = document.getElementById("userPW").value;
	var PWCheck = document.getElementById("PWCheck").value;

	if (userPW != "" || PWCheck != "") {
		if (userPW != PWCheck) {
			alert("비밀번호가 일치하지 않습니다.");
			document.conEditForm.userPW.focus();
			return false;
		}
	}
}

function marEditCheck() {
	if (document.marEditForm.userPW.value == "") {
		alert("비밀번호를 입력하지 않으면 수정할 수 없습니다.");
		document.marEditForm.userPW.focus();
		return false;
	}
	var userPW = document.getElementById("userPW").value;
	var PWCheck = document.getElementById("PWCheck").value;

	if (userPW != "" || PWCheck != "") {
		if (userPW != PWCheck) {
			alert("비밀번호가 일치하지 않습니다.");
			document.marEditForm.userPW.focus();
			return false;
		}
	}
}

function deleteCheck() {
	var result = confirm("정말로 탈퇴하시겠습니까?");
	if (result) {
		alert("탈퇴되었습니다.");
		location.href = 'memberDelete.do';
	} else {
		return false;
	}
}
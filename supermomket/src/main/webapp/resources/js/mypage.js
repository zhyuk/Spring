/****** 관리자 메뉴 ******/
// 사용자 정보 수정(관리자)
function goEditTable(td) {
    if (td.getAttribute("data-editable") === "false") return;

    td.contentEditable = true;
    td.classList.add("editing");
    td.focus();

    td.onblur = function () {
        td.contentEditable = false;
        td.classList.remove("editing");

        const inputName = td.getAttribute("data-name");
        if (inputName) {
            const formId = `form-${td.closest("tr").getAttribute("data-user-id")}`;
            const input = document.querySelector(`#${formId} input[name="${inputName}"]`);
            if (input) {
                input.value = td.innerText.trim();
            } else {
                console.error(`Input field for ${inputName} not found in form ${formId}`);
            }
        }
    };
}

// 사용자 정보 수정(관리자)
function selUser(userId) {
    if (confirm("수정하시겠습니까?")) {
        submitForm(userId);
    }
}

function submitForm(userId) {
    const form = document.getElementById(`form-${userId}`);
    if (form) {
        form.submit();
        alert("수정이 완료되었습니다.");
    }
}

function delUser(userId) {
    if (userId === "admin") {
        alert("관리자 계정은 삭제할 수 없습니다.");
        return;
    }

    if (confirm("정말로 이 사용자를 삭제하시겠습니까?")) {
        window.location.href = `delUser.do?userId=${userId}`;
    }
}

// 관리자 비밀번호 변경(관리자)
function goAdminPwCheck(event) {
    const password = document.getElementById("floatingPassword").value;

    if (!password) {
        alert("비밀번호를 입력해주세요.");
        event.preventDefault();
        return false;
    }
}

// 관리자 비밀번호 변경 유효성 확인
function goAdminPwChk(event) {
    const newPw = document.getElementById("newPw").value;
    const newPwChk = document.getElementById("newPwChk").value;
    const passwordRegex = /^(?=.*[A-Za-z])(?=.*[\d!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,12}$/;

    if (!passwordRegex.test(newPw)) {
        document.getElementById("newPw_error").innerHTML = "비밀번호는 영문 대/소문자, 숫자, 특수문자 중 2가지 이상 조합으로 8~12자로 입력하세요.";
    } else {
        document.getElementById("newPw_error").innerHTML = "";
    }

    if (newPw !== newPwChk) {
        document.getElementById("newPwChk_error").innerHTML = "비밀번호가 일치하지 않습니다.";
    } else {
        document.getElementById("newPwChk_error").innerHTML = "";
    }
}



/****** 사용자 메뉴 ******/

// 개인정보 수정 전 쳌
function goUpdateInfo(event){
    const password = document.getElementById("u_pw").value;

    if (!password) {
        alert("비밀번호를 입력해주세요.");
        event.preventDefault();
        return false;
    }
}




// 개인정보 수정(사용자)
function goValidateForm(event) {
    const nickname = document.getElementById("floatingNickname").value.trim();
    const email = document.getElementById("floatingEmail").value.trim();
    const pno = document.getElementById("floatingPhone").value.trim();
    const address = document.getElementById("sample4_detailAddress").value.trim();
    
    let isValid = true;

    const nicknameRegex = /^(?:(?=.*[가-힣]{2,8})[가-힣]{2,8}|(?=.*[a-zA-Z]{2,24})[a-zA-Z]{2,24})$/;
    const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
    const pnoRegex = /^01[0-9]-\d{3,4}-\d{4}$/;

    // 닉네임 쳌
    if (!nickname || !nicknameRegex.test(nickname)) {
        document.getElementById("nickError").innerHTML = "닉네임은 한글 2~8자 또는 영문 2~24자로 입력하세요.";
        isValid = false;
    } else {
        document.getElementById("nickError").innerHTML = "";
    }

    // 이메일 쳌
    if (!email || !emailRegex.test(email)) {
        document.getElementById("emailError").innerHTML = "이메일은 형식에 맞추어 24자 이내로 입력하세요.";
        isValid = false;
    } else {
        document.getElementById("emailError").innerHTML = "";
    }

    // 휴대전화번호 쳌
    if (!pno || !pnoRegex.test(pno)) {
        document.getElementById("phError").innerHTML = "휴대전화번호는 010-1234-5678 형식으로 입력하세요.";
        isValid = false;
    } else {
        document.getElementById("phError").innerHTML = "";
    }

    // 상세주소 쳌
    if (!address) {
        alert("상세주소를 입력해주세요.");
        isValid = false;
    }

    if (!isValid) {
        event.preventDefault();
        return false;
    }

    if (!confirm("수정하시겠습니까?")) {
        event.preventDefault();
        return false;
    }

    alert("수정이 완료되었습니다.");
    return true;
}


// 사용자 비밀번호 변경(사용자)
function goUpdatePwCheck(event) {
    const password = document.getElementById("u_pw").value;

    if (!password) {
        alert("비밀번호를 입력해주세요.");
        event.preventDefault();
        return false;
    }
}


// 사용자 비밀번호 변경 유효성 쳌
function goPwChk(event) {
    const newPw = document.getElementById("newPw").value;
    const newPwChk = document.getElementById("newPwChk").value;
    const passwordRegex = /^(?=.*[A-Za-z])(?=.*[\d!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,12}$/;

    if (!passwordRegex.test(newPw)) {
        document.getElementById("newPw_error").innerHTML = "비밀번호는 영문 대/소문자, 숫자, 특수문자 중 2가지 이상 조합으로 8~12자로 입력하세요.";
    } else {
        document.getElementById("newPw_error").innerHTML = "";
    }

    if (newPw !== newPwChk) {
        document.getElementById("newPwChk_error").innerHTML = "비밀번호가 일치하지 않습니다.";
    } else {
        document.getElementById("newPwChk_error").innerHTML = "";
    }
}



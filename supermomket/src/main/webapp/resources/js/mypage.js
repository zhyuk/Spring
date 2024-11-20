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
	if(userId === "admin"){
		alert("관리자 계정은 수정할 수 없습니다.");
		return;
	}
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
    const password = document.getElementById("u_pw").value;

    if (!password) {
        alert("비밀번호를 입력해주세요.");
        event.preventDefault();
        return false;
    }
}

// 관리자 비밀번호 변경 유효성 확인
function goAdminPwChk() {
    const newPw = document.getElementById("newPw").value;
    const newPwChk = document.getElementById("newPwChk").value;

    const passwordRegex = /^(?=.*[A-Za-z])(?=.*[\d!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,12}$/;

    let isValid = true;

    // 1. 비밀번호 형식 검사
    if (!passwordRegex.test(newPw)) {
        document.getElementById("newPw_error").innerHTML = "비밀번호는 영문 대/소문자, 숫자, 특수문자 중 2가지 이상 조합으로 8~12자로 입력하세요.";
        isValid = false;
    } else {
        document.getElementById("newPw_error").innerHTML = "";
    }

    // 2. 비밀번호 일치 검사
    if (newPw !== newPwChk) {
        document.getElementById("newPwChk_error").innerHTML = "비밀번호가 일치하지 않습니다.";
        isValid = false;
    } else {
        document.getElementById("newPwChk_error").innerHTML = "";
    }

    return isValid;
}

function goAdminChkChk(event) {
    const isValid = goAdminPwChk();

    if (!isValid) {
        event.preventDefault();
        alert("설정할 비밀번호를 확인해주세요.");
        return false;
    }

    if (!confirm("수정하시겠습니까?")) {
        event.preventDefault(); 
        return false;
    }

    alert("수정이 완료되었습니다.");
    return true;
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
function goPwChk() {
    const currentPw = document.getElementById("u_pw").value; 
    const newPw = document.getElementById("newPw").value;
    const newPwChk = document.getElementById("newPwChk").value;

    const passwordRegex = /^(?=.*[A-Za-z])(?=.*[\d!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,12}$/;

    let isValid = true;

    // 1. 비밀번호 형식 검사
    if (!passwordRegex.test(newPw)) {
        document.getElementById("newPw_error").innerHTML = "비밀번호는 영문 대/소문자, 숫자, 특수문자 중 2가지 이상 조합으로 8~12자로 입력하세요.";
        isValid = false;
    } else {
        document.getElementById("newPw_error").innerHTML = "";
    }

    // 2. 비밀번호 일치 검사
    if (newPw !== newPwChk) {
        document.getElementById("newPwChk_error").innerHTML = "비밀번호가 일치하지 않습니다.";
        isValid = false;
    } else {
        document.getElementById("newPwChk_error").innerHTML = "";
    }

    // 3. 기존 비밀번호와 동일한지 검사
   // if (newPw === currentPw) {
   //     document.getElementById("newPw_error").innerHTML = "새 비밀번호는 기존 비밀번호와 같을 수 없습니다.";
    //    alert("새 비밀번호는 기존 비밀번호와 같을 수 없습니다.");
   //     isValid = false;
   // } else if (isValid) {
   //     document.getElementById("newPw_error").innerHTML = ""; 

    return isValid;
}


function goChkChk(event) {
    const isValid = goPwChk();


    if (!isValid) {
        event.preventDefault(); 
        alert("설정할 비밀번호를 확인해주세요.");
        return false;
    }

    if (!confirm("수정하시겠습니까?")) {
        event.preventDefault();
        return false;
    }

    alert("수정이 완료되었습니다.");
    return true;
}



	

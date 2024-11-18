const nameInput = document.getElementById('u_name');
const nameImg = document.getElementById('nameimg');
const idInput = document.getElementById('u_id');
const idImg = document.getElementById('idimg');
const phoneInput = document.getElementById('u_pno');
const phoneImg = document.getElementById('phoneimg');

nameInput.addEventListener('focus', () => {
	nameImg.src = 'resources/img/login/name_o.png'; 
	const nameFormField = nameInput.closest('.form-field');
    nameFormField.style.borderBottom = '2px solid #ffd26e';
});
nameInput.addEventListener('blur', () => {
	nameImg.src = 'resources/img/login/name.png'; 
    const nameFormField = nameInput.closest('.form-field');
    nameFormField.style.borderBottom = '1px solid #000';
});

idInput.addEventListener('focus', () => {
    idImg.src = 'resources/img/login/id_o.png'; 
    const idFormField = idInput.closest('.form-field');
    idFormField.style.borderBottom = '2px solid #ffd26e';
});
idInput.addEventListener('blur', () => {
    idImg.src = 'resources/img/login/id.png'; 
    const idFormField = idInput.closest('.form-field');
    idFormField.style.borderBottom = '1px solid #000';
});

phoneInput.addEventListener('focus', () => {
	phoneImg.src = 'resources/img/login/phone_o.png'; 
	const phoneFormField = phoneInput.closest('.form-field');
    phoneFormField.style.borderBottom = '2px solid #ffd26e';
});
phoneInput.addEventListener('blur', () => {
	phoneImg.src = 'resources/img/login/phone.png'; 
    const phoneFormField = phoneInput.closest('.form-field');
    phoneFormField.style.borderBottom = '1px solid #000';
});

function clearErrorMessages() {
    const errorMessages = document.querySelectorAll('.error-message');
    errorMessages.forEach(msg => msg.textContent = '');
}

function validatePwFindForm() {
    clearErrorMessages();
    const formError = document.querySelector('#form-error');
    formError.textContent = '';
    let isValid = true;

    const name = document.querySelector('input[name="u_name"]');
    if (!name.value.trim()) {
        formError.textContent = "이름을 입력하세요.";
        isValid = false;
    }

    const phone = document.querySelector('input[name="u_pno"]');
    if (!phone.value.trim()) {
        formError.textContent = "전화번호를 입력하세요.";
        isValid = false;
    }

    const phoneCode = document.querySelector('input[name="phone2"]');
    const phoneDoubleChk = document.querySelector('#phoneDoubleChk').value;
    if (!phoneCode.value.trim()) {
        formError.textContent = "인증번호를 입력하세요.";
        isValid = false;
    } else if (phoneDoubleChk !== "true") {
        formError.textContent = "휴대폰 번호 인증을 완료해주세요.";
        isValid = false;
    }

    if (!isValid) {
        formError.style.display = 'block';
    }

    return isValid;
}

$(function() {
    var code2 = "";

    $("#phoneChk").click(function() {
        alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주세요.");
        var u_pno = $("#u_pno").val();
        
        $.ajax({
            type: "GET",
            url: "phoneCheck.do?u_pno=" + u_pno,
            cache: false,
            success: function(data) {
                if (data == "error") {
                    alert("휴대폰 번호가 올바르지 않습니다.");
                    $(".successPhoneChk").text("유효한 번호를 입력해주세요.");
                    $(".successPhoneChk").css("color", "red");
                    $("#u_pno").attr("autofocus", true);
                } else {
                    $("#phone2").attr("disabled", false);
                    $("#phoneChk2").css("display", "inline-block");
                    $(".successPhoneChk").text("인증번호를 입력한 뒤 본인인증을 눌러주세요.");
                    $(".successPhoneChk").css("color", "blue");
                    $("#u_pno").attr("readonly", true);
                    code2 = data;
                }
            }
        });
    });

    $("#phoneChk2").click(function() {
        if ($("#phone2").val() == code2) {
            $(".successPhoneChk").text("인증번호가 일치합니다.");
            $(".successPhoneChk").css("color", "blue");
            $("#phoneDoubleChk").val("true");
            $("#phone2").attr("disabled", true);
        } else {
            $(".successPhoneChk").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.");
            $(".successPhoneChk").css("color", "red");
            $("#phoneDoubleChk").val("false");
            $(this).attr("autofocus", true);
        }
    });
});

document.getElementById('pwFindForm').addEventListener('submit', function(event) {
    if (!validatePwFindForm()) {
        event.preventDefault();
    }
});

document.getElementById('pwFindForm').addEventListener('submit', function(event) {
    const nameInput = document.getElementById('u_name');
    const idInput = document.getElementById('u_id');
    const phoneInput = document.getElementById('u_pno');
    const phoneCodeInput = document.getElementById('phone2');
    const errorMessageDiv = document.getElementById('form-error');

    if (errorMessageDiv) {
        errorMessageDiv.textContent = '';
    }

    if (nameInput.value.trim() === '' || idInput.value.trim() === '' || phoneInput.value.trim() === '' || phoneCodeInput.value.trim() === '') {
        event.preventDefault();

        if (!errorMessageDiv) {
            const newErrorMessage = document.createElement('div');
            newErrorMessage.className = 'error-message';
            newErrorMessage.textContent = '모든 칸을 입력해주세요.';
            document.querySelector('.find-container').insertBefore(newErrorMessage, document.querySelector('.find-container').firstChild);
        } else {
            errorMessageDiv.textContent = '모든 칸을 입력해주세요.';
        }
    }
});


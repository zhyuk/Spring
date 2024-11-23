const nameInput = document.getElementById('u_name');
const phoneInput = document.getElementById('u_pno');
const phoneInput2 = document.getElementById('phone2');

nameInput.addEventListener('focus', () => {
    const nameInputText = nameInput.closest('.find-container input[type="text"]');
    nameInputText.style.border = '2px solid #ffd26e';
});
nameInput.addEventListener('blur', () => {
	const nameInputText = nameInput.closest('.find-container input[type="text"]');
    nameInputText.style.border = '2px solid #ccc';
});

phoneInput.addEventListener('focus', () => {
	const phoneInputText = phoneInput.closest('.find-container input[type="text"]');
    phoneInputText.style.border = '2px solid #ffd26e';
});
phoneInput.addEventListener('blur', () => {
	const phoneInputText = phoneInput.closest('.find-container input[type="text"]');
    phoneInputText.style.border = '2px solid #ccc';
});

phoneInput2.addEventListener('focus', () => {
	const phoneInputText2 = phoneInput2.closest('.find-container input[type="text"]');
    phoneInputText2.style.border = '2px solid #ffd26e';
});
phoneInput2.addEventListener('blur', () => {
	const phoneInputText2 = phoneInput2.closest('.find-container input[type="text"]');
    phoneInputText2.style.border = '2px solid #ccc';
});

function clearErrorMessages() {
    const errorMessages = document.querySelectorAll('.error-message');
    errorMessages.forEach(msg => msg.textContent = '');
}

function validateIdFindForm() {
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

$(function () {
    var code2 = ""; 
    var timerInterval = null; 
    var timeLeft = 240; 

    function updateTimer() {
        var minutes = Math.floor(timeLeft / 60);
        var seconds = timeLeft % 60;
        if (seconds < 10) {
            seconds = "0" + seconds; 
        }
        $('#timer').text("0" + minutes + ":" + seconds); 
        timeLeft--; 
        if (timeLeft < 0) {
            clearInterval(timerInterval); 
            $('#phone2').prop('disabled', true); 
            $('#phoneChk2').prop('disabled', true); 
            $("#form-error").text("인증번호 입력 시간이 초과되었습니다.").addClass("error").removeClass("success");
            $("#form-error").css("color", "red");
        }
    }

    $("#phoneChk").click(function(){ 
        alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주세요."); 
        var u_pno = $("#u_pno").val(); 
        
        $.ajax({ 
            type:"GET", 
            url:"phoneCheck.do?u_pno=" + u_pno, 
            cache : false, 
            success:function(data){ 
                if(data == "error"){ 
                    alert("휴대폰 번호가 올바르지 않습니다."); 
                    $("#form-error").text("유효한 번호를 입력해주세요.").addClass("error").removeClass("success"); 
                    $("#u_pno").attr("autofocus",true); 
                    $("#form-error").css("color", "red");
                } else { 
                    $("#phone2").attr("disabled", false); 
                    $("#phoneChk2").css("display", "inline-block");
                    $("#form-error").text("인증번호를 입력한 뒤 확인을 눌러주세요.").addClass("success").removeClass("error"); 
                    $("#u_pno").attr("readonly", true); 
                    $("#form-error").css("color", "black");

                    $('#timer').show();
                    timeLeft = 240; 
                    updateTimer();  
                    timerInterval = setInterval(updateTimer, 1000); 
                    code2 = data; 
                } 
            } 
        }); 
    });

    $("#phoneChk2").click(function(){ 
        if($("#phone2").val() == "") { 
            $("#form-error").text("인증번호를 입력해주세요.").addClass("error").removeClass("success"); 
            $("#form-error").css("color", "red");
        } else if($("#phone2").val() == code2){ 
            $("#form-error").text("인증번호가 일치합니다.").addClass("success").removeClass("error"); 
            $("#form-error").css("color", "blue");
            $("#phoneDoubleChk").val("true"); 
            $("#phone2").attr("disabled", true); 
            clearInterval(timerInterval); 
            $("#timer").hide();
        } else { 
            $("#form-error").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.").addClass("error").removeClass("success"); 
            $("#form-error").css("color", "red");
            $("#phoneDoubleChk").val("false"); 
            $(this).attr("autofocus", true); 
        }
    });
});

document.getElementById('idFindForm').addEventListener('submit', function(event) {
    if (!validateIdFindForm()) {
        event.preventDefault();
    }
});


document.getElementById('idFindForm').addEventListener('submit', function(event) {
    const nameInput = document.getElementById('u_name');
    const phoneInput = document.getElementById('u_pno');
    const phoneCodeInput = document.getElementById('phone2');
    const errorMessageDiv = document.getElementById('form-error');

    if (errorMessageDiv) {
        errorMessageDiv.textContent = '';
    }

    if (nameInput.value.trim() === '' || phoneInput.value.trim() === '' || phoneCodeInput.value.trim() === '') {
        event.preventDefault();

        if (!errorMessageDiv) {
            const newErrorMessage = document.createElement('div');
            newErrorMessage.className = 'error-message';
            newErrorMessage.textContent = '모든 칸을 입력해주세요.';
            newErrorMessage.style.color = 'red';
            document.querySelector('.find-container').insertBefore(newErrorMessage, document.querySelector('.find-container').firstChild);
        } else {
            errorMessageDiv.textContent = '모든 칸을 입력해주세요.';
        }
    }
});

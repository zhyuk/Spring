const idInput = document.getElementById('id');
const pwInput = document.getElementById('password');
const cpwInput = document.getElementById('password2');
const nameInput = document.getElementById('name');
const nicknameInput = document.getElementById('nickname');
const emailInput = document.getElementById('email');
const phoneInput = document.getElementById('u_pno');
const phoneInput2 = document.getElementById('phone2');
const postcodeInput = document.getElementById('sample4_postcode');
const roadAddressInput = document.getElementById('sample4_roadAddress');
const jibunAddressInput = document.getElementById('sample4_jibunAddress');
const detailAddressInput = document.getElementById('sample4_detailAddress');
const extraAddressInput = document.getElementById('sample4_extraAddress');

idInput.addEventListener('focus', () => {
    const idInputText = idInput.closest('.signup-container input[type="text"]');
    idInputText.style.border = '2px solid #ffd26e';
});
idInput.addEventListener('blur', () => {
    const idInputText = idInput.closest('.signup-container input[type="text"]');
    idInputText.style.border = '2px solid #ccc';
});

pwInput.addEventListener('focus', () => {
    const pwInputText = pwInput.closest('.signup-container input[type="password"]');
    pwInputText.style.border = '2px solid #ffd26e';
});
pwInput.addEventListener('blur', () => {
    const pwInputText = pwInput.closest('.signup-container input[type="password"]');
    pwInputText.style.border = '2px solid #ccc';
});

cpwInput.addEventListener('focus', () => {
    const cpwInputText = cpwInput.closest('.signup-container input[type="password"]');
    cpwInputText.style.border = '2px solid #ffd26e';
});
cpwInput.addEventListener('blur', () => {
    const cpwInputText = cpwInput.closest('.signup-container input[type="password"]');
    cpwInputText.style.border = '2px solid #ccc';
});

nameInput.addEventListener('focus', () => {
    const nameInputText = nameInput.closest('.signup-container input[type="text"]');
    nameInputText.style.border = '2px solid #ffd26e';
});
nameInput.addEventListener('blur', () => {
	const nameInputText = nameInput.closest('.signup-container input[type="text"]');
    nameInputText.style.border = '2px solid #ccc';
});

nicknameInput.addEventListener('focus', () => {
    const nicknameInputText = nicknameInput.closest('.signup-container input[type="text"]');
    nicknameInputText.style.border = '2px solid #ffd26e';
});
nicknameInput.addEventListener('blur', () => {
	const nicknameInputText = nicknameInput.closest('.signup-container input[type="text"]');
    nicknameInputText.style.border = '2px solid #ccc';
});

emailInput.addEventListener('focus', () => {
    const emailInputText = emailInput.closest('.signup-container input[type="text"]');
    emailInputText.style.border = '2px solid #ffd26e';
});
emailInput.addEventListener('blur', () => {
	const emailInputText = emailInput.closest('.signup-container input[type="text"]');
    emailInputText.style.border = '2px solid #ccc';
});

phoneInput.addEventListener('focus', () => {
	const phoneInputText = phoneInput.closest('.signup-container input[type="text"]');
    phoneInputText.style.border = '2px solid #ffd26e';
});
phoneInput.addEventListener('blur', () => {
	const phoneInputText = phoneInput.closest('.signup-container input[type="text"]');
    phoneInputText.style.border = '2px solid #ccc';
});

phoneInput2.addEventListener('focus', () => {
	const phoneInputText2 = phoneInput2.closest('.signup-container input[type="text"]');
    phoneInputText2.style.border = '2px solid #ffd26e';
});
phoneInput2.addEventListener('blur', () => {
	const phoneInputText2 = phoneInput2.closest('.signup-container input[type="text"]');
    phoneInputText2.style.border = '2px solid #ccc';
});

postcodeInput.addEventListener('focus', () => {
	const postcodeInputText = postcodeInput.closest('.signup-container input[type="text"]');
    postcodeInputText.style.border = '2px solid #ffd26e';
});
postcodeInput.addEventListener('blur', () => {
	const postcodeInputText = postcodeInput.closest('.signup-container input[type="text"]');
    postcodeInputText.style.border = '2px solid #ccc';
});

roadAddressInput.addEventListener('focus', () => {
	const roadAddressInputText = roadAddressInput.closest('.signup-container input[type="text"]');
    roadAddressInputText.style.border = '2px solid #ffd26e';
});
roadAddressInput.addEventListener('blur', () => {
	const roadAddressInputText = roadAddressInput.closest('.signup-container input[type="text"]');
    roadAddressInputText.style.border = '2px solid #ccc';
});

jibunAddressInput.addEventListener('focus', () => {
	const jibunAddressInputText = jibunAddressInput.closest('.signup-container input[type="text"]');
    jibunAddressInputText.style.border = '2px solid #ffd26e';
});
jibunAddressInput.addEventListener('blur', () => {
	const jibunAddressInputText = jibunAddressInput.closest('.signup-container input[type="text"]');
    jibunAddressInputText.style.border = '2px solid #ccc';
});

detailAddressInput.addEventListener('focus', () => {
	const detailAddressInputText = detailAddressInput.closest('.signup-container input[type="text"]');
    detailAddressInputText.style.border = '2px solid #ffd26e';
});
detailAddressInput.addEventListener('blur', () => {
	const detailAddressInputText = detailAddressInput.closest('.signup-container input[type="text"]');
    detailAddressInputText.style.border = '2px solid #ccc';
});

extraAddressInput.addEventListener('focus', () => {
	const extraAddressInputText = extraAddressInput.closest('.signup-container input[type="text"]');
    extraAddressInputText.style.border = '2px solid #ffd26e';
});
extraAddressInput.addEventListener('blur', () => {
	const extraAddressInputText = extraAddressInput.closest('.signup-container input[type="text"]');
    extraAddressInputText.style.border = '2px solid #ccc';
});

function clearErrorMessages() {
    const errorMessages = document.querySelectorAll('.error-message');
    errorMessages.forEach(msg => msg.textContent = '');
}

function validateId() {
    const id = document.querySelector('input[name="u_id"]');
    const idError = document.querySelector('#id-error');
    const idRegex = /^[a-z][a-z0-9]{5,19}$/;
    
    idError.className = 'error-message'; 

    if (id.value.includes('admin')) {
        idError.textContent = '아이디에 "admin"을 포함할 수 없습니다.';
    } else if (!idRegex.test(id.value)) {
        idError.textContent = '아이디는 영문으로 시작하고, 영문 소문자와 숫자로 6~20자 입력하세요.';
    } else {
        idError.textContent = '';
    }
}

function validatePassword() {
    const password = document.querySelector('input[name="u_pw"]');
    const passwordError = document.querySelector('#password-error');
    const passwordRegex = /^(?=.*[A-Za-z])(?=.*\d|.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,20}$/;

    if (!passwordRegex.test(password.value)) {
        passwordError.textContent = '비밀번호는 영문 대/소문자, 숫자, 특수문자 중 2가지 이상으로 8~20자 입력하세요.';
    } else {
        passwordError.textContent = '';
    }
}

function validateCheckPassword() {
    const password = document.querySelector('input[name="u_pw"]');
    const checkPassword = document.querySelector('input[name="check_pw"]');
    const checkPasswordError = document.querySelector('#check-password-error');

    if (password.value !== checkPassword.value) {
        checkPasswordError.textContent = '비밀번호가 일치하지 않습니다.';
    } else {
        checkPasswordError.textContent = '';
    }
}

function validateName() {
    const name = document.querySelector('input[name="u_name"]');
    const nameError = document.querySelector('#name-error');
    const nameRegex = /^(?:(?=.*[가-힣]{2,7})[가-힣]{2,7}|(?=.*[a-zA-Z]{2,21})[a-zA-Z]{2,21})$/;

    if (!nameRegex.test(name.value)) {
        nameError.textContent = '이름은 한글 2~7자 또는 영문 2~21자로 입력하세요.';
    } else {
        nameError.textContent = '';
    }
}

function validateNickname() {
    const nickname = document.querySelector('input[name="u_nickname"]');
    const nicknameError = document.querySelector('#nickname-error');
    const nicknameRegex = /^(?:(?=.*[가-힣]{2,8})[가-힣]{2,8}|(?=.*[a-zA-Z]{2,24})[a-zA-Z]{2,24})$/;

    if (!nicknameRegex.test(nickname.value)) {
        nicknameError.textContent = '닉네임은 한글 2~8자 또는 영문 2~24자로 입력하세요.';
    } else {
        nicknameError.textContent = '';
    }
}

function validateEmail() {
    const email = document.querySelector('input[name="u_email"]');
    const emailError = document.querySelector('#email-error');
    const emailRegex = /^[a-zA-Z0-9]{1,24}@[a-zA-Z]{1,24}\.[a-zA-Z]{2,6}$/;

    if (!emailRegex.test(email.value)) {	
        emailError.textContent = '이메일은 형식에 맞추어 24자 이내로 입력하세요.';
    } else {
        emailError.textContent = '';
    }
}

document.querySelector('input[name="u_id"]').addEventListener('input', validateId);
document.querySelector('input[name="u_pw"]').addEventListener('input', validatePassword);
document.querySelector('input[name="check_pw"]').addEventListener('input', validateCheckPassword);
document.querySelector('input[name="u_name"]').addEventListener('input', validateName);
document.querySelector('input[name="u_nickname"]').addEventListener('input', validateNickname);
document.querySelector('input[name="u_email"]').addEventListener('input', validateEmail);

let isIdValid = false;
let isNnValid = false;

document.querySelector('.check-btn').addEventListener('click', function() {
    const userId = document.querySelector('input[name="u_id"]').value;
    const idError = document.querySelector('#id-error');
    
    if (userId) {
        fetch('/checkUserId.do', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: `u_id=${userId}`
        })
        .then(response => response.text())
        .then(data => {
            if (data === '사용할 수 있는 아이디입니다.') {
                idError.textContent = data;
                idError.className = 'success-message'; 
                isIdValid = true;
            } else {
                idError.textContent = data;
                idError.className = 'error-message';
                isIdValid = false;
            }
        })
        .catch(error => console.error('Error:', error));
    } else {
        idError.textContent = '아이디를 입력하세요.';
        idError.className = 'error-message';
        isIdValid = false;
    }
});

document.querySelector('.check-btn2').addEventListener('click', function() {
    const userNn = document.querySelector('input[name="u_nickname"]').value;
    const nnError = document.querySelector('#nickname-error');
    
    if (userNn) {
        fetch('/checkUserNn.do', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: `u_nickname=${userNn}`
        })
        .then(response => response.text())
        .then(data => {
            if (data === '사용할 수 있는 닉네임입니다.') {
                nnError.textContent = data;
                nnError.className = 'success-message';
                isNnValid = true;
            } else {
                nnError.textContent = data;
                nnError.className = 'error-message';
                isNnValid = false;
            }
        })
        .catch(error => console.error('Error:', error));
    } else {
        nnError.textContent = '닉네임을 입력하세요.';
        nnError.className = 'error-message';
        isNnValid = false;
    }
});

document.getElementById('eye').addEventListener('click', function () {
    const passwordInput = document.getElementById('password');
    const passwordType = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
    passwordInput.setAttribute('type', passwordType);

    const img = this.querySelector('img');
    img.src = passwordType === 'password' ? 'resources/img/login/ceye.png' : 'resources/img/login/eye.png'; 
});

document.getElementById('eye2').addEventListener('click', function () {
    const passwordInput = document.getElementById('password2');
    const passwordType = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
    passwordInput.setAttribute('type', passwordType);

    const img = this.querySelector('img');
    img.src = passwordType === 'password' ? 'resources/img/login/ceye.png' : 'resources/img/login/eye.png'; 
});

$(function () {
    var code2 = ""; 
    var timerInterval = null; 
    var timeLeft = 120; 

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
            $("#phone-error").text("인증번호 입력 시간이 초과되었습니다.").addClass("error").removeClass("success");
            $("#phone-error").css("color", "red");
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
                    $("#phone-error").text("유효한 번호를 입력해주세요.").addClass("error").removeClass("success"); 
                    $("#u_pno").attr("autofocus",true); 
                    $("#phone-error").css("color", "red");
                } else { 
                    $("#phone2").attr("disabled", false); 
                    $("#phoneChk2").css("display", "inline-block");
                    $("#phone-error").text("인증번호를 입력한 뒤 확인을 눌러주세요.").addClass("success").removeClass("error"); 
                    $("#u_pno").attr("readonly", true); 
                    $("#phone-error").css("color", "black");

                    // 타이머 시작
                    $('#timer').show();
                    timeLeft = 120; 
                    updateTimer();  
                    timerInterval = setInterval(updateTimer, 1000); 
                    code2 = data; 
                } 
            } 
        }); 
    });

    $("#phoneChk2").click(function(){ 
        if($("#phone2").val() == "") { 
            $("#phone-error").text("인증번호를 입력해주세요.").addClass("error").removeClass("success"); 
            $("#phone-error").css("color", "red");
        } else if($("#phone2").val() == code2){ 
            $("#phone-error").text("인증번호가 일치합니다.").addClass("success").removeClass("error"); 
            $("#phone-error").css("color", "blue");
            $("#phoneDoubleChk").val("true"); 
            $("#phone2").attr("disabled", true); 
            clearInterval(timerInterval); 
            $("#timer").hide();
        } else { 
            $("#phone-error").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.").addClass("error").removeClass("success"); 
            $("#phone-error").css("color", "red");
            $("#phoneDoubleChk").val("false"); 
            $(this).attr("autofocus", true); 
        }
    });
});

function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var roadAddr = data.roadAddress;
            var extraRoadAddr = ''; 

            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            document.getElementById('sample4_postcode').value = data.zonecode;
            document.getElementById("sample4_roadAddress").value = roadAddr;
            document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
            
            if(roadAddr !== '' || extraRoadAddr !== '') {
                document.getElementById("sample4_extraAddress").value = extraRoadAddr;
            } else {
                document.getElementById("sample4_extraAddress").value = '';
            }

            var guideTextBox = document.getElementById("guide");
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';
            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
        }
    }).open();
}

function validateForm() {
    clearErrorMessages();
    const formError = document.querySelector('#form-error');
    formError.textContent = '';
    let isValid = true;
    
	const allFields = [
	    'input[name="u_id"]',
	    'input[name="u_pw"]',
	    'input[name="check_pw"]',
	    'input[name="u_name"]',
	    'input[name="u_nickname"]',
	    'input[name="u_email"]',
	    'input[name="u_pno"]',
	    'input[name="u_address"]'
	];
	
	for (let fieldSelector of allFields) {
	    const field = document.querySelector(fieldSelector);
	    if (!field.value.trim()) {
	        isValid = false;
	        break; 
	    }
	}
	
	if (!isValid) {
	    formError.textContent = "모든 칸을 입력해주세요.";
	    return false;
	}

    validateId();
    validatePassword();
    validateCheckPassword();
    validateName();
    validateNickname();
    validateEmail();

    if (document.querySelector('#id-error').textContent ||
        document.querySelector('#password-error').textContent ||
        document.querySelector('#check-password-error').textContent ||
        document.querySelector('#name-error').textContent ||
        document.querySelector('#nickname-error').textContent ||
        document.querySelector('#email-error').textContent ||
        !isIdValid ||
        !isNnValid) {
        isValid = false;
        formError.textContent = "입력창을 다시 확인하시거나 중복검사를 해주세요";
    }
    
    const postcode = document.getElementById('sample4_postcode').value.trim();
    const roadAddr = document.getElementById('sample4_roadAddress').value.trim();
    const detailAddr = document.getElementById('sample4_detailAddress').value.trim();

    if (!roadAddr) {
        formError.textContent = "주소를 입력해 주세요.";
        isValid = false;
    }

    if (detailAddr) {
        document.querySelector('input[name="u_address"]').value = postcode + ' ' + roadAddr + ' ' + detailAddr;
    } else {
        document.querySelector('input[name="u_address"]').value = postcode + ' ' + roadAddr;
    }
    
    const phoneDoubleChk = document.getElementById('phoneDoubleChk').value;
    if (phoneDoubleChk !== "true") {
        formError.textContent = "휴대폰 번호 인증을 완료해주세요.";
        isValid = false;
    }

    return isValid;
}

function clearErrorMessages() {
    const errorMessages = document.querySelectorAll('.error-message');
    errorMessages.forEach(msg => msg.textContent = '');
}

function validateId() {
    const id = document.querySelector('input[name="u_id"]');
    const idError = document.querySelector('#id-error');
    const idRegex = /^[a-z][a-z0-9]{5,9}$/;
    
    idError.className = 'error-message'; 

    if (!idRegex.test(id.value)) {
        idError.textContent = '아이디는 영문으로 시작하고, 영문 소문자와 숫자로 6~10자 입력하세요.';
    } else {
        idError.textContent = '';
    }
}

function validatePassword() {
    const password = document.querySelector('input[name="u_pw"]');
    const passwordError = document.querySelector('#password-error');
    const passwordRegex = /^(?=.*[A-Za-z])(?=.*\d|.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,12}$/;

    if (!passwordRegex.test(password.value)) {
        passwordError.textContent = '비밀번호는 영문 대/소문자, 숫자, 특수문자 중 2가지 이상으로 8~12자 입력하세요.';
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
    const emailRegex = /^[a-zA-Z]{1,24}@[a-zA-Z]{1,24}\.[a-zA-Z]{2,6}$/;

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

function validateForm() {
    clearErrorMessages();
    const formError = document.querySelector('#form-error');
    formError.textContent = '';
    let isValid = true;

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
        !isNicknameValid) {
        isValid = false;
        formError.textContent = "입력창을 다시 확인하시거나 중복검사를 해주세요";
    }

    return isValid;
}

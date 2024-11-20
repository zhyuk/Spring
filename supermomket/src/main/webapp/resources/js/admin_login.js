const idInput = document.getElementById('uid');
const idImg = document.getElementById('idimg');
const pwInput = document.getElementById('upw');
const pwImg = document.getElementById('pwimg');

idInput.addEventListener('focus', () => {
    const idFormField = idInput.closest('.form-field');
    idFormField.style.borderBottom = '2px solid #fff';
});
idInput.addEventListener('blur', () => {
    const idFormField = idInput.closest('.form-field');
    idFormField.style.borderBottom = '2px solid #000';
});

pwInput.addEventListener('focus', () => {
    const pwFormField = pwInput.closest('.form-field');
    pwFormField.style.borderBottom = '2px solid #fff';
});
pwInput.addEventListener('blur', () => {
    const pwFormField = pwInput.closest('.form-field');
    pwFormField.style.borderBottom = '2px solid #000'; 
});


document.getElementById('eye').addEventListener('click', function () {
    const passwordInput = document.getElementById('upw');
    const passwordType = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
    passwordInput.setAttribute('type', passwordType);

    const img = this.querySelector('img');
    img.src = passwordType === 'password' ? 'resources/img/login/aceye.png' : 'resources/img/login/aeye.png'; 
});

window.onload = function() {
    const sessionUserId = sessionStorage.getItem('userId');
    if (sessionUserId) {
        sessionStorage.removeItem('userId');
        window.location.href = 'login.do';
    }
};

window.onload = function() {
    document.getElementById('uid').value = '';
    document.getElementById('upw').value = '';
};

document.getElementById('loginForm').addEventListener('submit', function(event) {
    const idInput = document.getElementById('uid');
    const pwInput = document.getElementById('upw');
    const errorMessageDiv = document.querySelector('.error-message');

    if (errorMessageDiv) {
        errorMessageDiv.textContent = '';
    }

    if (idInput.value.trim() === '' || pwInput.value.trim() === '') {
        event.preventDefault();  
        if (!errorMessageDiv) {
            const newErrorMessage = document.createElement('div');
            newErrorMessage.className = 'error-message';
            newErrorMessage.textContent = '모든 칸을 입력해주세요.';
            document.querySelector('.login-container').insertBefore(newErrorMessage, document.querySelector('.login-container').firstChild);
        } else {
            errorMessageDiv.textContent = '모든 칸을 입력해주세요.';
        }
    }
});

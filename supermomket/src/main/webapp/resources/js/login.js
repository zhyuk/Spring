document.addEventListener("DOMContentLoaded", function() {
    const savedId = localStorage.getItem("savedId");
    const saveIdCheckbox = document.querySelector('input[name="SaveID"]');

    if (savedId) {
        document.querySelector('input[name="u_id"]').value = savedId;
        saveIdCheckbox.checked = true; 
    }

    // 로그인 폼 제출 이벤트 처리
    const loginForm = document.getElementById("loginForm");
    loginForm.addEventListener("submit", function(event) {
        const userId = document.querySelector('input[name="u_id"]').value;

        if (saveIdCheckbox.checked) {
            localStorage.setItem("savedId", userId);
        } else {
            localStorage.removeItem("savedId");
        }
    });
});


const idInput = document.getElementById('uid');
const idImg = document.getElementById('idimg');
const pwInput = document.getElementById('upw');
const pwImg = document.getElementById('pwimg');

idInput.addEventListener('focus', () => {
    idImg.src = 'resources/img/login/sid.png'; 
});
idInput.addEventListener('blur', () => {
    idImg.src = 'resources/img/login/id.png'; 
});

pwInput.addEventListener('focus', () => {
    pwImg.src = 'resources/img/login/spw.png'; 
});
pwInput.addEventListener('blur', () => {
    pwImg.src = 'resources/img/login/pw.png'; 
});


document.getElementById('eye').addEventListener('click', function () {
    const passwordInput = document.getElementById('upw');
    const passwordType = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
    passwordInput.setAttribute('type', passwordType);

    const img = this.querySelector('img');
    img.src = passwordType === 'password' ? 'resources/img/login/ceye.png' : 'resources/img/login/eye.png'; 
});
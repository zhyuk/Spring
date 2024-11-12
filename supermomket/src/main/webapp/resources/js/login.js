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

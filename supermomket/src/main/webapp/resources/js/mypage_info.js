// splitAddress: DB에서 불러온 전체 주소를 우편번호, 도로명, 추가주소, 상세주소로 분리
function splitAddress(fullAddress) {
    const zipCodeMatch = fullAddress.match(/^\d{5}/); // 우편번호 추출
    const zipCode = zipCodeMatch ? zipCodeMatch[0] : '';

    const remainingAddress = fullAddress.replace(zipCode, '').trim(); // 우편번호 제거
    const extraAddressMatch = remainingAddress.match(/\((.*?)\)/);    // 추가 주소 추출
    const extraAddress = extraAddressMatch ? extraAddressMatch[1] : '';

    const addressWithoutExtra = remainingAddress.replace(/\(.*?\)/, '').trim(); // 추가 주소 제거
    const parts = addressWithoutExtra.split(' ');

    const roadAddress = parts.slice(0, -1).join(' ') || '';  // 도로명 주소
    const detailAddress = parts[parts.length - 1] || '';     // 상세주소

    return { zipCode, roadAddress, extraAddress, detailAddress };
}

// sample4_execDaumPostcode: 우편번호 검색 후 주소 필드 업데이트
function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function (data) {
            let roadAddr = data.roadAddress;  // 도로명 주소
            let extraRoadAddr = '';  // 추가 주소 (건물명, 아파트명 등)

            if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                extraRoadAddr += data.bname;
            }

            if (data.buildingName !== '') {
                extraRoadAddr += (extraRoadAddr ? ', ' : '') + data.buildingName;
            }

            if (extraRoadAddr !== '') {
                extraRoadAddr = ` (${extraRoadAddr})`;
            }

            document.getElementById('sample4_postcode').value = data.zonecode;  // 우편번호
            document.getElementById('sample4_roadAddress').value = roadAddr + extraRoadAddr;   // 도로명 주소 + 추가 주소
            document.getElementById('sample4_detailAddress').value = '';       // 상세주소 초기화

            const fullAddress = `${data.zonecode} ${roadAddr}${extraRoadAddr}`;
            document.getElementById('u_address').value = fullAddress;

            console.log("최종 주소:", fullAddress);  // 디버깅용
        }
    }).open();
}

// form 초기화 시, DB의 주소를 필드에 나눠서 넣어줌
document.addEventListener("DOMContentLoaded", function () {
    if (typeof uAddress !== 'undefined' && uAddress) {
        const { zipCode, roadAddress, extraAddress, detailAddress } = splitAddress(uAddress);
        document.getElementById("sample4_postcode").value = zipCode || "";
        document.getElementById("sample4_roadAddress").value = `${roadAddress} ${extraAddress}`.trim();
        document.getElementById("sample4_detailAddress").value = detailAddress || "";
        document.getElementById("u_address").value = uAddress; // hidden 필드에 전체 주소 저장
    }
});

// form 제출 시 주소 조합
document.querySelector("form[name='mp_updateForm']").addEventListener("submit", function() {
    const zipcode = document.getElementById("sample4_postcode").value;
    const roadAddress = document.getElementById("sample4_roadAddress").value;
    const detailAddress = document.getElementById("sample4_detailAddress").value;
    document.getElementById("u_address").value = `${zipcode} ${roadAddress} ${detailAddress}`;
});
function goValidateForm(event) {
    const nickname = document.getElementById("floatingNickname").value.trim();
    const email = document.getElementById("floatingEmail").value.trim();
    const pno = document.getElementById("floatingPhone").value.trim();
    const address = document.getElementById("sample4_detailAddress").value.trim();
    const nicknameCk =  document.getElementById("nicknameCk").value.trim();
    const ori_nickname =  document.getElementById("ori_nickname").value.trim();

    let isValid = true;

    const nicknameRegex = /^(?:(?=.*[가-힣]{2,8})[가-힣]{2,8}|(?=.*[a-zA-Z]{2,24})[a-zA-Z]{2,24})$/;
    const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;

    if (!nickname || !nicknameRegex.test(nickname)) {
        document.getElementById("nickError").innerHTML = "닉네임은 한글 2~8자 또는 영문 2~24자로 입력하세요.";
        isValid = false;
    } else {
        document.getElementById("nickError").innerHTML = "";
    }

    if (!email || !emailRegex.test(email)) {
        document.getElementById("emailError").innerHTML = "이메일 형식이 올바르지 않습니다.";
        isValid = false;
    } else {
        document.getElementById("emailError").innerHTML = "";
    }
    
    if((nickname != ori_nickname) && nicknameCk != 'Y'){
      //alert('닉네임 중복 체크를 해주세요.');
      document.getElementById("nickError").innerHTML = "닉네임 중복 체크를 해주세요.";
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

function validateNickname(nickname) {
    const nicknameRegex = /^(?:(?=.*[가-힣]{2,8})[가-힣]{2,8}|(?=.*[a-zA-Z]{2,24})[a-zA-Z]{2,24})$/;
    const nickNmError = document.querySelector('#nickError');

    if (!nicknameRegex.test(nickname)) {
        nickNmError.textContent = '닉네임은 한글 2~8자 또는 영문 2~24자로 입력하세요.';
        nickNmError.classList.add('error-message');
    } else {
        nickNmError.textContent = '';
        nickNmError.classList.remove('error-message');
        document.getElementById("nicknameCk").value = 'Y';
    }
    
}

function checkNickname() {
    const nickNm = document.querySelector('input[name="u_nickname"]').value.trim();
    const nickNmError = document.querySelector('#nickError');

    if (!nickNm) {
        nickNmError.textContent = '닉네임을 입력하세요.';
        nickNmError.classList.add('error-message');
        nickNmError.classList.remove('success-message');
        return;
    }

    fetch(`/nickChk.do`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: `u_nickname=${encodeURIComponent(nickNm)}`
    })
        .then(response => response.text())
        .then(data => {
            data = data.trim();
            nickNmError.textContent = data;
            if (data === '사용할 수 있는 닉네임입니다.') {
                nickNmError.classList.remove('error-message');
                nickNmError.classList.add('success-message');
                document.getElementById("nicknameCk").value = 'Y';
            } else {
                nickNmError.classList.remove('success-message');
                nickNmError.classList.add('error-message');
            }
        })
        .catch(error => {
            console.error('Error:', error);
            nickNmError.textContent = '서버 요청 중 오류가 발생했습니다.';
            nickNmError.classList.add('error-message');
            nickNmError.classList.remove('success-message');
        });
}

function confirmTaltae() {
    if (confirm("탈퇴하시겠습니까?")) {
        fetch('/taltaeUser.do', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: `u_id=${encodeURIComponent(uId)}`
        })
        .then(response => response.text())
        .then(data => {
            alert('회원 탈퇴가 완료되었습니다.');
            window.location.href = '/logout.do';
        })
        .catch(error => {
            console.error('Error:', error);
            alert('탈퇴 처리 중 오류가 발생했습니다.');
        });
    } else {
        alert("탈퇴가 취소되었습니다.");
    }
}

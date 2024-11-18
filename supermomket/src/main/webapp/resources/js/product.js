// 서버에 데이터를 전송하는 함수
function sendProductDetails() {
    // form 요소 가져오기
    const form = document.getElementById("productForm");
    
    // 필요한 정보 가져오기
    const quantity = parseInt(document.getElementById("quantity").value);
    const productId = form.querySelector("input[name='p_no']").value;
    const userId = form.querySelector("input[name='u_id']").value;  // 로그인 여부 확인용
    const p_discount = parseInt(document.querySelector(".product-discount .discounted-price").dataset.price);
    const productName = form.querySelector("input[name='p_name']").value;
    const imageUrl = `${form.querySelector("input[name='p_img']").value}`;
    const p_callno = `${form.querySelector("input[name='p_callno']").value}`;
	
    // userId가 없는 경우 로그인 페이지로 이동
    if (!userId) {

        window.location.href = "/login.do";  // 로그인 페이지로 리디렉트
        return;
    }

    // JSON으로 전송할 데이터 생성
    const data = {
        userId: userId,
        productId: productId,
        quantity: quantity,
        price: p_discount,  // 할인 가격을 price로 설정
        productName: productName,
        p_callno: p_callno,
        imageUrl: imageUrl
    };

    // AJAX 요청 보내기
    $.ajax({
        url: 'insertcart.do',  // 서버의 URL 지정
        type: 'POST',
        contentType: 'application/json; charset=UTF-8',
        data: JSON.stringify(data),  // data 객체를 JSON 문자열로 변환하여 전송
        success: function(response) {
            console.log("서버로 데이터 전송 성공:", response);
            
        },
        error: function(xhr, status, error) {
            console.error("데이터 전송 실패:", error);
            alert("장바구니 추가에 실패했습니다.");
        }
    });
}

// 장바구니 버튼 클릭 시 AJAX 요청 실행
document.addEventListener("DOMContentLoaded", function() {
    const cartButton = document.querySelector(".cart-button");
    if (cartButton) {
        cartButton.addEventListener("click", function (event) {
            event.preventDefault(); // 기본 폼 제출 방지
            sendProductDetails();
        });
    } else {
        console.warn("장바구니 버튼을 찾을 수 없습니다.");
    }
});

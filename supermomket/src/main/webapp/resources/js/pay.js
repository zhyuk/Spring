
//모달 보이기
document.addEventListener("DOMContentLoaded", function() {
    const cancelPayButton = document.querySelector(".cancelpaymodel");
    const cancelPayOverlay = document.createElement("div");
    cancelPayOverlay.className = "cancelpay-overlay";
    document.body.appendChild(cancelPayOverlay);

    const cancelPayContent = document.querySelector(".cancelpaydiv");
    cancelPayContent.classList.add("cancelpay-content");
    cancelPayOverlay.appendChild(cancelPayContent);

    // 모달 열기: 결제 취소 버튼 클릭 시 모달 표시
    cancelPayButton.addEventListener("click", function(event) {
        event.preventDefault();
        cancelPayOverlay.style.display = "flex";
    });

    // 모달 닫기: 배경 클릭 시 모달 닫기
    cancelPayOverlay.addEventListener("click", function(event) {
        if (event.target === cancelPayOverlay) {
            cancelPayOverlay.style.display = "none";
        }
    });
});


function productdtail(val) {
    // 예: detail페이지로 이동
    window.location.href = "detail.do?p_no="+val;
}

	
	
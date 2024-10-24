window.onload = function () {

    const form = document.getElementById("writeForm");

    form.addEventListener("submit", (event) => {
        let inputValue = false; 
        console.log(inputValue);

        document.querySelectorAll(".inputData").forEach((item) => {
            if (item.value === '' || item.value === null) {
                inputValue = true; 
                console.log(inputValue);
            }
        });

        if (inputValue) {
            event.preventDefault(); // 제출 방지
            alert("모든 입력창은 필수입력요소입니다.");
        } else {
            alert("성공!");
        }
    });

};
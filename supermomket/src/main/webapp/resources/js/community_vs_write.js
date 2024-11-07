window.onload = function () {

  const form = document.getElementById("writeForm");

  form.addEventListener("submit", (event) => {
    
    let inputValue = false;
    // console.log(inputValue);

    document.querySelectorAll(".inputData").forEach((item) => {
      if (item.value === '' || item.value === null) {
        inputValue = true;
        // console.log(inputValue);
      }
    });

    if (inputValue) {
      event.preventDefault(); // 제출 방지
      alert("모든 입력창은 필수입력요소입니다.");
    } else {

        alert("성공");
    }
  });
};

// 이미지 미리보기
function readURL(input) {
  // console.log(input.getAttribute("name"));
  if (input.getAttribute("name") == 'vs_img1_file' && input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function (e) {
      document.getElementById('img1_preview').src = e.target.result;
    };
    reader.readAsDataURL(input.files[0]);
  }

  if (input.getAttribute("name") == 'vs_img2_file' && input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function (e) {
      document.getElementById('img2_preview').src = e.target.result;
    };
    reader.readAsDataURL(input.files[0]);
  }
}
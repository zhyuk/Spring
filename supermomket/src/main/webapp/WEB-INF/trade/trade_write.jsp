<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ include file="../view/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<title>중고거래 글쓰기</title>
</head>
<style>


.write-form {
    max-width: 600px;
    margin: 0 auto;
    padding: 20px;
}

.image-upload {
    width: 100px;
    height: 100px;
    border: 1px dashed #ccc;
    border-radius: 4px;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    cursor: pointer;
    margin-bottom: 20px;
    position: relative;
    margin-top:40px;
}

.image-upload i {
    font-size: 24px;
    color: #999;
    margin-bottom: 5px;
}
.image-preview-container {
    display: flex;
    gap: 10px;
    margin-top: 10px;
    flex-wrap: wrap;
}

.preview-item img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.preview-item {
    position: relative;
    width: 100px;
    height: 100px;
    border-radius: 4px;
    overflow: hidden;
}

.image-preview {
    width: 100px;
    height: 100px;
    object-fit: cover;
    border-radius: 4px;
}
.image-count {
    position: absolute;
    bottom: -25px;
    left: 0;
    width: 100%;
    text-align: center;
    font-size: 12px;
    color: #999;
}

.delete-button:hover {
    background-color: rgba(0, 0, 0, 0.7);
}

.delete-button {
    position: absolute;
    top: 5px;
    right: 5px;
    width: 20px;
    height: 20px;
    background-color: #999;
    color: white;
    border: none;
    border-radius: 50%;
    cursor: pointer;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 12px;
    z-index: 2;
}

.input-category-container {
    width: 100%;
    margin-bottom: 15px;
}



.product-input, .category-list {
    width: 100%;
    padding: 10px;
    border: 1px solid #e0e0e0;
    border-radius: 4px;
    font-size: 14px;
    box-sizing: border-box;
}

.category-list {
    list-style: none;
    padding: 0;
    margin: 0;
}

.category-option {
    padding: 10px;
    border-bottom: 1px solid #f0f0f0;
    cursor: pointer;
}

.category-option:last-child {
    border-bottom: none;
}

.category-option:hover {
    background-color: #f9f9f9;
}

.category-option.selected {
    background-color: #e0e0e0;
}

.price-container {
    display: flex;
    align-items: center;
    margin-bottom: 15px;
    margin-top : 15px;
}

.price-input {
    flex: 1;
    padding: 10px;
    border: 1px solid #e0e0e0;
    border-radius: 4px;
    font-size: 14px;
    box-sizing: border-box;
}



.description-container {
    margin-bottom: 15px;
}

.description-textarea {
    width: 100%;
    height: 150px;
    padding: 10px;
    border: 1px solid #e0e0e0;
    border-radius: 4px;
    font-size: 14px;
    box-sizing: border-box;
    resize: none;
}

.condition-container {
    display: flex;
    align-items: center;
    margin-bottom: 15px;
    justify-content: center;
}

.condition-button {
    padding: 10px 20px;
    border: 1px solid #FFF;
    border-radius: 8px;
    font-size: 16px;
    cursor: pointer;
    margin-right: 10px;
    background-color: #f0f0f0;
    font-weight : bold;
}

.condition-button.selected {
    background-color: #0DCC5A;
    color: white;
}

.btn {
padding: 10px 20px;
    border: 1px solid #000000;
    border-radius: 4px;
    font-size: 16px;
    cursor: pointer;
    margin-right: 10px;
    background-color: #000000;
    font-weight : bold;
   align-items: center;
   color : white;
   margin-top:20px;
   
}
.btn-container {
	text-align: center;

}

</style>
<body>
<%@ include file="../view/menu.jsp"%>
   <form action="${pageContext.request.contextPath}/trade_write.do" method="post" enctype="multipart/form-data">
 <div class="write-form">
  <div class="image-upload-container">
    <div class="image-upload" id="imageUpload">
        <i class="fas fa-camera"></i>
        </div>
      
    </div>
    <input type="file" id="t_image" name="t_image[]" style="display: none;" multiple>
        <div class="image-preview-container"></div>
 <div class="input-category-container">
    <input type="text" class="product-input" placeholder="상품명" name="t_product">
</div>

    <ul class="category-list">
        <li class="category-option">오토바이</li>
        <li class="category-option">전자기기</li>
        <li class="category-option">의류</li>
        <li class="category-option">잡화</li>
        <li class="category-option">가구/인테리어</li>
        <li class="category-option">출산/유아동</li>
        <li class="category-option">스포츠/레저</li>
        <li class="category-option">뷰티/미용</li>
    </ul>
    <input type="hidden" name="t_class" id="selectedCategory">


    
    <div class="price-container">
        <input type="text" class="price-input" id="t_price" name="t_price" placeholder="₩ 가격을 입력해 주세요." required>
        
    </div>
    <div class="description-container">
        <textarea class="description-textarea" id="t_content" name="t_content" placeholder="게시글 내용을 작성해 주세요." required></textarea>
    </div>
    <div class="condition-container">
        <button type="button" class="condition-button selected" id="used">중　고</button>
        <button type="button" class="condition-button" id="new">새상품</button>
        <input type="hidden" name="t_condition" id="selectedCondition" value="중고">
        
       
    </div>
    <div class="btn-container">
     <button class="btn" type="submit">작성 완료</button>
     </div>
    </div>
    
   
</form>

<script>


document.addEventListener('DOMContentLoaded', function() {
    const conditionButtons = document.querySelectorAll('.condition-button');
    const selectedConditionInput = document.getElementById('selectedCondition');

    conditionButtons.forEach(button => {
        button.addEventListener('click', function() {
            // 모든 버튼에서 선택된 클래스 제거
            conditionButtons.forEach(btn => btn.classList.remove('selected'));
            
            // 클릭한 버튼에 선택된 클래스 추가
            button.classList.add('selected');
            
            // 선택된 값을 숨겨진 입력 필드에 저장
            selectedConditionInput.value = button.textContent.trim();
        });
    });
});


document.addEventListener('DOMContentLoaded', function() {
    const categoryOptions = document.querySelectorAll('.category-option');
    const selectedCategoryInput = document.getElementById('selectedCategory');

    categoryOptions.forEach(option => {
        option.addEventListener('click', function() {
            // 모든 옵션에서 선택된 클래스 제거
            categoryOptions.forEach(opt => opt.classList.remove('selected'));
            
            // 클릭한 옵션에 선택된 클래스 추가
            option.classList.add('selected');
            
            // 선택된 값을 숨겨진 입력 필드에 저장
            selectedCategoryInput.value = option.textContent.trim();
        });
    });
});

document.addEventListener('DOMContentLoaded', function() {
    const imageUpload = document.getElementById('imageUpload');
    const fileInput = document.getElementById('t_image');
    const imageCount = document.querySelector('.image-count');
    let selectedFiles = new DataTransfer(); // 선택된 파일들을 관리하기 위한 객체
    
    // 이미지 프리뷰 컨테이너 생성
    const previewContainer = document.createElement('div');
    previewContainer.className = 'image-preview-container';
    imageUpload.parentNode.insertBefore(previewContainer, imageUpload.nextSibling);

    imageUpload.addEventListener('click', function() {
        fileInput.click();
    });

    fileInput.addEventListener('change', function(e) {
        const files = Array.from(e.target.files);
        
        files.forEach(file => {
            if (file.type.startsWith('image/')) {
                // DataTransfer 객체에 파일 추가
                selectedFiles.items.add(file);
                
                const reader = new FileReader();
                reader.onload = function(e) {
                    const previewItem = document.createElement('div');
                    previewItem.className = 'preview-item';
                    
                    const img = document.createElement('img');
                    img.src = e.target.result;
                    
                    const deleteBtn = document.createElement('button');
                    deleteBtn.className = 'delete-button';
                    deleteBtn.innerHTML = 'X';
                    deleteBtn.onclick = function() {
                        // 해당 파일을 DataTransfer 객체에서 제거
                        const newFiles = new DataTransfer();
                        const files = Array.from(selectedFiles.files);
                        files.forEach((f, i) => {
                            if (f !== file) newFiles.items.add(f);
                        });
                        selectedFiles = newFiles;
                        fileInput.files = selectedFiles.files;
                        
                        // 프리뷰 제거
                        previewItem.remove();
                        
                        // 이미지 카운트 업데이트
                        updateImageCount();
                    };
                    
                    previewItem.appendChild(img);
                    previewItem.appendChild(deleteBtn);
                    previewContainer.appendChild(previewItem);
                    
                    updateImageCount();
                };
                reader.readAsDataURL(file);
            }
        });
    });
    
    function updateImageCount() {
        const count = selectedFiles.files.length;
        const imageCount = document.querySelector('.image-count');
        if (imageCount) {
            imageCount.textContent = `${count}/5`;
            imageCount.style.display = 'block'; // 확실하게 보이도록 설정
        }
    }
});

document.addEventListener('DOMContentLoaded', function() {
    // 가격 입력 필드 선택 (input의 id나 class에 따라 수정 필요)
    const priceInput = document.querySelector('input[name="t_price"]');
    
    if (priceInput) {
        priceInput.addEventListener('input', function(e) {
            // 숫자 이외의 문자 제거
            let value = e.target.value.replace(/[^\d]/g, '');
            
            // 숫자를 3자리마다 콤마로 구분
            value = value.replace(/\B(?=(\d{3})+(?!\d))/g, ',');
            
            // 입력 필드에 포맷된 값을 설정
            e.target.value = value;
        });
        
        // form submit 전에 콤마 제거
        priceInput.form.addEventListener('submit', function(e) {
            priceInput.value = priceInput.value.replace(/,/g, '');
        });
    }
});

</script>
</body>
</html>
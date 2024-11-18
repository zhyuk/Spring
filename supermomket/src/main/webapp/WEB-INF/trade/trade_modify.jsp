<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../view/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<title>중고거래 수정</title>
</head>
<style>
.write-form {
    max-width: 600px;
    margin: 0 auto;
    padding: 20px;
    margin-top : 50px;
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


@media screen and (max-width: 425px) {
    .write-form {
        max-width: 100%;
        padding: 16px;
        margin-top: 20px;
    }

   
    .image-upload {
        width: 80px;
        height: 80px;
    }

    .image-upload i {
        font-size: 20px;
    }

  
    .preview-item {
        width: 80px;
        height: 80px;
    }

    .image-preview {
        width: 80px;
        height: 80px;
    }

    .delete-button {
        width: 18px;
        height: 18px;
        font-size: 10px;
    }


    .product-input, 
    .price-input, 
    .category-list,
    .description-textarea {
        font-size: 14px;
        padding: 8px;
    }

    .description-textarea {
        height: 120px;
    }

  
    .category-option {
        padding: 8px;
        font-size: 14px;
    }

 
    .condition-container {
        gap: 8px;
        margin: 12px 0;
    }

    .condition-button {
        padding: 8px 16px;
        font-size: 14px;
        margin-right: 8px;
    }

    .btn {
        padding: 8px 16px;
        font-size: 14px;
        margin-top: 16px;
        width: 100%;
    }

   
    .price-container {
        margin: 12px 0;
    }

   
    .image-preview-container {
        gap: 8px;
        margin-top: 8px;
    }

 
    .image-count {
        bottom: -20px;
        font-size: 11px;
    }

 
    .input-category-container,
    .description-container {
        margin-bottom: 12px;
    }
}

</style>
<body>
<%@ include file="../view/menu.jsp"%>
   <form action="${pageContext.request.contextPath}/trade_modify.do" method="post" enctype="multipart/form-data">
   <input type="hidden" name="t_no" value="${trade.t_no}">
 <div class="write-form">
    <div class="image-upload" id="imageUpload">
        <i class="fas fa-camera"></i>
        
    </div>
    <input type="file" id="t_image" name="t_image" style="display: none;" multiple accept="image/*">
     <div class="image-preview-container"></div>
 <div class="input-category-container">
    <input type="text" class="product-input" name="t_product" value="${trade.t_product}">
</div>

 <ul class="category-list">
    <li class="category-option ${trade.t_class == '오토바이' ? 'selected' : ''}">오토바이</li>
    <li class="category-option ${trade.t_class == '전자기기' ? 'selected' : ''}">전자기기</li>
    <li class="category-option ${trade.t_class == '의류' ? 'selected' : ''}">의류</li>
    <li class="category-option ${trade.t_class == '잡화' ? 'selected' : ''}">잡화</li>
    <li class="category-option ${trade.t_class == '가구/인테리어' ? 'selected' : ''}">가구/인테리어</li>
    <li class="category-option ${trade.t_class == '출산/유아동' ? 'selected' : ''}">출산/유아동</li>
    <li class="category-option ${trade.t_class == '스포츠/레저' ? 'selected' : ''}">스포츠/레저</li>
    <li class="category-option ${trade.t_class == '뷰티/미용' ? 'selected' : ''}">뷰티/미용</li>
</ul>
<input type="hidden" name="t_class" id="selectedCategory" value="${trade.t_class}">


    
    <div class="price-container">
        <input type="text" class="price-input" id="t_price" name="t_price" value="₩${trade.t_price}" required>
        
    </div>
    <div class="description-container">
        <textarea class="description-textarea" id="t_content" name="t_content" required>${trade.t_content}</textarea>
    </div>
    <div class="condition-container">
        <button type="button" class="condition-button selected" id="used">중　고</button>
        <button type="button" class="condition-button" id="new">새상품</button>
        <input type="hidden" name="t_condition" id="selectedCondition" value="중고">
        
       
    </div>
    <div class="btn-container">
     <button class="btn" type="submit">수정 완료</button>
     </div>
    </div>
    
   
</form>

<script>

// 새상품,중고
document.addEventListener('DOMContentLoaded', function() {
    const conditionButtons = document.querySelectorAll('.condition-button');
    const selectedConditionInput = document.getElementById('selectedCondition');

    conditionButtons.forEach(button => {
        button.addEventListener('click', function() {
            conditionButtons.forEach(btn => btn.classList.remove('selected'));
            
            button.classList.add('selected');
            
            selectedConditionInput.value = button.textContent.trim();
        });
    });
});

//카테고리
document.addEventListener('DOMContentLoaded', function() {
    const categoryOptions = document.querySelectorAll('.category-option');
    const selectedCategoryInput = document.getElementById('selectedCategory');

    categoryOptions.forEach(option => {
        option.addEventListener('click', function() {
            categoryOptions.forEach(opt => opt.classList.remove('selected'));
            
            option.classList.add('selected');
            
            selectedCategoryInput.value = option.textContent.trim();
        });
    });
});

document.addEventListener('DOMContentLoaded', function() {
    const imageUpload = document.getElementById('imageUpload');
    const fileInput = document.getElementById('t_image');
    const previewContainer = document.querySelector('.image-preview-container');
    let selectedFiles = new DataTransfer();
    
   
    const MAX_FILES = 5;
    
    imageUpload.addEventListener('click', function() {
        fileInput.click();
    });

    fileInput.addEventListener('change', function(e) {
        const files = Array.from(e.target.files);
        
       
        if (selectedFiles.files.length + files.length > MAX_FILES) {
            alert(`이미지는 최대 ${MAX_FILES}개까지 업로드 가능합니다.`);
            return;
        }
        
        files.forEach(file => {
            if (file.type.startsWith('image/')) {
                selectedFiles.items.add(file);
                
                const reader = new FileReader();
                reader.onload = function(e) {
                    const previewItem = createPreviewItem(e.target.result, file);
                    previewContainer.appendChild(previewItem);
                };
                reader.readAsDataURL(file);
            }
        });
        
     
        fileInput.files = selectedFiles.files;
        updateImageCount();
    });
    
    function createPreviewItem(src, file) {
        const previewItem = document.createElement('div');
        previewItem.className = 'preview-item';
        
        const img = document.createElement('img');
        img.src = src;
        
        const deleteBtn = document.createElement('button');
        deleteBtn.className = 'delete-button';
        deleteBtn.innerHTML = 'X';
        deleteBtn.onclick = function() {
           
            const newFiles = new DataTransfer();
            Array.from(selectedFiles.files).forEach(f => {
                if (f !== file) newFiles.items.add(f);
            });
            selectedFiles = newFiles;
            fileInput.files = selectedFiles.files;
            
            previewItem.remove();
            updateImageCount();
        };
        
        previewItem.appendChild(img);
        previewItem.appendChild(deleteBtn);
        return previewItem;
    }
    
    function updateImageCount() {
        const count = selectedFiles.files.length;
        const imageCount = document.querySelector('.image-count');
        if (imageCount) {
            imageCount.textContent = `${count}/${MAX_FILES}`;
            imageCount.style.display = 'block';
        }
    }
});

document.addEventListener('DOMContentLoaded', function() {
    const categoryOptions = document.querySelectorAll('.category-option');
    const selectedCategoryInput = document.getElementById('selectedCategory');

    categoryOptions.forEach(option => {
        option.addEventListener('click', function() {
            
            categoryOptions.forEach(opt => opt.classList.remove('active'));
            
            
            this.classList.add('active');

            
            selectedCategoryInput.value = this.textContent;
        });
    });
});


document.querySelector('form').addEventListener('submit', function(e) {
    e.preventDefault(); 
    
  
    const product = document.querySelector('input[name="t_product"]').value;
    const category = document.querySelector('#selectedCategory').value;
    const price = document.querySelector('input[name="t_price"]').value;
    const content = document.querySelector('textarea[name="t_content"]').value;
    
    
    if (!product || !category || !price || !content) {
        alert('모든 필수 항목을 입력해주세요.');
        return;
    }
    
   
    const priceInput = document.querySelector('input[name="t_price"]');
    priceInput.value = priceInput.value.replace(/[₩,]/g, '');
    
   
    this.submit();
});


document.addEventListener('DOMContentLoaded', function() {
    const priceInput = document.querySelector('input[name="t_price"]');
    
    if (priceInput) {
      
        priceInput.value = priceInput.value.replace('₩', '');
        
        priceInput.addEventListener('input', function(e) {
           
            let value = e.target.value.replace(/[^\d]/g, '');
            
        
            value = value.replace(/\B(?=(\d{3})+(?!\d))/g, ',');
            
            
            e.target.value = value;
        });
    }
});

$('link[href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"]').remove();
$('link[href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"]').remove();
$('script[src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"]').remove();
</script>
<%@ include file="../view/footer.jsp" %>
</body>
</html>


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


@media screen and (max-width: 425px) {
    .write-form {
        max-width: 100%;
        padding: 16px;
        margin: 0;
    }

    .image-upload {
        width: 80px;
        height: 80px;
        margin-top: 20px;
        margin-bottom: 16px;
    }

    .image-upload i {
        font-size: 20px;
    }

  
    .image-preview-container {
        gap: 8px;
        margin-top: 8px;
    }

    .preview-item {
        width: 80px;
        height: 80px;
    }

    .delete-button {
        width: 18px;
        height: 18px;
        font-size: 10px;
        top: 4px;
        right: 4px;
    }

    
    .input-category-container {
        margin-bottom: 12px;
    }

    .product-input {
        padding: 8px;
        font-size: 14px;
    }

    .category-list {
        margin-bottom: 12px;
    }

    .category-option {
        padding: 8px;
        font-size: 14px;
    }

 
    .price-container {
        margin: 12px 0;
    }

    .price-input {
        padding: 8px;
        font-size: 14px;
    }

 
    .description-container {
        margin-bottom: 12px;
    }

    .description-textarea {
        height: 120px;
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

    
    .btn-container {
        margin-top: 16px;
    }

    .btn {
        width: 100%;
        padding: 12px;
        font-size: 14px;
        margin: 0;
    }

   
    .image-count {
        bottom: -20px;
        font-size: 11px;
    }

 
    .image-upload-container {
        margin-bottom: 24px;
    }
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
           
            conditionButtons.forEach(btn => btn.classList.remove('selected'));
            
            
            button.classList.add('selected');
            
         
            selectedConditionInput.value = button.textContent.trim();
        });
    });
});


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
    let selectedFiles = new DataTransfer();
    let fileSelectOrder = [];
    
    const previewContainer = document.createElement('div');
    previewContainer.className = 'image-preview-container';
    imageUpload.parentNode.insertBefore(previewContainer, imageUpload.nextSibling);

    imageUpload.addEventListener('click', function() {
        fileInput.click();
    });

    fileInput.addEventListener('change', function(e) {
        const currentFiles = Array.from(e.target.files);
        
        if (selectedFiles.files.length + currentFiles.length > 5) {
            alert('이미지는 최대 5개까지만 업로드할 수 있습니다.');
            return;
        }

       
        const filesWithTimestamp = currentFiles.map((file, index) => ({
            file: file,
            timestamp: Date.now() + index, 
            originalIndex: index
        }));

        
        filesWithTimestamp.forEach((fileData) => {
            if (fileData.file.type.startsWith('image/')) {
                const isMain = fileSelectOrder.length === 0;
                fileSelectOrder.push({
                    file: fileData.file,
                    isMain: isMain,
                    timestamp: fileData.timestamp,
                    originalIndex: fileData.originalIndex
                });
            }
        });

     
        previewContainer.innerHTML = '';
        selectedFiles = new DataTransfer();

     
        fileSelectOrder.sort((a, b) => a.timestamp - b.timestamp)
            .forEach((fileObj, index) => {
                const reader = new FileReader();
                reader.onload = function(e) {
                    const previewItem = document.createElement('div');
                    previewItem.className = 'preview-item';
                    if (index === 0) {
                        previewItem.classList.add('main-image');
                    }
                    previewItem.setAttribute('data-index', index);
                    previewItem.setAttribute('data-timestamp', fileObj.timestamp);
                    
                    const img = document.createElement('img');
                    img.src = e.target.result;
                    
                    const deleteBtn = document.createElement('button');
                    deleteBtn.className = 'delete-button';
                    deleteBtn.innerHTML = 'X';
                    
                    deleteBtn.onclick = function(evt) {
                        evt.preventDefault();
                        const deleteIndex = parseInt(previewItem.getAttribute('data-index'));
                        fileSelectOrder.splice(deleteIndex, 1);
                        previewItem.remove();
                        updatePreviewsAndFiles();
                    };

                    previewItem.appendChild(img);
                    previewItem.appendChild(deleteBtn);
                    previewContainer.appendChild(previewItem);
                    
                    selectedFiles.items.add(fileObj.file);
                    fileInput.files = selectedFiles.files;
                    updateImageCount();
                };
                reader.readAsDataURL(fileObj.file);
        });
    });


    function updatePreviewsAndFiles() {
        const newFiles = new DataTransfer();
        const previewItems = Array.from(previewContainer.querySelectorAll('.preview-item'));
        
      
        previewItems.sort((a, b) => {
            return parseInt(a.getAttribute('data-timestamp')) - 
                   parseInt(b.getAttribute('data-timestamp'));
        }).forEach((item, index) => {
            const fileObj = fileSelectOrder[index];
            if (fileObj) {
                newFiles.items.add(fileObj.file);
                item.setAttribute('data-index', index);
                
                if (index === 0) {
                    item.classList.add('main-image');
                } else {
                    item.classList.remove('main-image');
                }
            }
        });
        
        selectedFiles = newFiles;
        fileInput.files = selectedFiles.files;
        updateImageCount();
    }

   
    function removeFile(index) {
        const newFiles = new DataTransfer();
        const files = Array.from(selectedFiles.files);
        files.splice(index, 1);
        files.forEach(file => newFiles.items.add(file));
        selectedFiles = newFiles;
        fileInput.files = selectedFiles.files;
    }

  
    function reorderFiles() {
        const previewItems = previewContainer.querySelectorAll('.preview-item');
        previewItems.forEach((item, index) => {
            item.setAttribute('data-index', index);
        });
    }


    function updateImageCount() {
        const count = selectedFiles.files.length;
        
        let imageCount = document.querySelector('.image-count');
        if (!imageCount) {
            imageCount = document.createElement('div');
            imageCount.className = 'image-count';
            imageUpload.appendChild(imageCount);
        }
       
    }
});

document.addEventListener('DOMContentLoaded', function() {
  
    const priceInput = document.querySelector('input[name="t_price"]');
    
    if (priceInput) {
        priceInput.addEventListener('input', function(e) {
           
            let value = e.target.value.replace(/[^\d]/g, '');
            
        
            value = value.replace(/\B(?=(\d{3})+(?!\d))/g, ',');
            
           
            e.target.value = value;
        });
        
      
        priceInput.form.addEventListener('submit', function(e) {
            priceInput.value = priceInput.value.replace(/,/g, '');
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
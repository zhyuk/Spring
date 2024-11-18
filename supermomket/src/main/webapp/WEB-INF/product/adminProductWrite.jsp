<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../admin/header.jsp" %>
<%@ include file="../admin/menu.jsp" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>상품 작성</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminProductWrite.css">
</head>
<body>
    <div class="container">
    	<div class="container-inner">
	        <h1>상품 등록</h1>
	        <form action="/saveProduct.do" method="post" enctype="multipart/form-data">
	            <div class="form-field">
	                <label>상품코드:</label>
	                <input type="text" name="p_callno" required/>
	            </div>
	            <div class="form-field">
	                <label>상품명:</label>
	                <input type="text" name="p_name" required/>
	            </div>
	            <div class="form-field">
	                <label>상품분류 (Y: 유모차/액세서리, C: 유아의류/신발, B: 유아식품)</label>
	                <input type="text" name="p_class" required/>
	            </div>
	            <div class="form-field">
	                <label>원가:</label>
	                <input type="number" name="p_price" required/>
	            </div>
	            <div class="form-field">
	                <label>할인률(%):</label>
	                <input type="number" step="1" name="p_dr" required/>
	            </div>
	            <div class="form-field">
	                <label>할인가격:</label>
	                <input type="number" name="p_discount" readonly/>
	            </div>
	            <div class="form-field">
	                <label>재고수량:</label>
	                <input type="number" name="p_stock" required/>
	            </div>
	            <div class="form-field">
	                <label>브랜드:</label>
	                <input type="text" name="p_brand" required/>
	            </div>
	            <div class="form-field">
	                <label>배송비:</label>
	                <input type="text" name="p_delivery" required/>
	            </div>
	            <div class="form-field">
	                <label>제조국가:</label>
	                <input type="text" name="p_made" required/>
	            </div>
	            
	            <div class="form-field">
	                <label>상품정보:</label>
	                <input type="text" name="d_info" required/>
	            </div>
	
	            <!-- 상품이미지 첨부 -->
	            <div class="form-field">
	                <label>상품이미지:</label>
	                <input type="file" name="front_p_img" accept="image/*" required onchange="previewImage(this, 'productImagePreview')"/>
	                <div id="productImagePreview" class="image-preview"></div>
	            </div>
	
	            <!-- 상세이미지 첨부 -->
	            <div class="form-field">
	                <label>상세이미지:</label>
	                <input type="file" name="front_d_content" accept="image/*" required onchange="previewImage(this, 'detailImagePreview')"/>
	                <div id="detailImagePreview" class="image-preview"></div>
	            </div>
	
	            <div class="form-field">
	                <button type="submit">상품 저장</button>
	            </div>
	        </form>
	    </div>
    </div>

    <script>
        // 할인가격 자동 계산
        document.querySelector("input[name='p_dr']").addEventListener("input", function() {
            const price = parseFloat(document.querySelector("input[name='p_price']").value);
            const discountRate = parseFloat(this.value);
            const discountPrice = price - (price * (discountRate / 100));
            document.querySelector("input[name='p_discount']").value = Math.round(discountPrice);
        });

        // 이미지 미리보기 및 취소 버튼 추가 함수
        function previewImage(input, previewId) {
            const preview = document.getElementById(previewId);
            preview.innerHTML = ''; // 초기화
            if (input.files && input.files[0]) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    const imgContainer = document.createElement("div");
                    imgContainer.classList.add("img-container");

                    const img = document.createElement("img");
                    img.src = e.target.result;
                    img.classList.add("preview-image");

                    const closeButton = document.createElement("span");
                    closeButton.innerHTML = "&times;";
                    closeButton.classList.add("close-button");
                    closeButton.onclick = function() {
                        preview.innerHTML = '';
                        input.value = ''; // 파일 선택 초기화
                    };

                    imgContainer.appendChild(img);
                    imgContainer.appendChild(closeButton);
                    preview.appendChild(imgContainer);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../admin/header.jsp" %>
<%@ include file="../admin/menu.jsp" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>상품 수정</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminProductEdit.css">
</head>
<body>
    <div class="container">
    	<div class="container-inner">
	        <h1>상품 수정</h1>
	        <form action="/updateProduct.do" method="post" enctype="multipart/form-data">
	            <!-- 기본 상품 정보 -->
	            <input type="hidden" name="p_no" value="${product.p_no}" />
	
	            <label>상품코드:</label>
	            <input type="text" name="p_callno" value="${product.p_callno}" /><br/>
	
	            <label>상품명:</label>
	            <input type="text" name="p_name" value="${product.p_name}" /><br/>
	
	            <label>상품분류:</label>
	            <input type="text" name="p_class" value="${product.p_class}" /><br/>
	
	            <label>원가:</label>
	            <input type="number" name="p_price" id="p_price" value="${product.p_price}" oninput="calculateDiscountPrice()" /><br/>
	
	            <label>할인률:</label>
	            <input type="number" name="p_dr" id="p_dr" value="${product.p_dr}" step="0.01" oninput="calculateDiscountPrice()" /><br/>
	
	            <label>할인가격:</label>
	            <input type="number" name="p_discount" id="p_discount" value="${product.p_discount}" readonly/><br/>
	
	            <label>재고:</label>
	            <input type="number" name="p_stock" value="${product.p_stock}" /><br/>
	
	            <label>브랜드:</label>
	            <input type="text" name="p_brand" value="${product.p_brand}" /><br/>
	
	            <label>배송비:</label>
	            <input type="text" name="p_delivery" value="${product.p_delivery}" /><br/>
	
	            <label>제조국가:</label>
	            <input type="text" name="p_made" value="${product.p_made}" /><br/>
	
<!-- 	            <label>평점:</label> -->
<%-- 	            <input type="number" name="review_avg" value="${product.review_avg}" readonly/><br/> --%>
	
	            <!-- 상품 이미지 파일 첨부 -->
	            <label>상품 이미지:</label>
	            <div>
	                <img id="p_img_preview" src="${pageContext.request.contextPath}/resources/img/product/${product.p_img}" alt="상품 이미지" style="width: 100px; height: auto;"/>
	                <input type="file" name="front_p_img" accept="image/*" onchange="previewImage(event, 'p_img_preview')"/><br/>
	                <small>현재 파일: ${product.p_img}</small>
	            </div>
	
	            <!-- 상세 이미지 파일 첨부 -->
	            <label>상세 이미지:</label>
	            <div>
	                <img id="d_content_preview" src="${pageContext.request.contextPath}/resources/img/product/${product.d_content}" alt="상세 이미지" style="width: 100px; height: auto;"/>
	                <input type="file" name="front_d_content" accept="image/*" onchange="previewImage(event, 'd_content_preview')"/><br/>
	                <small>현재 파일: ${product.d_content}</small>
	            </div>
	
	            <button type="submit">수정 완료</button>
	        </form>
	   </div>
    </div>

    <script>
        function previewImage(event, previewId) {
            var reader = new FileReader();
            reader.onload = function(){
                var previewElement = document.getElementById(previewId);
                previewElement.src = reader.result;
            };
            reader.readAsDataURL(event.target.files[0]);
        }

        // 할인 가격 자동 계산 함수
        function calculateDiscountPrice() {
            const price = parseFloat(document.getElementById("p_price").value) || 0;
            const discountRate = parseFloat(document.getElementById("p_dr").value) || 0;
            const discountPrice = price * (1 - discountRate / 100);
            document.getElementById("p_discount").value = discountPrice.toFixed(0); // 소수점 제거
        }
    </script>
</body>
</html>

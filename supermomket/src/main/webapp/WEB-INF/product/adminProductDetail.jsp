<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../admin/header.jsp" %>
<%@ include file="../admin/menu.jsp" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>상품 상세 정보</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminProductDetail.css">
</head>
<body>

    <div class="container">
    	<div class="container-inner">
	        <h1>상품 상세 정보</h1>
	
	        <div class="product-info">
	            <p><strong>No:</strong> ${product.p_no}</p>
	            <p><strong>상품코드:</strong> ${product.p_callno}</p>
	            <p><strong>상품명:</strong> ${product.p_name}</p>
	            <p><strong>상품분류:</strong> ${product.p_class}</p>
	            <p><strong>원가:</strong> <fmt:formatNumber value="${product.p_price}" type="number"/>원</p>
	            <p><strong>할인률:</strong> <fmt:formatNumber value="${product.p_dr}" type="number" maxFractionDigits="0"/>%</p>
	            <p><strong>할인가격:</strong> <fmt:formatNumber value="${product.p_discount}" type="number"/> 원</p>
	            <p><strong>재고:</strong> ${product.p_stock}ea</p>
	            <p><strong>브랜드:</strong> ${product.p_brand}</p>
	            <p><strong>배송비:</strong> ${product.p_delivery}</p>
	            <p><strong>제조국가:</strong> ${product.p_made}</p>
	<%--             <p><strong>평점:</strong> ${product.review_avg}점</p> --%>
<p><strong>리뷰 개수:</strong> 
    <a href="javascript:void(0);" onclick="openReviewModal()">${reviewCount}개</a>
</p>
<p><strong>상품 이미지:</strong> 
    <a href="javascript:void(0);" onclick="showImageModal('${pageContext.request.contextPath}/resources/img/product/${product.p_img}')">
        ${product.p_img}
    </a>
</p>
<p><strong>상세 이미지:</strong>
    <a href="javascript:void(0);" onclick="showImageModal('${pageContext.request.contextPath}/resources/img/product/${product.d_content}')">
        ${product.d_content}
    </a>
</p>

	        </div>
	
	        <div class="action-buttons">
	            <button onclick="location.href='productsEdit.do?p_no=${product.p_no}'">수정</button>
	            <form action="/deleteProduct.do" method="post" onsubmit="return confirm('정말 삭제하시겠습니까?');">
				    <input type="hidden" name="p_no" value="${product.p_no}">
				    <button type="submit" class="delete-button">삭제</button>
				</form>
	        </div>
	
	        <!-- 리뷰 목록 모달 -->
	        <div id="reviewModal" class="modal" style="display:none;">
	            <div class="modal-content">
	                <span class="close" onclick="closeReviewModal()">&times;</span>
	                <h2>리뷰 목록</h2>
	                <c:forEach var="review" items="${reviews}">
	                    <div class="review-item">
	                        <p><strong>작성자:</strong> ${review.c_id}</p>
	                        <p><strong>작성일:</strong> <fmt:formatDate value="${review.created_at}" pattern="yyyy-MM-dd"/></p>
	                        <p><strong>평점:</strong> ${review.c_avg}점</p>
	                        <p><strong>내용:</strong> ${review.c_text}</p>
	                        <c:if test="${not empty review.c_img}">
	                            <p><strong>이미지:</strong> <img src="${pageContext.request.contextPath}/resources/img/review/${review.c_img}" alt="리뷰 이미지" width="100"></p>
	                        </c:if>
	                    </div>
	<!--                     <hr> -->
	                </c:forEach>
	            </div>
	        </div>
	
	        <!-- 이미지 모달 -->
	        <div id="imageModal" class="modal">
	            <span class="close" onclick="closeImageModal()">&times;</span>
	            <img class="modal-content" id="modalImage">
	        </div>
	    </div>

    </div>

    <script>
        function showImageModal(imageUrl) {
            var modal = document.getElementById("imageModal");
            var modalImage = document.getElementById("modalImage");
            modalImage.src = imageUrl;
            modal.style.display = "block";
        }

        function closeImageModal() {
            var modal = document.getElementById("imageModal");
            modal.style.display = "none";
        }

        function openReviewModal() {
            document.getElementById("reviewModal").style.display = "block";
        }

        function closeReviewModal() {
            document.getElementById("reviewModal").style.display = "none";
        }
    </script>

</body>
</html>

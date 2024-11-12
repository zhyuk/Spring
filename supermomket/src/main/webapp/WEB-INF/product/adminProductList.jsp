<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../admin/header.jsp" %>

	<%@ include file="../admin/menu.jsp" %>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminProducts.css">

<!-- 외부 글꼴 설정 -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&family=Quicksand:wght@400;700&display=swap" rel="stylesheet">

</head>
<body>

	<div class="container">
	    <h1>관리자 상품 관리 페이지</h1>
	
	    <table>
	        <thead>
	            <tr>
	                <th>상품 번호</th>
	                <th>상품명</th>
	                <th>카테고리</th>
	                <th>가격</th>
	                <th>재고</th>
	                <th>평점</th>
	                <th>관리</th>
	            </tr>
	        </thead>
	        <tbody>
	            <c:forEach var="product" items="${ProductList}">
	                <tr>
	                    <td>${product.p_no}</td>
	                    <td>${product.p_name}</td>
	                    <td>${product.p_class}</td>
	                    <td><fmt:formatNumber value="${product.p_price}" type="number"/>원</td>
	                    <td>${product.p_stock}</td>
	                    <td>${product.review_avg}</td>
	                    <td>
	                        <div class="action-buttons">
	                            <button class="edit-button" onclick="location.href='editProduct?id=${product.p_no}'">수정</button>
	                            <button class="delete-button" onclick="deleteProduct(${product.p_no})">삭제</button>
	                        </div>
	                    </td>
	                </tr>
	            </c:forEach>
	        </tbody>
	    </table>
	
	    <!-- 페이징 -->
	    <div class="pagination">
	        <c:forEach var="i" begin="1" end="${totalPages}">
	            <c:choose>
	                <c:when test="${i == currentPage}">
	                    <a href="?page=${i}&sortType=${sortType}&category=${category}&searchQuery=${searchQuery}" class="active">${i}</a>
	                </c:when>
	                <c:otherwise>
	                    <a href="?page=${i}&sortType=${sortType}&category=${category}&searchQuery=${searchQuery}">${i}</a>
	                </c:otherwise>
	            </c:choose>
	        </c:forEach>
	    </div>
	</div>
	
	<script>
	    function deleteProduct(productId) {
	        if (confirm("상품을 삭제하시겠습니까?")) {
	            // 실제 삭제 로직으로 전환 필요 (AJAX 요청 또는 form 제출)
	            alert("상품이 삭제되었습니다. 상품 ID: " + productId);
	        }
	    }
	</script>


</body>
</html>

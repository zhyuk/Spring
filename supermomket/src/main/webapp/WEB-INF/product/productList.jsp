<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../view/header.jsp"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/productList.css">

<!-- 외부 글꼴 설정 -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&family=Quicksand:wght@400;700&display=swap" rel="stylesheet">


<script>

	//모든 상품 항목에 대해 별을 채우는 함수
$(document).ready(function() {
    // 모든 상품 항목에 대해 별을 채우는 함수
    $('.product-card').each(function() {
        const avgRating = parseFloat($(this).data('avg-review-rating')); // 각 상품의 평균 평점 가져오기
        const fullStars = Math.floor(avgRating); // 꽉 찬 별 개수
        const hasHalfStar = avgRating % 1 >= 0.5; // 반 개의 별이 필요한지 확인

        // 별을 채우기
        $(this).find('.star-rating .star').each(function(index) {
            if (index < fullStars) {
                $(this).addClass('active'); // 꽉 찬 별
            } else if (index === fullStars && hasHalfStar) {
                $(this).css({
                    background: 'linear-gradient(to right, #ffcc00 50%, #ddd 50%)', // 반 개의 별
                    '-webkit-background-clip': 'text', // 클립 효과 (웹킷 브라우저용)
                    '-webkit-text-fill-color': 'transparent'
                });
            }
        });

        // 평균 평점 텍스트 설정
        $(this).find('.avg-review-rating').text(avgRating.toFixed(1)); // 소수점 첫째 자리까지만 표시
    });
});

	
	// 숫자를 세 자리마다 콤마로 구분하는 함수
	function numberWithCommas(x) {
		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	// 조회수 및 가격 형식화 함수
	function formatProductInfo() {
		var views = document.getElementsByClassName('product-views');
		for (var j = 0; j < views.length; j++) {
			var viewText = views[j].textContent.replace('조회수: ', '').replace(
					/,/g, '').trim();
			views[j].textContent = '조회수: ' + numberWithCommas(viewText);
		}

		var prices = document.getElementsByClassName('product-price');
		for (var k = 0; k < prices.length; k++) {
			var priceText = prices[k].textContent.replace('', '').replace(
					'원', '').replace(/,/g, '').trim();
			prices[k].textContent = '' + numberWithCommas(priceText) + '원';
		}

		var discounts = document.getElementsByClassName('product-discount');
		for (var l = 0; l < discounts.length; l++) {
			var discountText = discounts[l].textContent.replace('', '')
					.replace('원', '').replace(/,/g, '').trim();
			discounts[l].textContent = '' + numberWithCommas(discountText)
					+ '원';
		}

		// 할인률을 정수로 형식화
		var discountRates = document.getElementsByClassName('discount-rate');
		for (var m = 0; m < discountRates.length; m++) {
			var rateText = discountRates[m].textContent.replace('%', '')
					.trim();
			discountRates[m].textContent = Math.floor(rateText) + '%';
		}
	} 

	window.onload = formatProductInfo;
</script>
</head>
<body>
	<%@ include file="../view/menu.jsp"%>
	<div class="inner">
		<!-- 카테고리 옵션 -->
		<div class="category-options">
			<a href="products.do?category=C" class="${category == 'C' ? 'active-category' : ''}"> 유아의류/신발 </a> 
			<a href="products.do?category=B" class="${category == 'B' ? 'active-category' : ''}"> 유아식품/분유 </a>
			<a href="products.do?category=Y" class="${category == 'Y' ? 'active-category' : ''}"> 유모차/액세서리 </a>
		</div>
	
	
	
		<div class="sort-container">
		    <!-- 검색 기능 폼 -->
		    <div class="search-container">
		        <!-- 정렬 셀렉트 박스 -->
		        <select class="sort-select" onchange="location = this.value;">
		            <option value="products.do?page=1&sortType=최신순&category=${category}" ${sortType == '최신순' ? 'selected' : ''}>최신순</option>
		            <option value="products.do?page=1&sortType=인기순&category=${category}" ${sortType == '인기순' ? 'selected' : ''}>인기순</option>
		            <option value="products.do?page=1&sortType=낮은가격순&category=${category}" ${sortType == '낮은가격순' ? 'selected' : ''}>낮은가격순</option>
		            <option value="products.do?page=1&sortType=높은가격순&category=${category}" ${sortType == '높은가격순' ? 'selected' : ''}>높은가격순</option>
		        </select>
		        <form action="products.do" method="get">
		            <input type="hidden" name="category" value="${category}">
		            <input type="text" name="searchQuery" placeholder="상품명을 입력하세요" class="search-input" value="${searchQuery}">
		            <button type="submit" class="search-button"></button>
		        </form>
		    </div>
		</div>
	
	
	
	
		<!-- 상품 리스트 -->
		<div class="product-container">
			<c:forEach var="product" items="${ProductList}">
				<div class="product-card"  data-p-no=${product.p_no} data-avg-review-rating=${product.review_avg}>
					<a
						href="${pageContext.request.contextPath}/detail.do?p_no=${product.p_no}">
						<img
						src="${pageContext.request.contextPath}/resources/img/product/${product.p_img}"
						alt="${product.p_name}">
						<h3>${product.p_name}</h3>
						<p>${product.p_content}</p>
					</a>
									<!-- 가격 정보 배치 -->
					<c:if test="${product.p_stock > 0}">
						<div class="product-price-info">
						    <span class="product-price">${product.p_price}원</span>
						    <span class="product-discount">${product.p_discount}원</span>
						    <span class="discount-rate">${product.p_dr}%</span>
						</div>
					</c:if>
					<c:if test="${product.p_stock <= 0}">
						<div class="soldout">품절</div>
					</c:if>
					<div class="star-rating">
					    <span class="star" data-star="1">&#9733;</span>
					    <span class="star" data-star="2">&#9733;</span>
					    <span class="star" data-star="3">&#9733;</span>
					    <span class="star" data-star="4">&#9733;</span>
					    <span class="star" data-star="5">&#9733;</span>
					    <span class="avg-review-rating"> ${product.review_avg} </span>
					</div>
<!-- 					<div class="product-info"> -->
<%-- 						<div class="product-views">조회수: ${product.p_view}</div> --%>
<!-- 					</div> -->
				</div>
			</c:forEach>
		</div>
	
		<!-- 페이징 버튼 -->
		<div class="pagination">
		    <!-- 맨 처음으로 -->
		    <c:if test="${currentPage > 1}">
		        <a href="products.do?page=1&sortType=${sortType}&category=${category}&searchQuery=${searchQuery}"><<</a>
		    </c:if>
		
		    <!-- 이전 페이지 -->
		    <c:if test="${currentPage > 1}">
		        <a href="products.do?page=${currentPage - 1}&sortType=${sortType}&category=${category}&searchQuery=${searchQuery}"><</a>
		    </c:if>
		
		    <!-- 페이지 번호 -->
		    <c:forEach var="i" begin="1" end="${totalPages}">
		        <a href="products.do?page=${i}&sortType=${sortType}&category=${category}&searchQuery=${searchQuery}"
		           class="${i == currentPage ? 'active' : ''}">${i}</a>
		    </c:forEach>
		
		    <!-- 다음 페이지 -->
		    <c:if test="${currentPage < totalPages}">
		        <a href="products.do?page=${currentPage + 1}&sortType=${sortType}&category=${category}&searchQuery=${searchQuery}">></a>
		    </c:if>
		
		    <!-- 맨 끝으로 -->
		    <c:if test="${currentPage < totalPages}">
		        <a href="products.do?page=${totalPages}&sortType=${sortType}&category=${category}&searchQuery=${searchQuery}">>></a>
		    </c:if>
		</div>
	</div>
<%@ include file="../view/footer.jsp"%>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="/header.jsp"%>

<!DOCTYPE html>
<html lang="ko">
<script src="${pageContext.request.contextPath}/resources/js/product.js"></script>

<head>
<meta charset="UTF-8">
<title>상품 상세 정보</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/productDetail.css">

<!-- 외부 글꼴 설정 -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&family=Quicksand:wght@400;700&display=swap" rel="stylesheet">

<script>
        let lastValidQuantity = 1;
        const maxQuantity = 50;

        function numberWithCommas(x) {
            return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        }

        function formatProductInfo() {
            const originalPriceElement = document.querySelector(".product-price .strike");
            const originalPrice = parseInt(originalPriceElement.textContent.replace('원', '').replace(/,/g, '').trim());
            originalPriceElement.textContent = numberWithCommas(originalPrice) + "원";

            const discountedPriceElement = document.querySelector(".product-discount .discounted-price");
            const discountedPrice = parseInt(discountedPriceElement.dataset.price);
            discountedPriceElement.textContent = "할인가: " + numberWithCommas(discountedPrice) + "원";

            const discountRateElement = document.querySelector(".product-discount .discount-rate");
            const discountRate = parseInt(discountRateElement.dataset.rate);
            discountRateElement.textContent = discountRate + "% 할인";
        }

        function increaseQuantity() {
            const quantityInput = document.getElementById("quantity");
            let currentQuantity = parseInt(quantityInput.value);

            if (currentQuantity < maxQuantity) {
                quantityInput.value = currentQuantity + 1;
                updateTotalPrice();
            } else {
                alert("제한 수량을 초과했습니다.");
            }
        }

        function decreaseQuantity() {
            const quantityInput = document.getElementById("quantity");
            if (parseInt(quantityInput.value) > 1) {
                quantityInput.value = parseInt(quantityInput.value) - 1;
                updateTotalPrice();
            }
        }

        function updateTotalPrice() {
            const quantityInput = document.getElementById("quantity");
            let quantity = parseInt(quantityInput.value);

            if (!quantity || quantity <= 0) {
                quantity = 1;
                quantityInput.value = 1;
            }

            if (quantity > maxQuantity) {
                alert("제한 수량을 초과했습니다.");
                quantityInput.value = maxQuantity;
                quantity = maxQuantity;
            }

            const discountedPrice = parseInt(document.querySelector(".product-discount .discounted-price").dataset.price);
            const totalPrice = quantity * discountedPrice;
            document.getElementById("total-price").innerText = numberWithCommas(totalPrice) + "원";
        }

        function openTab(event, tabId) {
            const tabContents = document.getElementsByClassName("tab-content");
            for (let content of tabContents) {
                content.style.display = "none";
            }

            const tabButtons = document.getElementsByClassName("tab-button");
            for (let button of tabButtons) {
                button.classList.remove("active");
            }

            document.getElementById(tabId).style.display = "block";
            event.currentTarget.classList.add("active");
        }

        // 로그인 상태 확인 후 필요한 액션을 수행하는 함수
        function checkLogin(action) {
            if (isLoggedIn === "false") {
                alertAndRedirect("로그인 후 사용해주세요.", "${pageContext.request.contextPath}/login.do");
                return false;
            }
            if (action) action();
        }

        // 알림 창을 띄우고 주어진 URL로 리다이렉트하는 함수
        function alertAndRedirect(message, url) {
            alert(message);
            window.location.href = url;
        }

        // 장바구니에 추가하는 함수 (로그인 확인 포함)
        function addToCart() {
            const quantity = parseInt(document.getElementById("quantity").value);
            if (quantity > maxQuantity) {
                alert("장바구니에 담을 수 있는 최대 수량을 초과했습니다.");
                return;
            }
            checkLogin(function() {
//                 alert("장바구니에 추가되었습니다.");
            });
        }

        // 주문하기 함수 (로그인 확인 포함)
        function orderProduct() {
            checkLogin(function() {
                alert("주문이 완료되었습니다.");
            });
        }

        // 찜 목록에 추가하는 함수 (로그인 확인 포함)
        function addToWishlist() {
            checkLogin(function() {
                alert("찜 목록에 추가되었습니다.");
            });
        }
        
        function openReviewsWrite() {
            document.querySelector('.reviews_write-overlay').style.display = 'flex';
        }

        function closeReviewsWrite() {
            document.querySelector('.reviews_write-overlay').style.display = 'none';
        }

// AJAX를 사용해 리뷰를 전송하는 함수
function submitReview() {
    var formData = new FormData(document.getElementById("reviewForm"));

    $.ajax({
        url: '${pageContext.request.contextPath}/product/addReview',
        type: 'POST',
        data: formData,
        processData: false, // formData를 사용할 경우 이 옵션을 false로 설정
        contentType: false, // formData를 사용할 경우 이 옵션을 false로 설정
        success: function(data) {
            alert(data.message);
            if (data.success) {
                addReviewToList(data.reviewData); // 새 리뷰 추가
                closeReviewsWrite();
                // 리뷰 폼 초기화
                document.getElementById("reviewForm").reset();
               
            } 
        },
        error: function(xhr, status, error) {
            console.error("리뷰 등록 실패:", error);
        }
    });
}

        document.addEventListener("DOMContentLoaded", function() {
            loadReviews();
        });

     // 리뷰 목록을 서버에서 불러와 화면에 표시하는 함수
        function loadReviews() {
    $.ajax({
        url: '${pageContext.request.contextPath}/product/getReviews',
        type: 'GET',
        data: { p_no: document.getElementById("review_p_no").value },
        success: function(response) {
            if (response.success) {
                $("#reviewList").empty();
                response.reviews.forEach(review => {
                    addReviewToList(review);
                });
            } else {
                console.error("리뷰 목록 로딩 실패");
            }
        },
        error: function(xhr, status, error) {
            console.error('리뷰 로딩 실패:', error);
        }
    });
}

// deleteReview: 리뷰 논리 삭제
function deleteReview(reviewId) {
    if (!confirm("리뷰를 삭제하시겠습니까?")) {
        return;
    }

    $.ajax({
        url: '${pageContext.request.contextPath}/product/deleteReview',
        type: 'POST',
        data: { c_id: reviewId },
        success: function(response) {
            if (response.success) {
                $(`.review-item[data-review-id="${reviewId}"]`).remove();
                alert("리뷰가 삭제되었습니다.");
                loadReviews();
            } else {
                alert("리뷰 삭제에 실패했습니다.");
            }
        },
        error: function(xhr, status, error) {
            console.error("리뷰 삭제 실패:", error);
            alert("리뷰 삭제 중 오류가 발생했습니다.");
        }
    });
}
        
        function addReviewToList(review) {
            var $reviewList = $("#reviewList");
            var currentUserId = "${sessionScope.userId}";
            // 리뷰 요소 생성 (jQuery)
            var $newReview = $(
                '<div class="review-item" data-review-id="' + review.c_id + '">' +
                    '<p><strong>' + review.c_id + '</strong> ' +
                    '<span style="font-size: 0.9em; color: #888;">(' + new Date(review.created_at).toLocaleDateString() + ')</span> ' + 
                    '<span style="font-size: 0.9em; color: #007bff;">평점: ' + review.c_avg + '</span> ' +
                    '<span style="font-size: 0.9em; color: #555;">상품명: ' + '${product.p_name}' + '</span></p>' + 
                    '<p>' + review.c_text + '</p>' +
                    (review.c_img ? '<img src="${pageContext.request.contextPath}/resources/img/review/' + review.c_img + '" alt="Review Image" style="width: 100px; height: 100px; object-fit: cover;" />' : '') +
                    (currentUserId == review.c_id ? '<button onclick="deleteReview(\'' + review.c_id + '\')" class="delete-review-btn">삭제</button>'  : '') +
                '</div>'
            );

            // 리뷰 리스트의 맨 앞에 새 리뷰 추가
            $reviewList.prepend($newReview);
        }


     // 별점 표시 및 조정 함수
$(document).ready(function() {
    // 별 클릭 시 fill-ratings 너비 조정
    $(".star-ratings .empty-ratings span").on("click", function() {
        var starIndex = $(this).index() + 1;
        var width = (starIndex / 5) * 100 + "%";
        $(".fill-ratings").css("width", width);
        $("#rating").val(starIndex); // 선택한 별점을 히든 필드에 저장
    });

    // iOS 및 Android에서의 너비 문제 해결
    var star_rating_width = $('.fill-ratings span').width();
    $('.star-ratings').width(star_rating_width);
});

    </script>

<script>
        // 로그인 상태 변수 설정 (JSP에서 세션 값으로 설정)
        const isLoggedIn = "${sessionScope.userId != null}";
    </script>
</head>
<body>
	<%@ include file="/menu.jsp"%>

	<form id="productForm">
		<div class="product-detail-container">
			<div class="product-image">
				<img
					src="${pageContext.request.contextPath}/resources/img/product/${product.p_img}"
					alt="${product.p_name}">
			</div>

			<div class="product-info">
				<h1 class="product-name">${product.p_name}</h1>
				<hr class="name-divider">

				<div class="product-price-info">
					<p class="product-price">
						판매가: <span class="strike"> <fmt:formatNumber
								value="${product.p_price}" type="number" groupingUsed="true" />원
						</span>
					</p>
					<p class="product-discount">
						<span class="discounted-price" data-price="${product.p_discount}">
							할인가: <fmt:formatNumber value="${product.p_discount}"
								type="number" groupingUsed="true" />원
						</span> <span class="discount-rate" data-rate="${product.p_dr}"> <fmt:formatNumber
								value="${product.p_dr}" type="number" maxFractionDigits="0" />%
							할인
						</span>
					</p>
				</div>


				<hr class="divider-line">

				<div class="additional-info">
					<p>상품 번호: ${product.p_callno}</p>
					<p>브랜드: ${product.p_brand}</p>
					<p>원산지: ${product.p_made}</p>
					<p>배송비: ${product.p_delivery}</p>
				</div>

				<hr class="divider-line">

				<div class="quantity-shipping-container">
					<div class="quantity-container">
						<label for="quantity" class="option-label">수량 선택</label>
						<button type="button" onclick="decreaseQuantity()">-</button>
						<input type="text" id="quantity" value="1"
							oninput="updateTotalPrice()" onchange="updateTotalPrice()">
						<button type="button" onclick="increaseQuantity()">+</button>
					</div>
				</div>

				<!-- 총 금액 영역을 수량 선택 영역 밑으로 이동 -->
				<div class="total-price-container" style="margin-top: 15px;">
					<span>총 금액: </span> <span id="total-price"> <fmt:formatNumber
							value="${product.p_discount}" type="number" groupingUsed="true" />원
					</span>
				</div>

				<div class="action-buttons">
					<button type="button" class="cart-button" onclick="addToCart()">
						<span class="button-text-bold">장바구니</span>
					</button>
					<button type="button" class="order-button" onclick="orderProduct()">
						<span class="button-text-bold">주문하기</span>
					</button>
				</div>


			</div>
		</div>

		<input type="hidden" name="p_no" value="${product.p_no}"> <input
			type="hidden" name="p_count" value="${product.p_count}"> <input
			type="hidden" name="p_price" value="${product.p_price}"> <input
			type="hidden" name="p_name" value="${product.p_name}"> <input
			type="hidden" name="p_img" value="${product.p_img}"> <input
			type="hidden" name="p_callno" value="${product.p_callno}"> <input
			type="hidden" name="u_id" value="${sessionScope.userId}">
	</form>

	<div class="tab-container">
		<button class="tab-button active" onclick="openTab(event, 'details')">상품상세</button>
		<button class="tab-button" onclick="openTab(event, 'reviews')">상품후기</button>
		<button class="tab-button" onclick="openTab(event, 'inquiry')">상품안내</button>
	</div>

	<div id="details" class="tab-content" style="display: block;">
		<div id="detail-images" class="detail-images-container">
			${product.d_content}</div>
	</div>

	<div id="reviews" class="tab-content" style="display: none;">
		<div class="review-section">
			<button onclick="openReviewsWrite();">리뷰 작성</button>
			<div id="reviewList"></div>
		</div>
	</div>
	<div class="reviews_write-overlay" style="display: none;">
		<div class="reviews_write">
			 <button class="reviews_write-close" onclick="closeReviewsWrite()">✖</button>
			<form id="reviewForm" enctype="multipart/form-data">
				<div class="star-ratings">
					<input type="radio" name="c_avg" value="5" id="rate1">
						<label for="rate1">★</label>
					<input type="radio" name="c_avg" value="4" id="rate2">
						<label for="rate2">★</label>
					<input type="radio" name="c_avg" value="3" id="rate3">
						<label for="rate3">★</label>
					<input type="radio" name="c_avg" value="2" id="rate4">
						<label for="rate4">★</label>
					<input type="radio" name="c_avg" value="1" id="rate5">
						<label for="rate5">★</label>		
				</div>
				
				<div class="writeBox">
					<!-- 댓글 작성창에서 좌측 작성자, 아이디 숨기기 -->
					<input type="hidden" id="review_p_no" name="p_no" value="${product.p_no}">
					<%--                 <label>작성자: ${sessionScope.userId}</label> --%>
					<input type="hidden" name="c_id" value="${sessionScope.userId}">
					<textarea name="c_text" placeholder="리뷰를 작성하세요" rows="4" cols="50"></textarea>
					
					<input type="file" name="c_img" accept="image/*">
					<button type="button" onclick="submitReview()">리뷰 등록</button>
				</div>
			</form>
		</div>
	</div>
	<div id="inquiry" class="tab-content" style="display: none;">
		${product.d_info}</div>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../view/header.jsp"%>
<style>
.mp_page-container {
	width: 60%;
	margin: 0 auto;
	gap: 30px;
}

.mp_form-container {
	width: 100%;
	margin: 0 auto;
	margin-top: 50px;
}

.title_h4 {
	margin: 0 auto;
	margin-top: 30px;
	font-weight: 700;
}

.title_hr {
	width: 100%;
	margin: auto;
	border: 1px solid #ddd;
}

.order-item {
	background-color: #f1f1f1;
	border-radius: 8px;
	display: flex;
	justify-content: space-between;
	gap: 20px;
	padding: 15px;
	width: 100%;
	position: relative;
}

.order-item img {
	width: 200px;
	height: 200px;
	object-fit: cover;
	border-radius: 5px;
}

.order-item p {
	margin-bottom: 10px;
}

.mp_goBuydetail {
	position: absolute;
	right: 0px;
	top: 0px;
	padding: 10px 20px;
	color: #333;
	font-weight: 600;
}

.buybox {
	background-color: #f8f8f8 !important;
	border: none;
	margin-bottom: 30px;
}

.d-flex.align-items-center {
	gap: 30px;
}

@media screen and (max-width: 426px) {
	.mp_page-container {
		flex-direction: column;
		width: 100%;
		margin-top: 30px;
		padding: 0 10px;
	}
	.order-item {
		flex-direction: column;
		align-items: flex-start;
		height: 200px;
	}
	.title_h4 {
		width: 90%;
		margin: 0;
	}
	.title_hr {
		width: 95%;
	}
	.order-item img {
		width: 120px;
		height: 120px;
		object-fit: cover;
		border-radius: 0px;
	}
	.mp_goBuydetail {
		right: -6px;
		bottom: 15px;
		padding: 16px 23px;
	}
	.d-flex.align-items-center {
		gap: 10px;
	}
	.buy_date {
		font-size: 14px;
		font-weight: 400;
	}
	.buy_num {
		font-size: 13px;
		color: #4B4B4B;
	}
	.pd_name, .pd_count, .pd_sum {
		font-size: 13px;
	}
	.order-item p {
		margin-bottom: 3px;
	}
	
	.buybox{
		height: 200px;
	}
}
</style>

<body>
	<%@ include file="../view/menu.jsp"%>

	<div class="mp_page-container">
		<div class="order-list mt-3">
			<h4 class="title_h4">주문목록</h4><br>
			<hr class="title_hr">
			<div class="mp_form-container">
				<c:forEach items="${buyList}" var="item" varStatus="status">
					<div class="order-item border p-3 mb-3 buybox"
						style="<c:if test='${status.index >= 4}'>display: none;</c:if>"
						data-index="${status.index}">
						<div class="d-flex align-items-center">
							<img
								src="${pageContext.request.contextPath}/resources/img/product/${item.p_img}"
								alt="상품 이미지">
							<div class="buy_contents">
								<p class="buy_date">
									<strong>주문일자:</strong> ${item.o_input_date} <a
										href="buyListDetail.do?c_no=${item.c_no}"
										class="mp_goBuydetail"> ➕ </a>
								</p>
								<p class="buy_num">
									<strong>주문번호:</strong> ${item.merchant_uid}
								</p>
								<hr>
								<p class="pd_name">
									<strong>상품명:</strong> ${item.p_name}
								</p>
								<p class="pd_count">
									<strong>구매 수량:</strong> ${item.o_total_cnt}개
								</p>
								<p class="pd_sum">
									<strong>구매 합계:</strong> ${item.o_total_price}원
								</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<!-- 더보기 버튼 -->
			<div class="text-center mt-4" style="margin-bottom: 20px;">
				<button id="loadMoreBtn" class="btn btn-primary" style="background-color: darkgray; color:white; border: none;">더보기</button>
			</div>
		</div>
	</div>

	<script>
		document.addEventListener("DOMContentLoaded", function() {
		    const loadMoreBtn = document.getElementById('loadMoreBtn');
		    const items = document.querySelectorAll('.order-item');
		    let currentIndex = 2;
	
		    loadMoreBtn.addEventListener('click', function() {
		        const nextItems = Array.from(items).slice(currentIndex, currentIndex + 2);
		        nextItems.forEach(item => item.style.display = 'flex'); 
		        currentIndex += 2;
		        if (currentIndex >= items.length) {
		            loadMoreBtn.style.display = 'none';
		        }
		    });
		});
	</script>
</body>

<!-- Bootstrap -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
	rel="stylesheet">
</html>

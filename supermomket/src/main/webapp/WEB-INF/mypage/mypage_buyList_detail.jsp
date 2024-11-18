<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../view/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="${pageContext.request.contextPath}/resources/js/pay.js"></script>
<style>

.mp_page-container {
	width: 60%;
	margin: 0 auto;
	gap: 30px;
}

.order-details {
	background-color: #f8f8f8;
	border-radius: 8px;
	padding: 15px;
	margin-bottom: 30px;
	border: 1px solid #ddd;
	position: relative;
}

.order-details>p {
	margin-bottom: 3px;
}

.title_hr {
	width: 100%;
	margin: auto;
	border: 1px solid #ddd;
	margin-bottom: 20px;
}

.order-item {
	background-color: #f1f1f1;
	border-radius: 8px;
	display: flex;
	align-items: center;
	gap: 20px;
	padding: 15px;
	margin-bottom: 20px;
	position: relative;
	width: 100%;
}


.order-item img {
	width: 150px;
	height: 150px;
	object-fit: cover;
}

.order-item .buy_contents {
	flex-grow: 1;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: flex-start;
}

.order-item p {
	font-size: 14px;
	color: #333;
	margin: 3px 0;
}

.cancelpaymodel {
	margin-top: 20px;
	margin-right: 10px;
	background: darkgray;
	color: white;
	border: none;
	padding: 10px 15px;
	border-radius: 5px;
	cursor: pointer;
	position: absolute;
	right: 0;
	top: 0;
}

.cancelpaydiv {
	margin-top: 20px;
	display: none;
	background-color: #f8f8f8;
	padding: 20px;
	border-radius: 8px;
	border: 1px solid #ddd;
}

.cancelpaydiv input {
	width: calc(100% - 120px);
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 5px;
}

.cancelpaydiv button {
	margin-top: 10px;
	background-color: #dc3545;
	color: white;
	border: none;
	padding: 10px 20px;
	border-radius: 5px;
	cursor: pointer;
}

@media screen and (max-width: 426px) {
	.mp_page-container {
		width: 100%;
		padding: 0 10px;
	    margin-top: 100px
	}

	.title_hr {
		width: 90%;
	}

	.order-item {
		display: flex;
		flex-direction: row;
		align-items: center;
		gap: 10px;
	}

	.order-item img {
		width: 100px;
		height: 100px;
	}

	.order-item .buy_contents {
		width: calc(100% - 100px);
	}

	.order-item p {
		font-size: 14px;
		margin-bottom: 2px;
	}

	.cancelpaydiv input {
		width: 100%;
	}
}
</style>

<body>
	<%@ include file="../view/menu.jsp"%>
	<div class="mp_page-container">
		<hr class="title_hr">
		<div class="order-details">
			<c:choose>
				<c:when test="${empty buyListDetail}">
					<p>조회된 데이터가 없습니다.</p>
				</c:when>
				<c:otherwise>
					<c:set var="item" value="${buyListDetail[0]}" />
					<p><strong>주문일자 :</strong> ${item.o_input_date}</p>
					<button class="cancelpaymodel" onclick="toggleCancelPay()">결제 취소</button>
					<p><strong>주문번호 :</strong> ${item.merchant_uid}</p>
					<hr>
					<p><strong>수령인 :</strong> ${item.o_receiver}</p>
					<p><strong>수령인 연락처 :</strong> ${item.o_receiver_contact}</p>
					<p><strong>배송지 :</strong> ${item.o_address}</p>
					<p><strong>총 금액 :</strong> ${item.o_total_price}원</p>
					<p><strong>결제방식 :</strong> ${item.o_pay_type}</p>
					<p><strong>결제상태 :</strong> ${item.o_cancel_yn}</p>
				</c:otherwise>
			</c:choose>
		</div>

		<c:forEach items="${buyListDetail}" var="product">
			<div class="order-item">
				
				<a href="/detail.do?p_no=${product.p_no}" class="text-decoration-none text-dark">
				<img src="${pageContext.request.contextPath}/resources/img/product/${product.p_img}" alt="상품이미지">
				<div class="buy_contents">
					<p><b>상품명:</b> ${product.p_name}</p>
					<p><b>구매수량:</b> ${product.p_count}개</p>
					<p><b>금액:</b> ${product.p_total}원</p>
<%-- 					<c:if test="${product.p_review_yn == 'N'}"> --%>
<%-- 						<button type="button" onclick="location.href='/goReview.do?p_no=${product.p_no}&merchant_uid=${product.merchant_uid}'">리뷰쓰기</button> --%>
<%-- 					</c:if> --%>
				</div>
				</a>
			</div>
		</c:forEach>

		<div class="cancelpaydiv">
			<form>
				취소할 주문번호 입력: <input type="text" id="merchant_uid" name="merchant_uid"><br>
				<button type="button" onclick="cancelPay()">결제 취소</button>
			</form>
		</div>
	</div>

	<script>
		function toggleCancelPay() {
			const cancelPayDiv = document.querySelector('.cancelpaydiv');
			cancelPayDiv.style.display = cancelPayDiv.style.display === 'none' ? 'block' : 'none';
		}

		function cancelPay() {
			$.ajax({
				url: "/payCancel",
				type: "post",
				data: { "merchant_uid": $("#merchant_uid").val() },
				cache: false,
				async: false,
				success: function(res) {
					location.reload();
				},
				error: function(err) {
					console.log('err: ', err);
				}
			});
		}
	</script>
</body>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
	.mp_sidebar {
		width: 250px;
		border-radius: 8px;
		margin-left: 200px;
		margin-top: 200px;
		background: white;
		border: 1px black;
	}
	
	.mp_container {
		display: flex;
		padding: 20px;
		margin-top: 100px;
		align-items: flex-start;
	}
	
	.list-group-item:hover {
		background-color: #e9ecef;
	}
	
	.order-item {
		background-color: #f1f1f1;
		border-radius: 8px;
	}
</style>
<body>
	<%@ include file="/menu.jsp"%>
	<div class="mp_container">
		<!-- 			<h3>주문 목록</h3> -->
		<div class="order-list d-flex flex-column align-items-center flex-grow-1">

			<c:choose>
			    <c:when test="${empty buyListDetail}">
			        <p>조회된 데이터가 없습니다.</p>
			    </c:when>
			    <c:otherwise>
			        <c:set var="item" value="${buyListDetail[0]}" />
			        <p>
			            <strong>주문일자</strong> ${item.o_input_date}<br>
			            <strong>주문번호</strong> ${item.o_no}<br>
			            <strong>수령인</strong> ${item.o_receiver}<br>
			            <strong>수령인 연락처</strong> ${item.o_receiver_contact}<br>
			            <strong>배송지</strong> ${item.o_address}<br>
			            <strong>총 금액</strong> ${item.o_total_price}<br>
			            <strong>결제방식</strong> ${item.o_pay_type}<br>
			        </p>
			        
			        <c:forEach items="${buyListDetail}" var="item">
			        	<a href="/detail.do?p_no=${item.p_no}" class="text-decoration-none text-dark">
			            <div class="order-item border p-3 mb-3 rounded d-flex align-items-center justify-content-between" style="width: 60%; margin: 0 auto;">
			                <div class="d-flex align-items-center">
			                    <p class="mb-0">
			                        <img src="${pageContext.request.contextPath}/resources/img/product/${item.p_img}" alt="상품이미지" style="width: 120px; height: 120px; object-fit: cover; border-radius: 8px; margin-right: 15px;">
			                    </p>
			                    <p class="mb-0">${item.p_name}</p>
			                    <p class="mb-0">${item.o_total_cnt}</p>
			                    <p class="mb-0">${item.p_count}</p>
			                    <p class="mb-0">${item.o_address}</p>
			                    <p class="mb-0">${item.o_cancel_yn}</p>
			                    <p class="mb-0">${item.o_status}</p>
			                </div>
			            </div>
			        </c:forEach>
			    </c:otherwise>
			</c:choose>
		</div>
	</div>
	<!-- 	</div> -->
</body>

<!-- Bootstrap -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

</html>

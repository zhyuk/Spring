<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/header.jsp"%>
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
    display: flex; 
    align-items: center;
    justify-content: space-between; 
    gap: 20px; 
}

.order-item img {
    width: 100px; 
    height: 100px;
    object-fit: cover; 
    border-radius: 8px;
}


</style>
<body>
	<%@ include file="/menu.jsp"%>
	
	<div class="mp_container">
<!-- 		<div class="mp_sidebar"> -->
<!-- 			<h4 class="text-center"></h4> -->
<!-- 			<ul class="list-group mt-3"> -->
<!-- 				<li class="list-group-item text-center"><a class="text-decoration-none text-dark" href="buyList.do">주문 목록</a></li> -->
<!-- 				<li class="list-group-item text-center"><a class="text-decoration-none text-dark" href="zzimList.do">찜 목록</a></li> -->
<!-- 				<li class="list-group-item text-center"><a class="text-decoration-none text-dark" href="updateMypage.do">개인정보 수정</a></li> -->
<!-- 				<li class="list-group-item text-center"><a class="text-decoration-none text-dark" href="updatePassword.do">비밀번호 수정</a></li> -->
<!-- 			</ul> -->
<!-- 		</div> -->
<!-- 			<h3>주문 목록</h3> -->
		<div class="order-list d-flex flex-column align-items-center flex-grow-1" style="margin-top: 180px;">
			<c:forEach items="${buyList}" var="item">
				<div class="order-item border p-3 mb-3 rounded">
				    <div class="d-flex align-items-center" style="gap: 20px;">
				        <img src="${pageContext.request.contextPath}/resources/img/product/${item.p_img}" alt="상품 이미지">
				        <div>
				            <p><strong>주문일자</strong> ${item.o_input_date} <a href="buyListDetail.do?o_no=${item.c_no}" class="mp_goBuydetail">>></a></p>
				            <p><strong>주문번호</strong> ${item.c_no}</p>
				            <div class="d-flex">
<%-- 				                <p class="mb-0">${item.p_name}</p> --%>
				                <p class="mb-0">${item.o_total_cnt}</p>
				                <p class="mb-0">${item.o_total_price}</p>
				            </div>
				        </div>
				    </div>
				</div>
			</c:forEach>
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

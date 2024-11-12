<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/header.jsp"%>

<style>


	.mp_sidebar {
	    width: 250px;
	    border-radius: 8px;
	    background: white;
	    border: 1px solid #ddd;
	}
	
	.mp_container {
	    display: flex;
	    justify-content: center; /* 중앙 정렬 */
	    align-items: flex-start; /* 상단 정렬 */
	    gap: 20px; /* 사이드바와 리스트 간격 */
	    padding: 20px;
	    margin-top: 50px;
	}
	
	.list-group-item:hover {
		background-color: #e9ecef;
	}
	
	.zzim-item {
	    background-color: #f1f1f1;
	    border-radius: 8px;
	    display: flex;
	    align-items: center;
	    gap: 20px;
	    padding: 15px;
	    border: 1px solid #ddd;
	    width: 100%;
	    max-width: 800px;
	    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	}
	
	.zzim-item img {
	    width: 120px; /* 이미지 폭 고정 */
	    height: 120px; /* 이미지 높이 고정 */
	    object-fit: cover; /* 이미지 비율 유지하며 잘림 */
	    border-radius: 8px; /* 둥근 모서리 */
	}
	
	.zzim-item div {
	    display: flex;
	    flex-direction: column; /* 텍스트를 세로로 나열 */
	    gap: 5px; /* 텍스트 간의 간격 */
	    flex: 1; /* 텍스트가 남은 공간을 차지하도록 */
	}
	
	.zzim-item p {
	    margin: 0; /* 텍스트 간 여백 제거 */
	    font-size: 14px; /* 텍스트 크기 조정 */
	    line-height: 1.5; /* 텍스트 높이 조정 */
	    color: #333; /* 텍스트 색상 */
	}
	
</style>

<body>
	<%@ include file="/menu.jsp"%>
	
	<div class="mp_container">
<!-- 	    <div class="mp_sidebar"> -->
<!-- 	        <ul class="list-group"> -->
<!-- 			<li class="list-group-item text-center"><a class="text-decoration-none text-dark" href="buyList.do">주문 목록</a></li> -->
<!-- 				<li class="list-group-item text-center"><a class="text-decoration-none text-dark" href="zzimList.do">찜 목록</a></li> -->
<!-- 				<li class="list-group-item text-center"><a class="text-decoration-none text-dark" href="updateMypage.do">개인정보 수정</a></li> -->
<!-- 				<li class="list-group-item text-center"><a class="text-decoration-none text-dark" href="updatePassword.do">비밀번호 수정</a></li> -->
<!-- 	        </ul> -->
<!-- 	    </div> -->
	    <div class="order-list">
	        <c:forEach items="${zzimList}" var="item">
	            <div class="zzim-item">
	                <img src="/path/to/image/${item.p_img}" alt="Product Image">
	                <div>
	                    <p><strong>${item.p_name}</strong></p>
	                    <p>상품번호: ${item.p_no}</p>
	                    <p>가격: ${item.p_price}</p>
	                </div>
	            </div>
	        </c:forEach>
	    </div>
</div>
</body>
	  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
	  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</html>

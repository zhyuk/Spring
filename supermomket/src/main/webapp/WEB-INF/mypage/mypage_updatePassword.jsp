<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../view/header.jsp"%>
<style>
	
	.mp_page-container {
		margin-top: 100px;
		display: flex;
		justify-content: center;
		gap: 20px; 
	}
	
	.mp_form-container {
		flex: 1; 
		width: 100%; 
		max-width: 800px; 
		margin: auto; 
	}
	
</style>
<body>
	<%@ include file="../view/menu.jsp"%>

	<div class="mp_page-container" style="margin: auto;">
		<div class="mp_page-container" style="margin-top: 180px;">
			<div class="mp_form-container mt-3">

				<h6 class="text-center">사용자 비밀번호 변경</h6>
				<form action="updatePassword_detail.do" onsubmit="return goUpdatePwCheck(event)" method="POST" name="mp_updateForm">
					<div class="input-group mb-3">
						<input type="text" class="form-control mp_input" id=u_id name="u_id" value="${userId}" style="width: 500px; height: 70px; display: inline-block;" readonly>
					</div>
					<div class="input-group mb-3">
						<input type="password" class="form-control mp_input" id="u_pw" name="u_pw" placeholder="현재 비밀번호"	style="width: 500px; height: 70px; display: inline-block;">
					</div>
					<div class="text-end">
						<button type="submit" class="btn" style="width: 100%; height: 70px; background-color: #DDAF9C;">확인</button>
					</div>
					<br>
					<h6 style="text-align: right;">※ 카카오계정연동으로 로그인 회원 비밀번호는<br>
					가입한 휴대폰 번호 마지막 네자리 입니다.</h6>
				</form>
			</div>
		</div>
	</div>
	<!-- menu.jsp 내 <div id="wrap> 닫는 태그 -->

    <c:if test="${checkYn == 'N'}">
        <script>
            alert("${errorMessage}");
        </script>
    </c:if>

</body>
<script src="${pageContext.request.contextPath}/resources/js/mypage.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</html>
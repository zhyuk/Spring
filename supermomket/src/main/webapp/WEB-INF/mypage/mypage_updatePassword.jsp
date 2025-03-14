<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../view/header.jsp"%>

<style>
.mp_page-container {
	margin-top: 30px;
	display: flex;
	justify-content: center;
	gap: 20px;
}

.mp_form-container {
	width: 100%;
	max-width: 500px;
	margin: auto;
}

.mp_updateForm {
	margin-top: 120px;
}

.form-control {
	width: 100%;
	max-width: 100%;
	box-shadow: none !important;
}

.form-control:focus {
	border: 3px #FAE6BF !important;
	box-shadow: 0 0 5px rgba(250, 230, 191, 0.5) !important;
	outline: none !important;
}

.w-100 {
	background-color: #FFD26E;
	border: none;
	font-size: 18px !important;
}

.title_h4 {
	margin: 0 auto;
	font-size: 40px;
	font-weight: 700;
	font-family: 'yg-jalnan' !important;
	text-align: center;
}

.title_hr {
	margin: 0 auto;
}

.form-control[readonly] {
	background-color: #FFFCF6 !important;
	opacity: 1;
}

.mp_form-container input[readonly] {
	color: #333;
	background-color: #FFFCF6 !important;
	color: #333 !important;
	cursor: not-allowed;
}

.p_kakaoMent {
	font-size: 14px;
}

@media screen and (max-width : 425px) {
	.mp_page-container {
		flex-direction: column;
		width: 100%;
/* 		margin-top: 30px; */
		padding: 0 10px;
	}
	
	.mp_form-container {
		width: 100%;
		padding: 10px;
 	    margin-top: 95px;
	}
	
	.mp_updateForm {
        margin-top: 40px; 
	}
	
	.form-control {
		width: 100%;
	}
	.w-100 {
		width: 100%;
		height: 70px;
		background-color: #FFD26E;
	}
	
	p_kakaoMent {
		font-size: 14px;
	}
	
	.title_h4 {
		font-size: 24px;
		font: bolder;
		width: 100%;
		margin: 0 auto;
	}
	
	.title_hr {
		width: 0;
		margin: 0;
	}
	
}
</style>

<body>
	<%@ include file="../view/menu.jsp"%>

	<div class="mp_page-container">
		<div class="mp_form-container">

			<h4 class="title_h4">비밀번호 수정</h4>
			<br>
			<hr class="title_hr">
			<form class="mp_updateForm" action="updatePassword_detail.do"
				onsubmit="return goUpdatePwCheck(event)" method="POST"
				name="mp_updateForm">
				<div class="input-group mb-3">
					<input type="text" class="p18 form-control mp_input" id=u_id
						name="u_id" value="${userId}"
						style="height: 70px; display: inline-block;" readonly>
				</div>
				<div class="form-floating mb-3">
					<input type="password" class="p18 form-control mp_input" id="u_pw"
						name="u_pw" placeholder="현재 비밀번호"
						style="height: 70px; display: inline-block;">
				</div>
				<div class="text-end">
					<button type="submit" class="btn w-100"
						style="height: 70px; background-color: #FFD26E;">확 인</button>
				</div>
				<br>
				<p class="p_kakaoMent" style="text-align: right;">
					※ 카카오계정연동으로 로그인 회원 비밀번호는<br> 가입한 휴대폰 번호 마지막 네자리 입니다.
				</p>
			</form>
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
</html>
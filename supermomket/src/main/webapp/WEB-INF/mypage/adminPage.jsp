<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../admin/header.jsp"%>

<!-- 현재 페이지 위치 기준으로 수정 -->

<style>
* {
	font-size: 18px !important;
}

button {
	background-color: black !important;
	height: 40px !important;
	color: white !important;
	border: none !important;
	border-radius: 5px !important;
	font-size: 16px !important;
	cursor: pointer;
	font-weight: normal !important;
}

button:hover {
	background-color: #c0c0c0 !important; /* 버튼에 마우스를 올렸을 때 배경색 변경 */
}

h1 {
	font-size: 23px !important;
}

.mp_page-container {
	margin-top: 150px;
	margin-left: 250px;
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
	margin-top: 70px;
}

.form-control {
	width: 100%;
	max-width: 100%;
	box-shadow: none !important;
}

.form-control:focus {
	border: 3px black !important;
	box-shadow: 0 0 5px rgba(250, 230, 191, 0.5) !important;
	outline: none !important;
}

.btn {
	background-color: darkgray !important;
	border: none !important;
	font-size: 18px !important;
	/* 	font-weight: 600 !important; */
}

.title_h4 {
	/* 	width: 50%; */
	margin: 0 auto;
	font-weight: 700;
	font-size: 23px;
}

.title_hr {
	width: 100%;
	border: 0;
	height: 2px;
	background-color: #eee;
}

.mp_form-container input[readonly] {
	color: #333;
	color: #333 !important;
	cursor: not-allowed;
}

/* @media screen and (max-width : 426px) { */

/* .mp_page-container { */
/* 	flex-direction: column; */
/* 	width: 100%; */
/* 	margin-top: 30px; */
/* 	padding: 0 10px; */
/* } */

/* .mp_form-container { */
/* 	width: 100%; */
/* 	width: 100%; */
/* 	padding: 10px; */
/* } */

/* .mp_updateForm{ */
/* 	margin-top: 50px; */
/* } */

/* .form-control { */
/* 	width: 100%; */
/* } */

/* .btn { */
/* 	width: 100%; */
/* 	font-weight: 600; !important; */
/* 	height: 70px; */
/* 	background-color: darkgray; */
/* 	font-size: 18px; */
/* } */

/* .title_h4{ */
/* 	font: bolder; */
/* 	width: 90%; */
/* 	margin: 0 auto; */
/* } */

/* .title_hr{ */
/* 	width: 90%; */
/* 	margin: 0 auto; */
/* } */

/* button[type="submit"]{ */
/* 	font-size: 20px; */
/* } */

a {
    color: #bbb !important;
}
</style>
<body>
	<%@ include file="../admin/menu.jsp"%>
	<div class="mp_page-container">
		<div class="mp_form-container mt-3">

			<h4 class="title_h4">관리자 비밀번호 변경</h4>
			<hr class="title_hr">
			<form class="mp_updateForm" action="/updateAdminDetail.do"
				onsubmit="return goAdminPwCheck(event)" name="mp_updateForm"
				method="post">
				<div class="form-floating mb-3">
					<input type="text" class="form-control mp_input" id="u_id"
						name="u_id" value="${adminId}"
						style="height: 70px; display: inline-block;" readonly>
				</div>
				<div class="form-floating mb-3">
					<input type="password" class="form-control mp_input" id="u_pw"
						name="u_pw" placeholder="현재 비밀번호"
						style="height: 70px; display: inline-block;">
				</div>
				<div class="text-end">
					<button type="submit" class="btn w-100" style="height: 70px;">확
						인</button>
				</div>
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
</html>
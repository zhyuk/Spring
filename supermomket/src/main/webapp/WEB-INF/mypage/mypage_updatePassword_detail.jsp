<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../view/header.jsp"%>
<!-- 현재 페이지 위치 기준으로 수정 -->

<style>
.mp_page-container {
    margin: 0 auto;
    margin-top: 30px;
/* 	display: flex; */
	justify-content: center;
	gap: 20px;
    flex-direction: column;
    max-width: 500px;
}

.mp_form-container {
    width: 100%;
    max-width: 500px;
    margin: 0 auto; 
    margin-left: 250px;
  	margin-top: -15px;
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
	border: none !important;
	font-size: 20px;
/* 	font-weight: 600 !important; */
}

.title_h4{
/* 	width: 50%; */
	margin: 0 auto;
	font-weight: 700;
}

.title_hr {
    margin: 19px auto;
}
.mp_updateForm input[readonly] {
    color: #333 !important;
    background-color: #FFFCF6 !important;
    cursor: not-allowed;
}


@media screen and (max-width : 426px) {

.mp_page-container {
	flex-direction: column;
	margin-top: 50px;
	padding: 0 10px;
}
	
.mp_form-container {
    width: 90%;
   	margin: 0 auto;
	font-size: 14px;
	padding: 10px;
    margin-top: 130px;
}
	
.mp_updateForm{
    width: 95%;
    margin: 15px auto;
}	
	
.form-control {
	width: 100%;
	font-size: 10px;
	margin-top"
}
	
.w-100 {
	width: 100%;
	height: 50px;
	font-size: 18px !important;
}
	
p {
	font-size: 12px;
}
	
.title_h4{
	font: bolder;
    width: 95%;
    margin: 0 auto;
    margin-top: 115px;
}

.title_hr{
    margin: 23px auto;
    width: 95%;
}

</style>
<body>
	<%@ include file="../view/menu.jsp"%>
	<div class="mp_page-container">
		<div name="mp_form-container" onsubmit="return goChkChk(event)" action="setNewPassword.do" method="POST">
		
		<h4 class="title_h4">비밀번호 수정</h4>
		<hr class="title_hr">
		<form class="mp_updateForm">
			<div class="form-floating mb-3">
				<input type="text" class="form-control" id="u_id" name="u_id"
					value="${userId}" style="height: 70px; display: inline-block;" readonly>
			</div>
			<div class="form-floating mb-3">
				<input type="password" class="form-control" id="newPw" name="newPw"
					onblur="goPwChk();"
					style="height: 70px; display: inline-block;"
					placeholder="새 비밀번호">
				<div id="newPw_error"
					style="color: red; font-size: 14px; margin-top: 5px;">
				</div>
			</div>
			<div class="form-floating mb-3">
				<input type="password" class="form-control" id="newPwChk"
					name="n_pw" onblur="goPwChk();"
					style="width: 500px; height: 70px; display: inline-block;"
					placeholder="새 비밀번호 재입력"> <input type="hidden"
					class="presentPw" id="u_pw" name="u_pw">
				<div id="newPwChk_error"
					style="color: red; font-size: 14px; margin-top: 5px;">
				</div>
			</div>
			<div class="text-end">
				<button type="submit" class="btn w-100" style="height: 70px; display: inline-block; background-color: #FFD26E;">확 인</button>
			</div>
			<!-- 				<div> -->
			<%-- 					<input type="hidden" id="hidden_userId" name="userId" value="${userId}"> --%>
			<!-- 				</div> -->
		</form>
		</div>
	</div>
	<!-- menu.jsp 내 <div id="wrap> 닫는 태그 -->

</body>
<script src="${pageContext.request.contextPath}/resources/js/mypage.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

</html>
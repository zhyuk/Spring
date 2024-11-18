<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../admin/header.jsp"%>
<!-- 현재 페이지 위치 기준으로 수정 -->
<style>
    
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
    /* margin: auto; */
    margin-left: 250px;
    margin-top: 167px;
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
	font-size: 20px;
/* 	font-weight: 600 !important; */
}

.title_h4{
/* 	width: 50%; */
	margin: 0 auto;
	font-weight: 700;
}

.title_hr {
    width: 100%;
    border: 0;
    height: 1px;
    background-color: lightgray;
}

.mp_form-container input[readonly] {
	color: #333;
    color: #333 !important;
    cursor: not-allowed;
}


</style>
<body>
	<%@ include file="../admin/menu.jsp"%>
	<div class="mp_page-container" style="margin: auto;">
		<div class="mp_form-container" >
		
		<h4 class="title_h4">관리자 비밀번호 변경</h4>
		<hr class="title_hr">
	
			<form class="mp_updateForm" name="mp_updateForm" action="setNewAdminPw.do" onsubmit="return goAdminChkChk(event)" method="POST" >
				<div class="form-floating mb-3">
					<input type="text" class="form-control" id=u_id name="u_id" value="${adminId}" style="height: 70px; display: inline-block;" disabled readonly>
				</div>
				<div class="form-floating mb-3">
					<input type="password" class="form-control" id="newPw" name="newPw" onblur="goAdminPwChk();" style="height: 70px; display: inline-block;" placeholder="새 비밀번호 입력">
					<div id="newPw_error" style="color:red; font-size:12px; margin-top: 7px;"></div>
				</div>
				<div class="form-floating mb-3">
					<input type="password" class="form-control" id="newPwChk" name="n_pw" onblur="goAdminPwChk();" style="height: 70px; display: inline-block;" placeholder="새 비밀번호 재입력">
					<div id="newPwChk_error" style="color:red; font-size:12px; margin-top: 7px;" ></div>
				</div>
				<div class="text-end">
					<button type="submit" class="btn w-100" style="height: 70px; display: inline-block;">확인</button>
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
	  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

</html>
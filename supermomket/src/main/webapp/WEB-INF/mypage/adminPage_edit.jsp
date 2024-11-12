<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/header.jsp"%>
<!-- 현재 페이지 위치 기준으로 수정 -->
<style>
    
.mp_page-container {
    display: flex;
    justify-content: center;
    align-items: center; 
    gap: 20px;  
    width: 100%; 
}

.mp_form-container {
    flex: 1; 
    width: 100%; 
    max-width: 800px; 
    margin: auto; 
}
</style>
<body>
	<%@ include file="/menu.jsp"%>
	<div class="mp_page-container" style="margin: auto;">
	
		<div class="mp_form-container" >
			<form name="mp_updateForm" action="setNewAdminPw.do" onsubmit="return goAdminPwCheck(event)" style="width: 500px; margin:0 auto; margin-top: 200px;" method="POST" >
				<div class="form-floating mb-3">
					<input type="text" class="form-control" id=u_id name="u_id" value="${userId}" style="width: 500px; height: 70px; display: inline-block;" disabled readonly>
				</div>
				<div class="form-floating mb-3">
					<input type="password" class="form-control" id="newPw" name="newPw" onblur="goAdminPwChk();" style="width: 500px; height: 70px; display: inline-block;" placeholder="새 비밀번호 입력">
					<div id="newPw_error" style="color:red; font-size:12px; margin-top: 7px;"></div>
				</div>
				<div class="form-floating mb-3">
					<input type="password" class="form-control" id="newPwChk" name="n_pw" onblur="goAdminPwChk();" style="width: 500px; height: 70px; display: inline-block;" placeholder="새 비밀번호 재입력">
					<div id="newPwChk_error" style="color:red; font-size:12px; margin-top: 7px;" ></div>
				</div>
				<div class="text-end">
					<button type="submit" class="btn " style="width: 500px; height: 70px; display: inline-block; background-color: #DDAF9C;">확인</button>
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
	  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
	  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

</html>
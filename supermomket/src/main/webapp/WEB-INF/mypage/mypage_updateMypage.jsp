<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../view/header.jsp"%>
<!-- 현재 페이지 위치 기준으로 수정 -->

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
<!-- 		<div class="mp_sidebar"> -->
<!-- 			<h4 class="text-center"></h4> -->
<!-- 			<ul class="list-group mt-3"> -->
<!-- 				<li class="list-group-item text-center"><a class="text-decoration-none text-dark" href="buyList.do">주문 목록</a></li> -->
<!-- 				<li class="list-group-item text-center"><a class="text-decoration-none text-dark" href="zzimList.do">찜 목록</a></li> -->
<!-- 				<li class="list-group-item text-center"><a class="text-decoration-none text-dark" href="updateMypage.do">개인정보 수정</a></li> -->
<!-- 				<li class="list-group-item text-center"><a class="text-decoration-none text-dark" href="updatePassword.do">비밀번호 수정</a></li> -->
<!-- 			</ul> -->
<!-- 		</div> -->

	<div class="/mp_page-container"  style="margin-top: 180px;" >
		<div class="mp_form-container mt-3" >
		
			<h6 class="text-center">개인정보수정</h6>
			<form action="updateMypage_detail.do" onsubmit="return goUpdateInfo(event)" method="POST" name="mp_updateForm" method="post">
				<div class="form-floating mb-3">
					<input type="text" class="form-control" id=u_id name="u_id" value="${userId}" style=" width: 500px; height: 70px; display: inline-block;" readonly>
				</div>
				<div class="form-floating mb-3">
					<input type="password" class="form-control" id="u_pw" name="u_pw" aria-describedby="passwordHelpBlock" placeholder="현재 비밀번호" style=" width: 500px; height: 70px; display: inline-block;">
				</div>
				<div class="text-end">
					<button type="submit" class="btn" style="width: 500px; height: 70px; background-color: #DDAF9C;">확인</button>
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
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../view/header.jsp"%>
<!-- 현재 페이지 위치 기준으로 수정 -->
<style>
.mp_updateForm {
	width: 50%;
	margin: 0 auto;
	margin-top: 50px;
	margin-bottom: 20px font-size: 18px;
}

div input[type="text"] {
	font-size: 18px;
}

fieldset {
	margin-bottom: 20px;
	border-radius: 10px;
	border: 1px solid #F8F8F8;
	padding: 0px 20px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	transition: all 0.3s ease;
}

fieldset:hover {
	box-shadow: 0 6px 10px rgba(0, 0, 0, 0.15);
	background-color: #FFFAF0;
}

legend {
	font-weight: bold;
	font-size: 18px;
	width: fit-content;
	color: black;
	padding: 0 10px;
	border-radius: 5px;
}

.form-floating {
	margin-bottom: 15px;
}

input[type="text"], button {
	width: 100%;
	height: auto;
	padding: 10px 15px;
	border-radius: 5px;
	border: 1px solid #CCC;
}

input:focus, button:focus {
	outline: none;
	border-color: #FF9900;
	box-shadow: 0 0 5px rgba(255, 153, 0, 0.5);
}

.chkchk {
	background-color: #FFD26E;
	color: #333;
	border-radius: 5px;
	flex: 1;
}

button {
	/*     margin-top: 10px; */
	width: 100%;
	padding: 10px;
	background-color: #FFD26E;
	border: none;
	border-radius: 8px;
	color: #333;
	transition: background-color 0.3s ease, transform 0.2s ease;
}

button:hover {
	background-color: #FFB84D;
}

button:active {
	background-color: #FF9900;
}

.text-end {
	text-align: center;
}

.btn {
	font-size: 18px;
}

input:read-only {
	background-color: #E8F0FE;
	!
	important;
}

.mp_form-container input[readonly] {
	color: #333;
	background-color: #FFFCF6 !important;
	color: #333 !important;
	cursor: not-allowed;
}

.form-floating.mb-3 {
	display: flex;
	gap: 10px;
}

#floatingNickname, input[type="text"] {
	height: 70px;
}

.chkchk {
	height: 70px;
}

.title_h4 {
    text-align: center;
	font-size: 40px;
	width: 50%;
	margin: 0 auto;
	margin-top: 30px;
	font-weight: 700;
	font-family: 'yg-jalnan' !important;
}

.title_hr {
	width: 50%;
	margin: 0 auto;
}

.btn btn-del{
    height: 45px;
    width: 100%;
    margin: 13px 0px;
    border: none;
    background-color: #F6F6F6;
}


@media screen and (max-width : 425px) {
	.mp_updateForm {
		margin-top: 50px;
		width: 95%;
	}
	
	.mp_form-container{
        margin-top: 135px;
	}
	
	input[type="text"], button {
		font-size: 14px;
		padding: 6px;
	}
	
	legend {
		font-size: 15px;
	}
	fieldset {
		padding: 5px;
	}
	.chkchk {
		flex: 2;
	}
	button {
		font-size: 16px;
	}
	.title_h4 {
		font-size: 24px;
		font: bolder;
		width: 90%;
		margin: 0 auto;
		margin-top: 50px;
	}
	.title_hr {
		width: 0;
		margin: 0 auto;
	}
}
</style>


<body>
	<%@ include file="../view/menu.jsp"%>
	<div class="mp_page-container">

		<div class="mp_form-container">
			<h4 class="title_h4">개인정보 수정</h4>
			<br>
			<hr class="title_hr">
			<form class="mp_updateForm" name="mp_updateForm"
				onsubmit="return goValidateForm(event)" action="setNewMypage.do"
				method="post">
				<fieldset style="margin-bottom: 20px; padding: 15px;">
					<legend>아이디</legend>
					<div class="form-floating mb-3">
						<input type="hidden" name="u_id" value="${mypageDetail.u_id}">
						<input type="hidden" name="nicknameCk" id="nicknameCk" value="">
						<input type="hidden" name="ori_nickname" id="ori_nickname"
							value="${mypageDetail.u_nickname}"> <input type="text"
							class="form-control" id="floatingId" name="u_id"
							value="${mypageDetail.u_id}" style="width: 100%; height: 70px;"
							readonly>
					</div>
				</fieldset>

				<fieldset style="margin-bottom: 20px; padding: 15px;">
					<legend>이름</legend>
					<div class="form-floating mb-3">
						<input type="hidden" name="u_name" value="${mypageDetail.u_name}">
						<input type="text" class="form-control" id="floatingName"
							name="u_name" value="${mypageDetail.u_name}"
							style="width: 100%; height: 70px;" readonly>
					</div>
				</fieldset>

				<fieldset style="margin-bottom: 20px; padding: 15px;">
					<legend>닉네임</legend>
					<div class="form-floating mb-3" style="display: flex; gap: 10px;">
						<input type="text" class="form-control" id="floatingNickname"
							name="u_nickname" value="${mypageDetail.u_nickname}"
							style="flex: 4;" placeholder="닉네임">
						<button type="button" id="nicknameCh_btn" class="btn chkchk"
							onclick="checkNickname()"
							style="background-color: #FAE6BF; display: none;">중복확인</button>
					</div>
					<div id="nickError"
						style="color: red; font-size: 12px; margin-top: 5px;"></div>
				</fieldset>

				<fieldset style="margin-bottom: 20px; padding: 15px;">
					<legend>이메일</legend>
					<div class="form-floating mb-3">
						<input type="text" class="form-control" id="floatingEmail"
							name="u_email" value="${mypageDetail.u_email}"
							style="width: 100%; height: 70px;" placeholder="이메일">
						<div id="emailError"
							style="color: red; font-size: 12px; margin-top: 5px;"></div>
					</div>
				</fieldset>

				<fieldset style="margin-bottom: 20px; padding: 15px;">
					<legend>휴대전화</legend>
					<div class="form-floating mb-3">
						<input type="text" class="form-control" id="floatingPhone"
							name="u_pno" value="${mypageDetail.u_pno}"
							style="width: 100%; height: 70px;" placeholder="휴대전화번호">
						<div id="phError"
							style="color: red; font-size: 12px; margin-top: 5px;"></div>
					</div>
				</fieldset>

				<fieldset style="margin-bottom: 20px; padding: 15px;">
					<legend>주소</legend>
					<div class="form-floating mb-3"
						style="display: flex; gap: 10px; width: 100%;">
						<input type="hidden" id="u_address" name="u_address"> <input
							type="text" class="form-control" id="sample4_postcode"
							placeholder="우편번호" style="flex: 4; height: 70px;" readonly>
						<input type="button" class="btn"
							onclick="sample4_execDaumPostcode()" value="우편번호 찾기"
							style="flex: 1; height: 70px; background-color: #FAE6BF;">
					</div>
					<div class="form-floating mb-3">
						<input type="text" class="form-control" id="sample4_roadAddress"
							name="roadAddress" placeholder="도로명주소"
							style="width: 100%; height: 70px;" readonly>
					</div>
					<div class="form-floating mb-3">
						<input type="text" class="form-control" id="sample4_detailAddress"
							name="detailAddress" placeholder="상세주소"
							style="width: 100%; height: 70px;">
					</div>
					<div id="addrError"
						style="color: red; font-size: 12px; margin-top: 5px;"></div>
				</fieldset>

				<div class="text-end">
					<button type="submit" class="btn"
						style="width: 100%; height: 70px; background-color: #FFD26E;">수 정</button>
					<button type="button" class="btn del-btn" onclick="confirmTaltae()" 
						style="width: 100%; height: 40px; margin: 13px 0px; border: none; background-color: #F6F6F6;">회원탈퇴</button>
				</div>
			</form>

			<script>
				<c:if test="${not empty sessionScope.alertMessage}">
				alert("${sessionScope.alertMessage}");
				<c:remove var="alertMessage" scope="session" />
				</c:if>

				const uAddress = "${mypageDetail != null && mypageDetail.u_address != null ? mypageDetail.u_address : ''}";
				const uId = "${mypageDetail.u_id}";

				document
						.getElementById('floatingNickname')
						.addEventListener(
								'change',
								function(event) {
									document.getElementById("nicknameCk").value = 'N';
									//버튼 display = block
									document.getElementById("nicknameCh_btn").style.display = "block";
								});
			</script>

		</div>
	</div>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>
<script
	src="${pageContext.request.contextPath}/resources/js/mypage_info.js"></script>
<%--   <script src="${pageContext.request.contextPath}/resources/js/mypage.js"></script> --%>
</html>

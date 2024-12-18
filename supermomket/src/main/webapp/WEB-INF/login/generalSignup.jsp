<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>일반 회원가입</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <link rel="stylesheet" href="resources/css/generalSignup.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
    <div class="signup-container">
        <div class="logo-box"><a href="/"><img src="/resources/img/logo/logo1.png" alt="로고"></a></div>
        <h2>회원가입</h2>
        <form action="generalSignup.do" method="POST" id="signupForm" onsubmit="return validateForm()">
            <div class="form-field">
                <div class="btn">
	                <label>아이디</label>
	                <input type="text" id="id" name="u_id" placeholder="6~20자 영문, 숫자"/>
	                <button type="button" class="check-btn">중복확인</button>
            	</div>
            	<div id="id-error" class="error-message"></div>
            	
           		<div class="btn3">
	                <label>비밀번호</label>
	                <input type="password" id="password" name="u_pw" placeholder="8~20자 영문, 숫자, 특수문자" />
	                <button type="button" id="eye" class="eye-btn">
	                	<img src="resources/img/login/ceye.png" class="eye-image">
	                </button>
	            </div>
	            <div id="password-error" class="error-message"></div>
	                        	
           		<div class="btn3">
	                <label>비밀번호 확인</label>
	                <input type="password" id="password2" name="check_pw" placeholder="8~20자 영문, 숫자, 특수문자" />
	                <button type="button" id="eye2" class="eye-btn">
	                	<img src="resources/img/login/ceye.png" class="eye-image">
	                </button>
            	</div>
            	<div id="check-password-error" class="error-message"></div>
	                        	
           		<div class="btn">
	                <label>이름</label>
	                <input type="text" name="u_name" id="name" placeholder="2~7자 한글, 2~21자 영문"/>
	            </div>
	            <div id="name-error" class="error-message"></div>
	                        	
           		<div class="btn">
	                <label>닉네임</label>
	                <input type="text" name="u_nickname" id="nickname" placeholder="2~8자 한글, 2~24자 영문" />
	                <button type="button" class="check-btn2">중복확인</button>
	            </div>
	            <div id="nickname-error" class="error-message"></div>
  	                        	
           		<div class="btn">
	                <label>이메일</label>
	                <input type="text" name="u_email" id="email"   />
	            </div>
	            <div id="email-error" class="error-message"></div>
            
	            <div class="btn">
	                <label>번호</label>
	                <div class="btn2"><input id="u_pno" type="text" name="u_pno" title="전화번호 입력" placeholder="전화번호 입력" />
					<span id="phoneChk" class="doubleChk">인증번호 받기</span></div>
					<div class="btn2"><input id="phone2" type="text" name="phone2" title="인증번호 입력" placeholder="인증번호" disabled  /> 
					<span id="phoneChk2" class="doubleChk">인증번호 확인</span></div>
					<input type="hidden" id="phoneDoubleChk"/>
	            </div>
	            <div class="tbtn">
		           	<div id="phone-error" class="error-message"></div>
					<span id="timer" class="timer" style="display: none;">04:00</span>
				</div>
   
   				<div class="btn">
	                <label>주소</label>
	                <div class="btn2"><input type="text" name="u_address" id="sample4_postcode" placeholder="우편번호" readonly>
					<input type="button" class="api-btn" onclick="sample4_execDaumPostcode()" value="주소 찾기"></div>
					<input type="text" name="u_address_r" id="sample4_roadAddress" placeholder="도로명주소" readonly>
					<input type="text" id="sample4_jibunAddress" placeholder="지번주소" readonly>
					<span id="guide" style="color:#999;display:none"></span>
					<input type="text" name="u_address_d" id="sample4_detailAddress" placeholder="상세주소">
					<input type="text" id="sample4_extraAddress" placeholder="참고항목">
            	</div>
            </div>
		    <div id="form-error" class="error-message"></div>
            <button type="submit" class="signup-button">회원가입</button>
        </form>
    </div>
    <script src="resources/js/generalSignup.js"></script>
</body>
</html>

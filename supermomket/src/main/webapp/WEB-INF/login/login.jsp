<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="resources/css/login.css">
</head>
<body>
	<div class="login-container">
		<div class="logo-box"><a href="/"><img src="/resources/img/logo/logo1.png" alt="로고"></a></div>
		<form action="/login.do" method="POST" id="loginForm" >
			<div class="form-field">
				<img src="resources/img/login/id.png" id="idimg" class="login-image">
				<input type="text" name="u_id" id="uid" placeholder="아이디입력" autocomplete="off"/> 
			</div>
			<div class="form-field">
				<img src="resources/img/login/pw.png" id="pwimg" class="login-image">	
				<input type="password" name="u_pw" id="upw" placeholder="비밀번호입력" autocomplete="off"/> 
				<button type="button" id="eye" class="eye-btn">
                	<img src="resources/img/login/ceye.png" class="eye-image">
                </button>
			</div>
	        <c:if test="${not empty loginError}">
	            <div class="error-message">${loginError}</div> 
	            <% session.removeAttribute("loginError"); %> 
	        </c:if>
	        <div class="error-message"></div>
			<button type="submit" class="login-button">로그인</button>
		</form>
		<div class="klogin">
			<a class="p-2" href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=c51dc8cbf39989606e8b1ae468eaee37&redirect_uri=http://supermomket.kro.kr/login/kakaoLogin">
				<img src="resources/img/login/klogin.png" class="kakao-login">
			</a>
		</div>
		<div class="helper-links">
			<a href="findId.do">아이디 찾기</a> | <a href="findPw.do">비밀번호 찾기</a> | <a href="generalSignup.do">회원가입</a>
		</div>
	</div>
	<script src="resources/js/login.js"></script>
</body>
</html>
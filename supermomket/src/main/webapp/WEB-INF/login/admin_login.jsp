<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="resources/css/admin_login.css">
</head>
<body>
	<div class="login-container">
		<div class="logo-box"><a href="/"><img src="/resources/img/logo/admin_logo.png" alt="로고"></a></div>
		<form action="admin_login.do" method="POST" id="loginForm" >
			<div class="form-field">
				<img src="resources/img/login/aid.png" id="idimg" class="login-image">
				<input type="text" name="u_id" id="uid" placeholder="아이디입력" autocomplete="off"/> 
			</div>
			<div class="form-field">
				<img src="resources/img/login/apw.png" id="pwimg" class="login-image">	
				<input type="password" name="u_pw" id="upw" placeholder="비밀번호입력" autocomplete="off"/> 
				<button type="button" id="eye" class="eye-btn">
                	<img src="resources/img/login/aceye.png" class="eye-image">
                </button>
			</div>
	        <c:if test="${not empty loginError}">
	            <div class="error-message">${loginError}</div> 
	            <% session.removeAttribute("loginError"); %> 
	        </c:if>
	        <div class="error-message"></div>
			<button type="submit" class="login-button">로그인</button>
		</form>
	</div>
	<script src="resources/js/admin_login.js"></script>
</body>
</html>
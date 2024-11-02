<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="resources/css/login.css">
</head>
<body>
	<div class="login-container">
		<a href="index.jsp"><h2>로고이미지</h2></a>
		<form action="login.do" method="POST" id="loginForm" >
			<div class="form-field">
				<img src="resources/img/login/id.png" id="idimg" class="login-image">
				<input type="text" name="u_id" id="uid" placeholder="아이디입력" required /> 
			</div>
			<div class="form-field">
				<img src="resources/img/login/pw.png" id="pwimg" class="login-image">	
				<input type="password" name="u_pw" id="upw" placeholder="비밀번호입력" required /> 
				<button type="button" id="eye" class="eye-btn">
                	<img src="resources/img/login/ceye.png" class="eye-image">
                </button>
			</div>
			<label>
				<input type="checkbox" name="SaveID" /> 아이디저장
			</label> 
			<input type="submit" value="로그인" />
		</form>
		<div class="helper-links">
			<a href="#">아이디 찾기</a> | <a href="#">비밀번호 찾기</a> | <a href="choiceSignup.jsp">회원가입</a>
		</div>
		<div class="klogin">
			<a href="#"><img src="resources/img/login/klogin.png" class="kakao-login"></a>
		</div>

        <c:if test="${not empty loginError}">
            <div class="error-message">${loginError}</div> 
            <% session.removeAttribute("loginError"); %> 
        </c:if>
	</div>
	<script src="resources/js/login.js"></script>
</body>
</html>
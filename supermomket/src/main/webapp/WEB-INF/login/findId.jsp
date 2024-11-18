<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="resources/css/findId.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
    <div class="find-container">
    	<div class="logo-box"><a href="/"><img src="/resources/img/logo/logo1.png" alt="로고"></a></div>
        <h2>아이디 찾기</h2>
        <form action="/findId.do" method="POST" id="idFindForm">
            <div class="form-field">
            	<img src="resources/img/login/name.png" id="nameimg" class="find-image">
				<input type="text" name="u_name" id="u_name" placeholder="이름입력" autocomplete="off"/> 
            </div>
            <div class="form-field">
            	<img src="resources/img/login/phone.png" id="phoneimg" class="find-image">
                <div class="btn"><input id="u_pno" type="text" name="u_pno" title="전화번호 입력" placeholder="전화번호 입력" />
				<span id="phoneChk" class="doubleChk">인증번호 받기</span></div>
				<div class="btn"><input id="phone2" type="text" name="phone2" title="인증번호 입력" placeholder="인증번호" disabled  /> 
				<span id="phoneChk2" class="doubleChk">인증번호 확인</span></div>
				<span class="point successPhoneChk">휴대폰 번호 입력후 인증번호 보내기를 눌러주세요.</span>
				<input type="hidden" id="phoneDoubleChk"/>
            </div>
            <div id="form-error" class="error-message"></div>
            <button type="submit" class="find-button">아이디찾기</button>
        </form>
    </div>  
   	<script src="resources/js/findId.js"></script>
</body>
</html>

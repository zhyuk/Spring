<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기 결과</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="resources/css/findPwResult.css">
</head>
<body>
    <div class="find-container">
        <div class="logo-box"><a href="/"><img src="/resources/img/logo/logo1.png" alt="로고"></a></div>    
        <h2>비밀번호 찾기 결과</h2>
        
        <!-- 임시 비밀번호가 발급되었을 때 -->
        <c:if test="${not empty tempPassword}">
            <div class="form-field">
                <p>새로운 임시 비밀번호는 <strong>${tempPassword}</strong> 입니다.</p>
                <p>임시 비밀번호로 로그인 후 비밀번호를 변경해주세요.</p>
            </div>
        </c:if>

        <!-- 일치하는 정보가 없으면 -->
        <c:if test="${empty tempPassword}">
            <div class="form-field">
                <p>일치하는 정보가 없습니다. 다시 시도해주세요.</p>
            </div>
        </c:if>

        <br>
        <a href="/login.do"><button type="submit" class="login-button">로그인화면으로</button></a>
    </div>  
</body>
</html>

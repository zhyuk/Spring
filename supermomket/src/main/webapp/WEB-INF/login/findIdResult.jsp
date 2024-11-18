<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>아이디 찾기 결과</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="resources/css/findIdResult.css">
</head>
<body>
    <div class="find-container">
        <div class="logo-box"><a href="/"><img src="/resources/img/logo/logo1.png" alt="로고"></a></div>    
        <h2>아이디 찾기 결과</h2>
        <c:if test="${not empty userList}">
            <div class="result-box">
                <table class="result-table">
                    <thead>
                        <tr>
                            <th>아이디</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="user" items="${userList}">
                            <tr>
                                <td>${user.u_id}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:if>
        
        <!-- 사용자 정보가 없으면 안내 메시지 -->
        <c:if test="${empty userList}">
            <div class="no-result">
                <p>일치하는 정보가 없습니다. 다시 확인해 주세요.</p>
            </div>
        </c:if>
        <a href="/login.do"><button type="submit" class="login-button">로그인화면으로</button></a>
    </div>
</body>
</html>

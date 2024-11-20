<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
                    <tbody>
                        <c:forEach var="user" items="${userList}">
                            <tr>
                                <td>${fn:substring(user.u_id, 0, 3)}${fn:substring('*****************', 0, fn:length(user.u_id) - 3)}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:if>

        <c:if test="${empty userList}">
            <div class="no-result">
                <p>일치하는 정보가 없습니다. 다시 확인해 주세요.</p>
            </div>
        </c:if>
        <a href="/login.do"><button type="submit" class="login-button">로그인화면으로</button></a>
    </div>
</body>
</html>

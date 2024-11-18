<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../admin/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    int totalItems = (int) request.getAttribute("totalItems"); 
    int totalPages = (int) Math.ceil((double) totalItems / 10);
    request.setAttribute("totalPages", totalPages);
%>
<style>

.main-container {
    margin-left: 260px;
    padding: 20px;
    overflow-y: auto;
    background-color: #ffffff;
}


.mp_userList_tb {
    width: 80% !important;
    margin-left: 280px;
    border-collapse: collapse;
    vertical-align: middle;
}

.mp_userList_tb th,
.mp_userList_tb td {
    border: 1px solid #ddd;
    padding: 10px;
    text-align: center;
    vertical-align: middle !important;
}

.mp_userList_tb th {
    background-color: #f1f1f1;
}

.mp_search-form-container {
    margin: 20px 30px 0px 20px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    flex-direction: row-reverse;
}


.title_h4 {
    margin-top: 50px;
    margin-left: 270px;
   	font-weight: 700;
   	font-size: 24px;
}

.title_hr {
    width: 80.5%;
    border: 0;
    height: 1px;
    background-color: lightgray;
    margin-left: 270px;
}

form {
    display: flex;
    gap: 10px;
    align-items: center;
}

input.form-control {
    width: 200px;
    border: 1px solid #ccc;
    border-radius: 0px;
}

button.btn {
    height: 35px;
}

/* 페이징 스타일 */
.mp_pagination-container {
    display: flex;
    justify-content: center;
    margin-top: 20px;
}

.pagination .page-item .page-link {
    background-color: #6c757d;
    color: white;
    border: none;
    margin: 0 5px;
}

.pagination .page-item.active .page-link {
    background-color: #343a40;
    color: white;
}

/* 테이블 알림 정보 */
.mp_table-info {
    text-align: right;
    color: red;
    margin-top: 20px;
    margin-bottom: 5px;
    margin-right: 30px;
    
    
td form {
    display: flex; /* 버튼을 가로로 정렬 */
    justify-content: center; /* 버튼 중앙 정렬 */
    gap: 10px; /* 버튼 간 간격 */
    flex-wrap: nowrap; /* 버튼이 줄바꿈되지 않도록 설정 */
}

td form button {
    width: auto; /* 버튼의 너비를 내용에 맞게 조정 */
    padding: 5px 10px; /* 버튼 내용물 여백 조정 */
    font-size: 14px; /* 글자 크기 */
    border: 1px solid #ccc;
    background-color: #6c757d; /* 버튼 배경색 */
    color: white; /* 글자 색상 */
    cursor: pointer;
    text-align: center;
}

td form button:hover {
    background-color: #5a6268;
}

</style>

<body>
	<%@ include file="../admin/menu.jsp"%>
    <div class="mp_content-container">
		<h5 class="title_h4">사용자 관리</h5>
		<hr class="title_hr">
			
        <div class="mp_search-form-container">
            <form class="mp_update-form" action="userList.do" method="get" class="mb-4">
                <select name="searchType" class="mp_form-select" style="height: 40px; border: 1px solid #ccc;">
                    <option value="u_name" ${searchType == 'u_name' ? 'selected' : ''}>이름</option>
                    <option value="u_id" ${searchType == 'u_id' ? 'selected' : ''}>아이디</option>
                    <option value="u_pno" ${searchType == 'u_pno' ? 'selected' : ''}>전화번호</option>
                </select>
                <input type="text" name="searchKeyword" value="${searchKeyword}" placeholder="검색어 입력" class="form-control" style="height: 40px;">
                <button type="submit" class="btn" style="height: 40px; border: 1px solid #ccc; border-radius: 0px;">검색</button>
            </form>
        </div>
        <div class="mp_table-info">※ 아이디, 가입날짜는 변경이 불가합니다.</div>
        <table id="mp_userTable" class="mp_userList_tb table table-hover">
            <thead>
                <tr>
                    <th>No.</th>
                    <th>아이디</th>
                    <th>이름</th>
                    <th>닉네임</th>
                    <th>주소</th>
                    <th>휴대전화</th>
                    <th>가입<br>날짜</th>
                    <th>이메일</th>
                    <th>관리</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="user" items="${userList}" varStatus="status">
                    <tr data-user-id="${user.u_id}">
                        <td>${totalItems - (currentPage - 1) * 10 - status.index}</td>
                        <td>${user.u_id}</td>
                        <td class="editable-td" data-name="u_name" data-editable="true" onclick="goEditTable(this)">${user.u_name}</td>
                        <td class="editable-td" data-name="u_nickname" data-editable="true" onclick="goEditTable(this)">${user.u_nickname}</td>
                        <td class="editable-td" data-name="u_address" data-editable="true" onclick="goEditTable(this)">${user.u_address}</td>
                        <td class="editable-td" data-name="u_pno" data-editable="true" onclick="goEditTable(this)">${user.u_pno}</td>
                        <td>${user.u_date}</td>
                        <td class="editable-td" data-name="u_email" data-editable="true" onclick="goEditTable(this)">${user.u_email}</td>
                        <td>
                            <form id="form-${user.u_id}" action="selUser.do" method="post">
                                <input type="hidden" name="userId" value="${user.u_id}">
                                <input type="hidden" name="u_name" value="${user.u_name}">
                                <input type="hidden" name="u_nickname" value="${user.u_nickname}">
                                <input type="hidden" name="u_pno" value="${user.u_pno}">
                                <input type="hidden" name="u_date" value="${user.u_date}">
                                <input type="hidden" name="u_email" value="${user.u_email}">
                                <input type="hidden" name="u_address" value="${user.u_address}">
                                <button type="button" class="btn" onclick="selUser('${user.u_id}')">수정</button>
                                <button type="button" class="btn btn-right" onclick="delUser('${user.u_id}')">삭제</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <!-- 페이징 처리 -->
        <div class="mp_pagination-container" style="margin-left: 280px;">
        	<ul class="pagination" >
	            <c:forEach var="i" begin="1" end="${totalPages}">
	                <li class="page-item ${i == currentPage ? 'active' : ''}">
	                    <a class="page-link" href="userList.do?page=${i}&searchType=${searchType}&searchKeyword=${searchKeyword}" style="background-color: gray; border: 0px;">${i}</a>
	                </li>
	            </c:forEach>
            </ul>
        </div>
    </div>
      <script src="${pageContext.request.contextPath}/resources/js/mypage.js"></script>
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
</body>

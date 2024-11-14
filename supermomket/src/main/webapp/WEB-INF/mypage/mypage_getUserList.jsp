<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../view/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    int totalItems = (int) request.getAttribute("totalItems"); 
    int totalPages = (int) Math.ceil((double) totalItems / 10);
    request.setAttribute("totalPages", totalPages);
%>
<style>
 .mp_userList_tb {
     width: 80%;
     margin: 0 auto;
 }
 
 .mp_container {
     display: flex;
     margin-top: 40px;
 }
 
 .mp_content-container {
     margin-top: 100px;
     display: flex;
     flex-direction: column;
     gap: 10px;
     justify-content: center;
     align-items: flex-start;
     padding: 20px;
 }
 
 .mp_userList_tb {
     flex: 1;
 }
 
 .mp_table-info{
 	color: red;
 	margin-right: 0px;
 }

.mp_search-form-container {
    width: 100%; 
    display: flex;
    justify-content: flex-end;
}

form {
    display: flex;
    gap: 10px;
    align-items: center;
}

.mp_userList_tb {
    width: 80%;
    margin: 0 auto;
}

.btn {
    height: 35px;
}

.mp_table-info {
    align-self: flex-end;
    width: 100%;
    text-align: right;
    color: red;
}

/* .mp_pagination-container { */
/*     display: flex; */
/*     justify-content: center; */
/*     margin-top: 20px; */
/*     list-style: none; */
/*     padding: 0; */
/* } */
</style>

<body>
    <%@ include file="../view/menu.jsp"%>
    <div class="mp_content-container">
        <div class="mp_search-form-container">
            <form action="userList.do" method="get" class="mb-4">
                <select name="searchType" class="form-select" style="height: 35px; width: 150px;">
                    <option value="u_name" ${searchType == 'u_name' ? 'selected' : ''}>이름</option>
                    <option value="u_id" ${searchType == 'u_id' ? 'selected' : ''}>아이디</option>
                    <option value="u_pno" ${searchType == 'u_pno' ? 'selected' : ''}>전화번호</option>
                </select>
                <input type="text" name="searchKeyword" value="${searchKeyword}" placeholder="검색어 입력" class="form-control" style="width: 200px; ">
                <button type="submit" class="btn btn-outline-secondary">검색</button>
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
                    <th>가입날짜</th>
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
                                <button type="button" class="btn btn-secondary" onclick="selUser('${user.u_id}')">수정</button>
                                <button type="button" class="btn btn-right" onclick="delUser('${user.u_id}')">삭제</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <!-- 페이징 처리 -->
        <div class="mp_pagination-container" style="margin: 0 auto;">
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
	  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
	  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</body>

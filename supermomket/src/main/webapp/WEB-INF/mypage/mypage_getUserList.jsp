<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../admin/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    int totalItems = (int) request.getAttribute("totalItems"); 
    int totalPages = (int) Math.ceil((double) totalItems / 10);
    request.setAttribute("totalPages", totalPages);
%>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<style>
* {
	font-size: 18px !important;
}

button {
	background-color: black !important;
	height: 40px !important;
	color: white !important;
	border: none !important;
	border-radius: 5px !important;
	font-size: 16px !important;
	cursor: pointer;
	font-weight: normal !important;
}

button:hover {
	background-color: #c0c0c0 !important; /* 버튼에 마우스를 올렸을 때 배경색 변경 */
}

h1 {
	font-size: 23px !important;
}

.main-container {
	padding: 20px;
	overflow-y: auto;
	background-color: #ffffff;
}

.mp_content-container {
	width: 85%;
	margin: 0 auto;
}

.mp_userList_tb {
	width: 80% !important;
	margin-left: 280px;
	border-collapse: collapse;
	vertical-align: middle;
}

.mp_userList_tb th, .mp_userList_tb td {
	border: 1px solid #ddd;
	padding: 10px;
	text-align: center;
	vertical-align: middle !important;
}

.mp_userList_tb th {
	background-color: #f1f1f1;
}

.mp_search-form-container {
	margin: 20px 45px 10px 20px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	flex-direction: row-reverse;
}

.mp_search-form-container .mp_form-select {
	padding: 8px 12px;
	font-size: 14px;
	border: 1px solid #000;
	border-radius: 5px;
	background-color: #fff;
	color: #333;
	cursor: pointer;
	height: 40px;
}

.mp_search-form-container #searchKeyword {
	padding: 8px 12px !important;
	border: 1px solid #000 !important;
	border-radius: 5px !important;
	width: 200px !important; /* 입력창 고정 너비 */
	height: 40px !important;
	background-color: #fff !important;
	color: #333 !important;
}

.mp_search-form-container #searchKeyword:focus {
	box-shadow: black !important;
}

.title_h4 {
	margin-top: 30px;
	margin-left: 270px;
	font-weight: 700;
	font-size: 24px;
}

.title_hr {
	width: 80.5%;
	border: 0;
	height: 2px;
	background-color: #eee;
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

/* 테이블 알림 정보 */
.mp_table-info {
	text-align: right;
	color: red;
	margin-top: 20px;
	margin-bottom: 5px;
	margin-right: 30px;
}

th {
	line-height: 28px !important;
}

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

.form-control:focus {
	box-shadow: none !important;
	border: 2px solid black !important;
}

input.form-control {
	border: 1px solid #000 !important;
	border-radius: 5px;
}

th:nth-child(1), td:nth-child(1) {
	width: 3%;
}

th:nth-child(2), td:nth-child(2) {
	width: 10%;
}

th:nth-child(3), td:nth-child(3) {
	width: 4%;
}

th:nth-child(4), td:nth-child(4) {
	width: 4%;
}

th:nth-child(5), td:nth-child(5) {
	width: 30%;
}

th:nth-child(6), td:nth-child(6) {
	width: 15%;
}

th:nth-child(7), td:nth-child(7) {
	width: 10%;
}

th:nth-child(8), td:nth-child(8) {
	width: 12%;
}

th:nth-child(9), td:nth-child(9) {
	width: 12%;
}

/* 테이블 셀에 말줄임표 추가 */
.mp_userList_tb td {
	white-space: nowrap; /* 텍스트 줄바꿈 방지 */
	overflow: hidden; /* 넘치는 텍스트 숨김 */
	text-overflow: ellipsis; /* 말줄임표 추가 */
	max-width: 150px; /* 필요한 너비로 설정 */
}

/* 페이지네이션 리스트 스타일 */
.pagination {
	display: flex;
	justify-content: center;
	align-items: center;
	margin-top: 20px;
}

.pagination .page-item {
	margin: 0 5px; /* 페이지 아이템 간격 */
	list-style-type: none;
}

.pagination .page-item a {
	margin: 0 5px;
	padding: 8px 16px;
	color: #333;
	text-decoration: none;
	border-radius: 4px;
}

.pagination .page-item a:hover {
	font-weight: bold;
	background-color: #ddd;
}

/* 활성화된 페이지 스타일 */
.pagination .page-item.active a {
	background-color: #ffffff;
	color: #000000;
	border: 1px solid #ffffff;
	font-weight: bold;
	text-decoration: underline;
}

.page-link {
	border: none;
}

.page-link:focus {
	box-shadow: none !important;
}

a {
    color: #bbb !important;
}
</style>

<body>
	<%@ include file="../admin/menu.jsp"%>
	<div class="mp_content-container">
		<h1 class="title_h4">사용자 관리</h1>
		<hr class="title_hr">

		<div class="mp_search-form-container">
			<form class="mp_update-form" action="userList.do" method="get"
				class="mb-4">
				<select name="searchType" class="mp_form-select">
					<option value="u_name" ${searchType == 'u_name' ? 'selected' : ''}>이름</option>
					<option value="u_id" ${searchType == 'u_id' ? 'selected' : ''}>아이디</option>
					<option value="u_pno" ${searchType == 'u_pno' ? 'selected' : ''}>전화번호</option>
				</select> <input type="text" name="searchKeyword" value="${searchKeyword}"
					placeholder="검색어를 입력하세요" class="form-control">
				<button type="submit" class="btn">검색</button>
			</form>
		</div>
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
						<td class="editable-td" data-name="u_name" data-editable="true"
							onclick="goEditTable(this)">${user.u_name}</td>
						<td class="editable-td" data-name="u_nickname"
							data-editable="true" onclick="goEditTable(this)">${user.u_nickname}</td>
						<td class="editable-td" data-name="u_address" data-editable="true"
							onclick="goEditTable(this)">${user.u_address}</td>
						<td class="editable-td" data-name="u_pno" data-editable="true"
							onclick="goEditTable(this)">${user.u_pno}</td>
						<td>${user.u_date}</td>
						<td class="editable-td" data-name="u_email" data-editable="true"
							onclick="goEditTable(this)">${user.u_email}</td>
						<td>
							<form id="form-${user.u_id}" action="selUser.do" method="post">
								<input type="hidden" name="userId" value="${user.u_id}">
								<input type="hidden" name="u_name" value="${user.u_name}">
								<input type="hidden" name="u_nickname"
									value="${user.u_nickname}"> <input type="hidden"
									name="u_pno" value="${user.u_pno}"> <input
									type="hidden" name="u_date" value="${user.u_date}"> <input
									type="hidden" name="u_email" value="${user.u_email}"> <input
									type="hidden" name="u_address" value="${user.u_address}">
								<button type="button" class="btn"
									onclick="selUser('${user.u_id}')">수정</button>
								<button type="button" class="btn btn-right"
									onclick="delUser('${user.u_id}')">삭제</button>
							</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<!-- 페이징 처리 -->
		<div class="mp_pagination-container" style="margin-left: 280px;">
			<ul class="pagination">
				<c:forEach var="i" begin="1" end="${totalPages}">
					<li class="page-item ${i == currentPage ? 'active' : ''}"><a
						class="page-link"
						href="userList.do?page=${i}&searchType=${searchType}&searchKeyword=${searchKeyword}">${i}</a>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/resources/js/mypage.js"></script>
</body>

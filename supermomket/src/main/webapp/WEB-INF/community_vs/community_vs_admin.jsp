<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../admin/header.jsp"%>

<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/community_vs.css">
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

#admin {
	width: 1300px;
	margin: 0 auto;
	padding: 20px 10px;
	position: relative;
}

.admin-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 30px;
	padding-bottom: 20px;
	border-bottom: 2px solid #eee;
}

h1 {
	font-size: 32px;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
	table-layout: fixed;
	clear: both; /* 검색 폼과 테이블이 겹치지 않도록 설정 */
}

section#admin .button_list {
	float: right;
	margin-bottom: 10px;
}

section#admin .button_list button {
	height: 30px;
	background: var(- -color-blk);
	color: var(- -color-white);
	width: 55px;
}

section#admin .button_list button:hover {
	background: var(- -ad-color-semigray);
}

section#admin div.inner h3 {
	display: inline-block;
	float: left;
	font-size: 30px;
	/* border: solid 1px red; */
}

section#admin div.inner table {
	width: 100%;
	text-align: center;
	border-collapse: collapse;
}

section#admin div.inner table tr, section#admin div.inner table tr th,
	section#admin div.inner table tr td, section#admin1 div.inner table tr,
	section#admin1 div.inner table tr th, section#admin1 div.inner table tr td
	{
	border: solid 1px #e3e3e3;
}

section#admin table#admin_list_table thead tr {
	padding: 12px;
	border: 1px solid #ddd;
	text-align: center;
	overflow: hidden;
	white-space: nowrap;
}

section#admin table#admin_list_table tbody tr.basic_info {
	height: 50px;
}

section#admin table#admin_list_table tbody tr.img_info, section#admin table#admin_list_table tbody tr.content_info
	{
	display: none;
}

section#admin div.inner table#admin_list_table tbody tr td input[type=text],
	section#admin div.inner table#admin_list_table tbody tr td textarea {
	font-size: 16px;
}

section#admin div.inner table#admin_list_table tbody tr td input[type=text]
	{
	width: 100%;
	height: 62px;
	border: none;
	text-align: center;
}

section#admin div.inner table#admin_list_table tbody tr td button {
	margin: 0 5px;
	background: var(- -color-blk);
	color: var(- -color-white);
	width: 50px;
}

section#admin div.inner table#admin_list_table tbody tr td button:hover
	{
	background: var(- -ad-color-semigray);
}

section#admin div.inner table#admin_list_table tbody tr td textarea {
	width: 100%;
	height: 100px;
	padding: 5px;
	border: none;
	vertical-align: middle;
}

section#admin div.inner table#admin_list_table tbody tr td img {
	width: 100%;
	vertical-align: middle;
}

section#admin div.inner table#admin_list_table tbody tr input:read-only
	{
	outline: none;
}

th {
	background-color: #f4f4f4;
	height: 48px !important;
}

td {
	line-height: 37px;
}

/* 각 열의 너비를 고정 */
th:nth-child(1), td:nth-child(1) {
	width: 5%;
}

th:nth-child(2), td:nth-child(2) {
	width: 5%;
}

th:nth-child(3), td:nth-child(3) {
	width: 67.5%;
}

th:nth-child(4), td:nth-child(4) {
	width: 10%;
}

th:nth-child(5), td:nth-child(5) {
	width: 10%;
}

th:nth-child(6), td:nth-child(6) {
	width: 12.5%;
}
</style>
</head>

<body>
	<%@ include file="../admin/menu.jsp"%>
	<main>
		<section id="admin">
			<div class="inner">
				<div class="admin-header">
					<h1>고민거리 관리</h1>
				</div>
				<div class="button_list">
					<button id="update_button" class="pointer">수정</button>
					<button id="delete_button" class="pointer">삭제</button>
					<div class="clear"></div>
				</div>


				<table id="admin_list_table">
					<thead>
						<tr>
							<th><input type="checkbox" id="all_check" class="pointer"
								name="all_check"></th>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일자</th>
							<th>관리</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach items="${boardList}" var="board">
							<tr class="basic_info">
								<td><input type="checkbox" class="check pointer"
									name="vs_check"></td>
								<td><input type="text" name="vs_no" value="${board.vs_no}"
									readonly></td>
								<td><input type="text" name="vs_title"
									value="${board.vs_title}"></td>
								<td><input type="text" name="vs_writer"
									value="${board.vs_writer}" readonly></td>
								<td><input type="text" name="vs_date"
									value="${board.vs_date}" readonly></td>
								<td>
									<button onclick="showCommentInfo(${board.vs_no})">댓글</button>
									<button onclick="showContentInfo(${board.vs_no})">상세</button>
								</td>
							</tr>

							<tr class="content_info${board.vs_no} content_info">
								<td colspan="2" rowspan="2">데이터 수정</td>
								<td colspan="4"><textarea id="content" class="inputData"
										name="vs_content">${board.vs_content}</textarea></td>
							</tr>

							<tr class="img_info${board.vs_no} img_info">
								<td colspan="2"><img
									src="${pageContext.request.contextPath}/resources/img/vs/${board.vs_img1}"
									alt="투표에 사용된 이미지 1"></td>
								<td colspan="2"><img
									src="${pageContext.request.contextPath}/resources/img/vs/${board.vs_img2}"
									alt="투표에 사용된 이미지 2"></td>
							</tr>

						</c:forEach>
					</tbody>
				</table>

				<div id="modal">
					<button id="modalClose" class="close" onclick="closeCommentInfo()">X</button>
					<div class="inner"></div>
				</div>
			</div>
		</section>
	</main>
	<button id="ScrollTop">TOP</button>


	<script
		src="${pageContext.request.contextPath}/resources/js/community_vs_admin.js"></script>
</body>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../header.jsp" %>


<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/community_vs.css">

</head>

<body>
	<%@ include file="../../menu.jsp" %>
	<main>
		<section id="index">
			<div class="inner">
				<button class="write-btn" onclick="writeBoard()">글쓰기</button>
				<table>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일자</th>
					</tr>
					<c:forEach items="${boardList}" var="board">
						<tr onclick="selBoard(${board.vs_no})" class="pointer">
							<td>${board.vs_no}</td>
							<td>${board.vs_title}</td>
							<td>${board.vs_writer}</td>
							<td>${board.vs_date}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</section>
	</main>
	</div>
	<!-- menu.jsp 내 <div id="wrap> 닫는 태그 -->
		<script src="${pageContext.request.contextPath}/resources/js/community_vs.js"></script>
</body>
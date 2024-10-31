<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../header.jsp"%>


<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/community_vs.css">

</head>

<body>
	<%@ include file="../../menu.jsp"%>
	<main>
		<section id="index">
			<div class="inner">
					<select name="searchSelect">
						<option value="title">글 제목</option>
						<option value="writer">작성자</option>
						<option value="content">글 내용</option>
					</select> 
					<input type="search" name="searchKeyword">
					<button type="submit" onclick="searchBoard()">검색</button>
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
							<td>${board.vs_rownumber}</td>
							<td>${board.vs_title}</td>
							<td>${board.vs_writer}</td>
							<td>${board.vs_date}</td>
						</tr>
					</c:forEach>
				</table>

				<ul class="pagination">
					<c:if
						test="${paging.nowPage > 1 && paging.lastBtn > paging.viewBtnCnt}">
						<li class="page-item"><a class="page-link"
							href="/vs_index.do?nowPage=${paging.nowPage-1}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}">이전</a></li>
					</c:if>
					<c:forEach var="i" begin="${paging.startBtn}"
						end="${paging.endBtn}" step="1">
						<c:choose>
							<c:when test="${paging.nowPage==i}">
								<li class="page-item active"><a class="page-link">${i}</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="/vs_index.do?nowPage=${i}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}">${i}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if
						test="${paging.nowPage < paging.lastBtn  && paging.lastBtn > paging.viewBtnCnt}">
						<li class="page-item"><a class="page-link"
							href="/vs_index.do?nowPage=${paging.nowPage+1}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}">이후</a></li>
					</c:if>
				</ul>
			</div>
		</section>
	</main>
	</div>
	<!-- menu.jsp 내 <div id="wrap> 닫는 태그 -->
	<script src="${pageContext.request.contextPath}/resources/js/community_vs.js"></script>
	<%@ include file="../../footer.jsp"%>
</body>
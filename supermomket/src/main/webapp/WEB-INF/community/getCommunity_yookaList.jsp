<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../view/header.jsp"%>
<style>
#searchNav {
	-webkit-justify-content: flex-end;
	justify-content: flex-end;
}

.navbar {
	padding: 10px 0px !important;
}

.pagination {
	justify-content: center;
}

table, td, tr {
	border-bottom: 1px solid #000;
	border-collapse: collapse;
	text-align: center;
}

.table td, .table th {
	padding: 12px;
}

table {
	width: 90%;
}

.h2 {
	text-align: center;
}

.no {
	width: 70px;
}
</style>

<body>
	<%@ include file="../view/menu.jsp"%>


	<div class="h2">
		<h2 style="margin-top: 100px;">육아정보</h2>
	</div>
	<div class="container">
		
		<nav id="searchNav" class="navbar navbar-expand-sm navbar-dark">
			<form class="form-inline" action="getCommunity_yookaList.do"
				method="post">

				<select class="form-control" id="sel1" name="searchCondition"
					style="display: inline-block !important; margin-right: 10px;">
					<c:forEach items="${conditionMap}" var="condition">
						<option value="${condition.value}">${condition.key}</option>
					</c:forEach>
				</select>
				<div class="input-group mb-3">

					<input class="form-control mr-sm-2" type="text"
						name="searchKeyword" placeholder="검색어를 입력하세요.">
					<div class="input-group-append">
						<button class="" type="submit" style="margin-right: 5px;">검색</button>
					</div>
					<div class="input-group-append">
						<button type="button" id="conWrite" class="">글쓰기</button>
					</div>
				</div>


			</form>
		</nav>

		<table class="table table-hover">
			<thead class="btn-primary">
				<tr style="background-color: #ddaf9c;">
					<th>번호</th>
					<th style="width: 550px;">제목</th>
					<th>작성자</th>
					<th>등록일</th>
					<th>조회수</th>
					<th>추천</th>
					<th>비추천</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${yookaList}" var="yookaList">
					<tr	onclick="yookaList(${yookaList.cm_no}, '${searchCondition}', '${searchKeyword}', ${paging.nowPage})" style="cursor: pointer;">
						<td class="tdCenter">${yookaList.cm_no}</td>
						<td class="title" style="text-align: left;">[육아]${yookaList.cm_title}
							<span>[${replyCntYooka}]</span>
						</td>
						<td class="tdCenter">${yookaList.cm_writer}</td>
						<td class="tdCenter">${yookaList.cm_date}</td>
						<td class="tdCenter">${yookaList.cm_view}</td>
						<td class="tdCenter">${likeResult1}</td>
						<td class="tdCenter">${hateResult1}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<ul class="pagination">
			<c:if
				test="${paging.nowPage > 1 && paging.lastBtn > paging.viewBtnCnt}">
				<li class="page-item"><a class="page-link"
					href="getCommunity_yookaList.do?nowPage=${paging.nowPage-1}">&lt;&lt;</a></li>
			</c:if>
			<c:forEach var="i" begin="${paging.startBtn}" end="${paging.endBtn}"
				step="1">
				<c:choose>
					<c:when test="${paging.nowPage==i}">
						<li class=""><a class="page-link">${i}</a></li>
					</c:when>
					<c:otherwise>
						<li class=""><a class="page-link"
							href="getCommunity_yookaList.do?nowPage=${i}">${i}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if
				test="${paging.nowPage < paging.lastBtn  && paging.lastBtn > paging.viewBtnCnt}">
				<li class=""><a class="page-link"
					href="getCommunity_yookaList.do?nowPage=${paging.nowPage+1}">&gt;&gt;</a></li>
			</c:if>
		</ul>

		<br> <br>
	</div>
</body>
</html>
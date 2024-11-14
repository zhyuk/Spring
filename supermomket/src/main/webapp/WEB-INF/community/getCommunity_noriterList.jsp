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
			<h2 style="margin-top: 100px;">놀이터</h2>
		</div>
		<div class="container">
			<nav id="searchNav" class="navbar navbar-expand-sm navbar-dark">
				<form class="form-inline" action="getCommunity_noriterList.do" method="post" name="noriter">
					<select class="form-control" id="sel1" name="searchCondition" style="display: inline-block !important; margin-right: 10px;">
						<c:forEach items="${conditionMap}" var="condition">
							<option value="${condition.value}">${condition.key}</option>
						</c:forEach>
					</select>

					<div class="input-group mb-3">
						<input class="form-control mr-sm-2" type="text"	name="searchKeyword" placeholder="검색어를 입력하세요.">
						<div class="input-group-append">
							<button class="btn btn-success" type="submit" style="margin-right: 5px;">검색</button>
						</div>
						<div class="input-group-append">
							<button type="button" id="conWrite"
								class="btn btn-outline-primary">글쓰기</button>
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
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${noriterList}" var="noriterList">
						<tr	onclick="noriterList(${noriterList.cm_no}, '${searchCondition}', '${searchKeyword}', ${paging.nowPage})" style="cursor: pointer;">
							<!-- 				<tr style="cursor:pointer;"> -->
							<td class="tdCenter"><a href="getNoriter/${noriterList.cm_no}">${noriterList.cm_no}</a></td>
							<td class="title" style="text-align: left;">[놀이터]${noriterList.cm_title}</td>
							<td class="tdCenter">${noriterList.cm_writer}</td>
							<td class="tdCenter">${noriterList.cm_date}</td>
							<td class="tdCenter">${noriterList.cm_view}</td>
							<td class="tdCenter">${noriterList.cm_up }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<ul class="pagination">
				<c:if
					test="${paging.nowPage > 1 && paging.lastBtn > paging.viewBtnCnt}">
					<li class="page-item"><a class="page-link" href="getCommunity_noriterList.do?nowPage=${paging.nowPage-1}">이전</a></li>
				</c:if>
				<c:forEach var="i" begin="${paging.startBtn}" end="${paging.endBtn}" step="1">
					<c:choose>
						<c:when test="${paging.nowPage==i}">
							<li class="page-item active"><a class="page-link">${i}</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="getCommunity_noriterList.do?nowPage=${i}">${i}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if
					test="${paging.nowPage < paging.lastBtn  && paging.lastBtn > paging.viewBtnCnt}">
					<li class="page-item"><a class="page-link"
						href="getCommunity_noriterList.do?nowPage=${paging.nowPage+1}">다음</a></li>
				</c:if>
			</ul>

			<br> <br>
		</div>
</body>
</html>
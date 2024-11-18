<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../view/header.jsp"%>


<style>
#searchNav {
	-webkit-justify-content: flex-end;
	justify-content: flex-end;
}

button {
	background-color: #FFD26E;
	border: none;
	padding: 3px;
	border-radius: 5px;
}

.navbar {
	padding: 10px 0px !important;
}

.pagination {
	margin-top : 30px;
	justify-content: center;
}

table, th, td, tr {
	border-bottom: 1px solid #000;
	border-collapse: collapse;
	text-align: center;
}

input[type="text"] {
	border: none;
	outline: none;
}
.no {
	width: 70px;
}

table th {
	background-color: #FFD26E;
}

.table-responsive {
	overflow-x: auto;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 30px;
}

table th, table td {
	padding: 8px;
	text-align: center;
}

.NoriterMain {
	margin: 0 auto;
}

.selectm {
	height: 30px;
	padding: 0 5px;
	border: solid 1px var(--color-main);
}

.searchKeyword {
	text-align: center;
	width: 100%;
}

.searchKeyword button {
	height: 30px;
	padding: 0 10px;
	border-radius: 10px;
}

.searchKeyword button[type="button"] {
	margin-top: 10px;
	margin-bottom: 10px;
	float: right;
}

.searchKeyword input[name="searchKeyword"] {
	width: 60%;
	height: 30px;
	border: solid 1px var(--color-main);
	margin-bottom: 10px;	
}

.pc-v, .m-v{
	margin:0;
	display: none;
}

.detail-box {
	font-size: 18px;
	width: 1200px;
	margin: 0 auto; 
	flex-direction: column;
	padding: 10px 15px;
	border: 1px solid #ddd;
	border-radius: 8px;
	background-color: #f9f9f9;
	display: flex;
}

.category-title {
	display: flex;
	align-items: center;
	gap: 5px;
	margin-bottom: 3px;
}

.detail-box .category {
	font-weight: bold;
	color: #007bff;
	margin-bottom: 5px;
}

.detail-box .title {
	font-weight: bold;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	max-width: calc(100% - 50px);
}

.detail-box .info12 {
	display: flex;
	flex-wrap: wrap;
	gap: 10px;
	color: #666;
}

.detail-box .info12 span {
	white-space: nowrap;
}

.titleflow{
	display: inline-block;
    max-width: 500px;
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
}
@media screen and (min-width: 426px) {
	.pc-v {
		display: block;
	}
}

@media screen and (max-width: 425px) {
	.m-v {
		display: block;
	}
	
	.detail-box{
		width: 100%;
		font-size: 14px;
	}
	table {
		width: 100%;
		table-layout: auto;
	}
	table th, table td {
		padding: 6px;
		font-size: 12px;
		word-wrap: break-word;
		border: 1px solid #ddd;
	}
	table th:nth-child(2), table td:nth-child(2) {
		width: 50%;
	}
	table td:nth-child(2) {
		vertical-align: top;
	}
	table td input {
		border: none;
	}
	table td input:focus {
		outline: none;
	}
	table td {
		vertical-align: middle;
	}
	table th:nth-of-type(3), table th:nth-of-type(4), table td:nth-of-type(3),
		table td:nth-of-type(4) {
		display: none;
	}
	.NoriterMain {
		width: 100%;
	}
}
</style>

<body>
	<%@ include file="../view/menu.jsp"%>
	<main class="pc-v">
		<section>
			<div class="NoriterMain">
				<br> <br>
				<div >
					<nav id="" class="">
						<form class="form-inline" action="getCommunity_noriterList.do"
							method="post">
							<div class="searchKeyword">
								<select class="selectm" id="sel1" name="searchCondition">
									<c:forEach items="${conditionMap}" var="condition">
										<option value="${condition.value}">${condition.key}</option>
									</c:forEach>
								</select> <input class="" type="text" name="searchKeyword"
									placeholder="검색어를 입력하세요.">
								<button type="submit">검색</button>
								<button type="button" id="conWrite" class="">글쓰기</button>
							</div>
						</form>
					</nav>

					<table class="tableNoriter">
						<tr style="background-color: #FFFFFF;">
							<th>번호</th>
							<th style="width: 550px;">제목</th>
							<th>작성자</th>
							<th>등록일</th>
							<th>조회수</th>
							<th>추천</th>
							<th>비추천</th>
						</tr>
						<tbody>
							<c:forEach items="${noriterList}" var="noriterList">
								<tr
									onclick="noriterList(${noriterList.cm_no}, '${searchCondition}', '${searchKeyword}', ${paging.nowPage})"
									style="cursor: pointer; border-bottom: 1px solid #fff;">
									<td class="tdCenter">${noriterList.cm_no}</td>
									<td class="title" style="text-align: left;">
										<span class="titleflow">${noriterList.cm_title}</span> 
										<span class="titleflow" style="color: red; font-style: bold;">[${noriterList.cot_cnt}]</span>
									</td>
									<td class="tdCenter">${noriterList.cm_writer}</td>
									<td class="tdCenter">${noriterList.cm_date}</td>
									<td class="tdCenter">${noriterList.cm_view}</td>
									<td class="tdCenter">${noriterList.likecnt}</td>
									<td class="tdCenter">${noriterList.hatecnt}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="m-v">
						<c:forEach items="${noriterList}" var="noriterList">
							<div class="detail-box">
								<div class="category-title">
									<div class="category">[놀이터]</div>
									<div class="title">${noriterList.cm_title}</div>
								</div>
								<div class="info12">
									<span class="writer">${noriterList.cm_writer}</span> <span
										class="comments">조회: ${noriterList.cm_view}</span> <span
										class="views">추천: ${noriterList.likecnt}</span> <span class="likes">비추천:
										${noriterList.hatecnt}</span> <span class="date">${noriterList.cm_date}</span>
								</div>
							</div>
						</c:forEach>
					</div>


					<ul class="pagination">
						<c:if
							test="${paging.nowPage > 1 && paging.lastBtn > paging.viewBtnCnt}">
							<li class="page-item"><a class="page-link"
								href="getCommunity_noriterList.do?nowPage=${paging.nowPage-1}">&lt;&lt;</a></li>
						</c:if>
						<c:forEach var="i" begin="${paging.startBtn}"
							end="${paging.endBtn}" step="1">
							<c:choose>
								<c:when test="${paging.nowPage==i}">
									<li class=""><a class="page-link">${i}</a></li>
								</c:when>
								<c:otherwise>
									<li class=""><a class="page-link"
										href="getCommunity_noriterList.do?nowPage=${i}">${i}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if
							test="${paging.nowPage < paging.lastBtn  && paging.lastBtn > paging.viewBtnCnt}">
							<li class=""><a class="page-link"
								href="getCommunity_noriterList.do?nowPage=${paging.nowPage+1}">&gt;&gt;</a></li>
						</c:if>
					</ul>

					<br> <br>
				</div>
			</div>
		</section>
	</main>
	<main class="m-v">
	<section>
			<div class="NoriterMain">
				<br> <br>
				<div style="margin: 5px;">
					<nav id="" class="">
						<form class="form-inline" action="getCommunity_noriterList.do"
							method="post">
							<div class="searchKeyword">
								<select class="selectm" id="sel1" name="searchCondition">
									<c:forEach items="${conditionMap}" var="condition">
										<option value="${condition.value}">${condition.key}</option>
									</c:forEach>
								</select> <input class="" type="text" name="searchKeyword"
									placeholder="검색어를 입력하세요.">
								<button type="submit">검색</button>
								<button type="button" id="conWrite" class="">글쓰기</button>
							</div>
						</form>
					</nav>

					<div>
						<c:forEach items="${noriterList}" var="noriterList">
							<div class="detail-box" onclick="noriterList(${noriterList.cm_no}, '${searchCondition}', '${searchKeyword}', ${paging.nowPage})" style="cursor: pointer;">
								<div class="category-title">
									<div class="category">[놀이터]</div>
									<div class="title">${noriterList.cm_title}</div>
								</div>
								<div class="info12">
									<span class="writer">${noriterList.cm_writer}</span> <span
										class="comments">조회: ${noriterList.cm_view}</span> <span
										class="views">추천: ${noriterList.likecnt}</span> <span class="likes">비추천:
										${noriterList.hatecnt}</span> <span class="date">${noriterList.cm_date}</span>
								</div>
							</div>
						</c:forEach>
					</div>


					<ul class="pagination">
						<c:if
							test="${paging.nowPage > 1 && paging.lastBtn > paging.viewBtnCnt}">
							<li class="page-item"><a class="page-link"
								href="getCommunity_noriterList.do?nowPage=${paging.nowPage-1}">&lt;&lt;</a></li>
						</c:if>
						<c:forEach var="i" begin="${paging.startBtn}"
							end="${paging.endBtn}" step="1">
							<c:choose>
								<c:when test="${paging.nowPage==i}">
									<li class=""><a class="page-link">${i}</a></li>
								</c:when>
								<c:otherwise>
									<li class=""><a class="page-link"
										href="getCommunity_noriterList.do?nowPage=${i}">${i}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if
							test="${paging.nowPage < paging.lastBtn  && paging.lastBtn > paging.viewBtnCnt}">
							<li class=""><a class="page-link"
								href="getCommunity_noriterList.do?nowPage=${paging.nowPage+1}">&gt;&gt;</a></li>
						</c:if>
					</ul>

					<br> <br>
				</div>
			</div>
		</section>
	</main>
	<script>
	if (window.innerWidth <= 425) {
	    document.div.classList.add('m-v');
	} else {
	    document.div.classList.add('pc-v');
	}
	</script>
	</div>
</body>

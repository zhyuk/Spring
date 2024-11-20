<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../view/header.jsp"%>


<style>

@font-face {
    font-family: 'yg-jalnan';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.2/JalnanOTF00.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

h1{
	font-family: 'yg-jalnan' ;
	text-align: center;
	}
#searchNav {
	-webkit-justify-content: flex-end;
	justify-content: flex-end;
}

.form-inline {
	border-bottom: 1px solid #aaa;
}
button {
	background-color: #FFDE95;
	border: none;
	padding: 3px;
	border-radius: 5px;
}

.navbar {
	padding: 10px 0px !important;
}

.pagination {
	margin-top: 30px;
	justify-content: center;
}

table, th, td, tr {
	height: 50px;
	font-size: 18px;
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
	background-color: #FFDE95;
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

.YookaMain {
	margin: 0 auto;
}

.selectm {
	height: 40px;
	padding: 0 5px;
	border: solid 1px #ddd;
	border-radius: 4px;
}

.searchKeyword {
	text-align: right;
	width: 100%;
}

.searchKeyword button {
	height: 40px;
	padding: 0 10px;
	border-radius: 10px;
}

.searchKeyword button[type="button"] {
	margin-left: 20px;
	margin-bottom: 10px;
	float: right;
}
.searchKeyword button[type="submit"] {
    border: 1px solid #ddd;
    height: 40px;
    border-left: 0px;
    background-repeat: no-repeat;
    background-position: center;
    background-size: 20px 20px;
    padding: 10px 10px 10px 40px;
    font-size: 16px;
    border-left: none;
    cursor: pointer;
    background-color: #fff;
    float: right;
    border-radius: 0px 4px 4px 0px;
	margin-bottom: 10px;
	float: right;
	background-image: url(https://cdn-icons-png.flaticon.com/512/622/622669.png);
}
.searchKeyword input[name="searchKeyword"] {
	width: 20%;
	height: 40px;
	border: solid 1px #ddd;
	margin-bottom: 10px;
	border-radius: 4px 0 0 4px;
}

.m-v {
	margin-top: 0;
}

.detail-box {
	font-size: 18px;
	width: 1200px;
	height: 120px;
	margin: 0 auto;
	flex-direction: column;
	padding: 10px 15px;
	background-color: #fff;
	border-bottom: 1px solid #aaa;
	display: flex;
}

.info12 {
	margin-top: auto;
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
}

.detail-box .title {
	font-size: 20px;
	font-weight: bold;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	max-width: calc(100% - 100px);
}

.detail-box .info12 {
	display: flex;
	flex-wrap: wrap;
	gap: 10px;
	color: #666;
}
h1{
	text-align: center;
	margin-top: 20px;
	
}

.detail-box .info12 span {
	white-space: nowrap;
}

.titleflow {
	display: inline-block;
	max-width: 500px;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}

.comCnt {
	color: red;
	font-size: 24px;
}

span.writer{
	font-weight: 900;
}


@media screen and (max-width: 425px) {
	.detail-box {
		margin-top: 100px;
		width: 100%;
		height: 70px;
		font-size: 14px;
		margin: 0 auto;
		flex-direction: column;
		padding: 10px 15px;
		border: 1px solid #ddd;
		border-radius: 8px;
		background-color: #f9f9f9;
		display: flex;
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
	
	.form-inline{
		border-bottom: none;
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
	.ShoppingMain {
		width: 100%;
	}
	.writer {
		font-weight: 900;
	}
	.detail-box .title, .comCnt {
		font-size: 14px;
	}
	.searchKeyword {
		margin-bottom: 0;
	}
	.searchKeyword input[name="searchKeyword"]{
		width: 40%;
	}
	
}
</style>
<body>
	<%@ include file="../view/menu.jsp"%>
	<main class="m-v">
	<section>
			<div class="ShoppingMain">
				<h1>쇼핑정보</h1>
				<div style="margin: 5px;">
					<nav id="" class="">
						<form class="form-inline" action="getCommunity_shoppingList.do"
							method="post">
							<div class="searchKeyword">
								<select class="selectm" id="sel1" name="searchCondition">
									<c:forEach items="${conditionMap}" var="condition">
										<option value="${condition.value}">${condition.key}</option>
									</c:forEach>
								</select> <input type="text" name="searchKeyword"
									placeholder="검색어를 입력하세요.">
								<button type="button" id="conWrite" class="">글쓰기</button>
								<button type="submit"></button>
							</div>
						</form>
					</nav>

					<div>
						<c:forEach items="${shoppingList}" var="shoppingList">
							<div class="detail-box" onclick="shoppingList(${shoppingList.cm_no}, '${searchCondition}', '${searchKeyword}', ${paging.nowPage})" style="cursor: pointer;">
								<div class="category-title">
									<div class="category">[쇼핑]</div>
									<div class="title">${shoppingList.cm_title}</div>
									<span class="comCnt">[${shoppingList.cot_cnt }]</span>
								</div>
								<div class="info12">
									<span class="writer">${shoppingList.cm_writer}</span> <span
										class="view">조회: ${shoppingList.cm_view}</span> <span
										class="up">추천: ${shoppingList.likecnt}</span> <span class="down">비추천:
										${shoppingList.hatecnt}</span> <span class="date">${shoppingList.cm_date}</span>
								</div>
							</div>
						</c:forEach>
					</div>


					<ul class="pagination">
						<c:if
							test="${paging.nowPage > 1 && paging.lastBtn > paging.viewBtnCnt}">
							<li class="page-item"><a class="page-link"
								href="getCommunity_shoppingList.do?nowPage=${paging.nowPage-1}">&lt;&lt;</a></li>
						</c:if>
						<c:forEach var="i" begin="${paging.startBtn}"
							end="${paging.endBtn}" step="1">
							<c:choose>
								<c:when test="${paging.nowPage==i}">
									<li class=""><a class="page-link">${i}</a></li>
								</c:when>
								<c:otherwise>
									<li class=""><a class="page-link"
										href="getCommunity_shoppingList.do?nowPage=${i}">${i}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if
							test="${paging.nowPage < paging.lastBtn  && paging.lastBtn > paging.viewBtnCnt}">
							<li class=""><a class="page-link"
								href="getCommunity_shoppingList.do?nowPage=${paging.nowPage+1}">&gt;&gt;</a></li>
						</c:if>
					</ul>

					<br> <br>
				</div>
			</div>
		</section>
	</main>
	</div>
</body>

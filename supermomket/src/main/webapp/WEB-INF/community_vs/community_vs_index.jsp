<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<%@ include file="../view/header.jsp" %>

			<head>
				<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/community_vs.css">
			</head>

			<body>
				<%@ include file="../view/menu.jsp" %>
					<main>
						<section id="index">
							<div class="inner">
								<h1>고민거리</h1>
								<form action="/vs_index.do" method="post">
									<div class="search-form">
										<select name="searchSelect">
											<c:forEach items="${conditionMap}" var="option">
												<option value="${option.value}" <c:if
													test="${searchCondition==option.value}">selected</c:if>
													>${option.key}
												</option>
											</c:forEach>
										</select> 
										<input type="search" name="searchKeyword" placeholder="검색어를 입력하세요" value="${searchKeyword}">
										<button class="search-btn pointer" type="submit">
											<i class="fa-solid fa-magnifying-glass"></i>
										</button>

										<c:if test="${userId != null}">
											<button type="button" class="write-btn pointer" onclick="writeBoard()">글쓰기</button>
										</c:if>
									</div>
								</form>

								<div class="clear"></div>

								<table>
									<tbody>
										<c:forEach items="${boardList}" var="board">

											<tr onclick="selBoard(${board.vs_no}, '${searchCondition}', '${searchKeyword}', ${paging.nowPage})"
												class="pointer">
												<td>
													<p class="title">
														<span class="category">[고민]</span>
														<span class="title">${board.vs_title}</span>
														<c:if test="${board.vs_count > 0}">
															<span class="comment">[${board.vs_count}]</span>
														</c:if>
													</p>
													<div class="info-box">
														<span class="writer">${board.vs_writer}</span>
														<span class="date">${board.vs_date}</span>
													</div>
												</td>
											</tr>
										</c:forEach>

										<c:if test="${boardList == null || boardList.isEmpty()}">
											<tr>
												<td colspan="4">검색 결과가 없습니다.</td>
											</tr>
										</c:if>
									</tbody>
								</table>

								<ul class="pagination">
									<c:if test="${paging.nowPage > 1 && paging.lastBtn > paging.viewBtnCnt}">
										<li>
											<a class="page-link" href="/vs_index.do?nowPage=${paging.nowPage-1}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}">이전</a>
										</li>
									</c:if>
									<c:forEach var="i" begin="${paging.startBtn}" end="${paging.endBtn}" step="1">
										<c:choose>
											<c:when test="${paging.nowPage==i}">
												<li class="active"><a class="page-link">${i}</a></li>
											</c:when>
											<c:otherwise>
												<li>
													<a class="page-link" href="/vs_index.do?nowPage=${i}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}">${i}</a>
												</li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<c:if
										test="${paging.nowPage < paging.lastBtn  && paging.lastBtn > paging.viewBtnCnt}">
										<li>
											<a class="page-link" href="/vs_index.do?nowPage=${paging.nowPage+1}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}">이후</a>
										</li>
									</c:if>
								</ul>
							</div>
						</section>
					</main>
					</div>
					<!-- menu.jsp 내 <div id="wrap> 닫는 태그 -->
					<script src="${pageContext.request.contextPath}/resources/js/community_vs.js"></script>
					<%@ include file="../view/footer.jsp" %>
			</body>
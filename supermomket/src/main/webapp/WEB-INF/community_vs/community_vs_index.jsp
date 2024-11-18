<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<%@ include file="../view/header.jsp" %>

			<head>
				<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/community_vs.css">
				<script>
					$('link[href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"]').remove();
					$('link[href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"]').remove();
					$('script[src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"]').remove();
				</script>
			</head>

			<body>
				<%@ include file="../view/menu.jsp" %>
					<main>
						<section id="index">
							<div class="inner">
								<form class="form-inline" action="/vs_index.do" method="post">
									<div class="search-form">
										<select name="searchSelect">
											<c:forEach items="${conditionMap}" var="option">
												<option value="${option.value}" <c:if
													test="${searchCondition==option.value}">selected</c:if>
													>${option.key}
												</option>
											</c:forEach>
										</select> <input type="search" name="searchKeyword" placeholder="검색어를 입력하세요."
											value="${searchKeyword}">
										<button class="search-btn pointer" type="submit">검색</button>

										<c:if test="${userId != null || userRole == 'admin'}">
											<button type="button" class="write-btn pointer"
												onclick="writeBoard()">글쓰기</button>
										</c:if>
									</div>
								</form>

								<div class="clear"></div>

								<table>
<!-- 									<thead> -->
<!-- 										<tr> -->
<!-- 											<th>번호</th> -->
<!-- 											<th>제목</th> -->
<!-- 											<th class="mobile-hide">작성자</th> -->
<!-- 											<th>작성일자</th> -->
<!-- 										</tr> -->
<!-- 									</thead> -->
									<tbody>
										<c:forEach items="${boardList}" var="board">
											<tr onclick="selBoard(${board.vs_no}, '${searchCondition}', '${searchKeyword}', ${paging.nowPage})"
												class="pointer">
												<td class="number">${board.vs_rownumber}</td>
												<td class="title">
													<div>
														<span class="title-span">${board.vs_title}</span>
														<c:if test="${board.vs_count > 0}">
															<span class="comment-span">[${board.vs_count}]</span>
														</c:if>
													</div>
												</td>
												<td class="mobile-hide">${board.vs_writer}</td>
												<td class="date">${board.vs_date}</td>
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
										<li class="page-item"><a class="page-link"
												href="/vs_index.do?nowPage=${paging.nowPage-1}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}">이전</a>
										</li>
									</c:if>
									<c:forEach var="i" begin="${paging.startBtn}" end="${paging.endBtn}" step="1">
										<c:choose>
											<c:when test="${paging.nowPage==i}">
												<li class="page-item active"><a class="page-link">${i}</a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item"><a class="page-link"
														href="/vs_index.do?nowPage=${i}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}">${i}</a>
												</li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<c:if
										test="${paging.nowPage < paging.lastBtn  && paging.lastBtn > paging.viewBtnCnt}">
										<li class="page-item"><a class="page-link"
												href="/vs_index.do?nowPage=${paging.nowPage+1}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}">이후</a>
										</li>
									</c:if>
								</ul>
							</div>
						</section>
					</main>
					</div>
					<!-- menu.jsp 내 <div id="wrap> 닫는 태그 -->
					<script src="${pageContext.request.contextPath}/resources/js/community_vs.js"></script>
					<script>
						// window.addEventListener("resize", function (e) {
						// 	let browserWidth = e.target.innerWidth;

						// 	if (browserWidth < 426) {
						// 		document.querySelectorAll("td.title").forEach((item) => {
						// 			let text = item.innerText.trim();

						// 			if (text.length >= 13) {
						// 				item.innerText = text.substring(0, 13) + "..";
						// 			}
						// 		});
						// 	} else {}
						// });

					</script>
					<%@ include file="../view/footer.jsp" %>
			</body>
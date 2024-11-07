<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp"%>

<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/community_vs.css">

</head>

<body>
	<%@ include file="../../menu.jsp"%>
	<main>
		<section id="info">
			<div class="inner">
				<c:forEach items="${boardList}" var="board">
					<div class="container">

						<div class="text-group board_info">
							<p class="title">${board.vs_title}</p>
							<p class="date">${board.vs_date}</p>
							<div class="clear"></div>
						</div>

						<div class="text-group board_info">
							<p class="writer">${board.vs_writer}</p>

							<c:if test="${sessionScope.userId == board.vs_writer}">
								<div class="btn-area">
									<button class="pointer" onclick="updateBoard(${board.vs_no}, '${searchCondition}', '${searchKeyword}', ${nowPage})">수정</button>
									<button class="pointer" onclick="deleteBoard(${board.vs_no}, '${searchCondition}', '${searchKeyword}', ${nowPage})">삭제</button>
								</div>
							</c:if>

							<div class="clear"></div>
						</div>

						<div class="text-group board_content_box">
							<div class="img-box">
								<img src="${pageContext.request.contextPath}/resources/img/vs/${board.vs_img1}">
								<img src="${pageContext.request.contextPath}/resources/img/vs/${board.vs_img2}">
							</div>
							<ul class="vote_box">
								<li class="leftResult">투표 수 : ${leftResult}</li>
								<li class="rightResult">투표 수 : ${rightResult}</li>
								
								<c:if test="${userId != null}">
								<li><button class="pointer" onclick="vote(${board.vs_no}, 1)">투표하기</button></li>
								<li><button class="pointer" onclick="vote(${board.vs_no}, 2)">투표하기</button></li>
								</c:if>
							</ul>
							
							<div class="clear"></div>
							<pre class="board_content">${board.vs_content}</pre>
						</div>
					</div>

					<div class="fm_comment_write">
						<textarea name="vs_comment" placeholder="댓글 입력"></textarea>
						<input type="hidden" name="vs_no" value="${board.vs_no}">
						<button class="pointer" onclick="insertComment()">작성</button>
					</div>
				</c:forEach>

				<c:if test="${userId == null || userId == ''}">
					<script>
						$("textarea[name=vs_comment]").prop("disabled", true);
						$("textarea[name=vs_comment]").prop("placeholder", "댓글 권한이 없습니다.");
					</script>
				</c:if>

				<div id="comment_area">
					<c:forEach items="${commentList}" var="comment">
						<c:if test="${comment.vs_rcno == 0}">
							<div class="comment_box">
								<div class="comment_info">
									<p class="writer">${comment.vs_writer}</p>
									<button class="recomment_btn pointer" onclick="viewRecomment(${comment.vs_cno})">답글보기</button>
									<p class="date">${comment.vs_date }</p>
								</div>
								<div class="clear"></div>
								<pre class="comment comment${comment.vs_cno}">${comment.vs_comment}</pre>
								<textarea name="vs_comment" class="comment_input comment_input${comment.vs_cno}">${comment.vs_comment}</textarea>
<%-- 								<input type="text" name="vs_comment" class="comment_input comment_input${comment.vs_cno}" value="${comment.vs_comment}"> --%>
								<div class="comment_btn">
									<c:if test="${userId != null && userId == comment.vs_writer}">
										<button type="button" class="updateCommentButton pointer" onclick="updateComment(${comment.vs_no}, ${comment.vs_cno})">수정</button>
										<button type="button" class="deleteCommentButton pointer" onclick="deleteComment(${comment.vs_no}, ${comment.vs_cno})">삭제</button>
										<button type="button" class="updateCancelButton pointer" onclick="updateCommentCancel()">취소</button>
									</c:if>
								</div>
								<div class="clear"></div>

								<div class="recomment_area${comment.vs_cno} recomment_area">
									<textarea name="vs_recomment" class="recomment_input recomment_input${comment.vs_cno}" placeholder="답글 입력"></textarea>
<%-- 									<input type="text" name="vs_recomment" class="recomment_input recomment_input${comment.vs_cno}" placeholder="답글 입력"> --%>
									<button onclick="insertRecomment(${comment.vs_no},${comment.vs_cno})">작성</button>

									<c:forEach items="${recommentList}" var="recomment">
										<c:if test="${comment.vs_cno == recomment.vs_rcno}">
											<div class="recomment_info">
												<p class="writer">${recomment.vs_writer}</p>
												<p class="date">${recomment.vs_date }</p>
											</div>
											<pre class="comment comment${recomment.vs_cno}">${recomment.vs_comment}</pre>
											<textarea name="vs_comment" class="comment_input comment_input${recomment.vs_cno}" >${recomment.vs_comment}</textarea>
<%-- 											<input type="text" name="vs_comment" class="comment_input comment_input${recomment.vs_cno}" value="${recomment.vs_comment}"> --%>
											<div class="comment_btn">
												<c:if test="${userId != null && userId == recomment.vs_writer}">
													<button type="button" class="updateCommentButton" onclick="updateComment(${comment.vs_no}, ${recomment.vs_cno})">수정</button>
													<button type="button" class="deleteCommentButton" onclick="deleteComment(${comment.vs_no}, ${recomment.vs_cno})">삭제</button>
													<button type="button" class="updateCancelButton" onclick="updateCommentCancel()">취소</button>
												</c:if>
											</div>
										</c:if>
									</c:forEach>
								</div>
							</div>

						</c:if>
					</c:forEach>
				</div>

				<c:if test="${userId == null || userId == ''}">
					<script>
						$("input[name=vs_recomment]").prop("disabled", true);
						$("input[name=vs_recomment]").prop("placeholder", "댓글 권한이 없습니다.");
					</script>
				</c:if>

				<form name="hideFrm" style="display:none;">
					  <input type="hidden" name="nowPage" value="${nowPage}" >
					  <input type="hidden" name="searchKeyword" value="${searchKeyword}" >
					  <input type="hidden" name="searchCondition" value="${searchCondition}" >
				</form>

				<div class="btn-area board_list_btn">
					<button class="pointer" onclick="BoardIndex()">목록보기</button>
				</div>
			</div>
		</section>
	</main>
	</div>
	<!-- menu.jsp 내 <div id="wrap> 닫는 태그 -->
	<script
		src="${pageContext.request.contextPath}/resources/js/community_vs.js"></script>


</body>
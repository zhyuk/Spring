<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../view/header.jsp"%>

<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/community_vs.css">
<style>
main {
	margin-top: 0;
}
</style>
</head>

<body>
	<%@ include file="../view/menu.jsp"%>
	<main>
		<section id="info">
			<div class="inner">
				<c:forEach items="${boardList}" var="board">
					<div class="container">
						<div class="text-group borad_info">
							<p class="title_box">
								<span class="category">[고민]</span>${board.vs_title}</p>
							<div>
								<span>${board.vs_writer}</span><span>${board.vs_date}</span>
								</div>
						</div>

						<div class="text-group board_content_box">
							<div class="img-box">
								<img src="${pageContext.request.contextPath}/resources/img/vs/${board.vs_img1}" alt="투표에 사용된 이미지 1">
								<img src="${pageContext.request.contextPath}/resources/img/vs/${board.vs_img2}" alt="투표에 사용된 이미지 2">
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


					<div class="btn-area">
						
						<c:if test="${userNickname == board.vs_writer}">
							<button class="pointer" onclick="updateBoard(${board.vs_no}, '${searchCondition}', '${searchKeyword}', ${nowPage})">수정</button>
							<button class="pointer" onclick="deleteBoard(${board.vs_no}, '${searchCondition}', '${searchKeyword}', ${nowPage})">삭제</button>
						</c:if>
						<c:if test="${userId != null}">
						<button type="button" class="write-btn pointer" onclick="writeBoard()">글쓰기</button>
						</c:if>
						<button class="pointer" onclick="BoardIndex()">목록</button>
					</div>



					<div class="fm_comment_write">
						<textarea name="vs_comment" placeholder="댓글 입력"></textarea>
						<input type="hidden" name="vs_no" value="${board.vs_no}">
						<button class="pointer" onclick="insertComment()">작성</button>
					</div>
				</c:forEach>


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
								<div class="comment_btn">
									<c:if test="${userId != null && userNickname == comment.vs_writer}">
										<button type="button" class="updateCommentButton pointer" onclick="updateComment(${comment.vs_no}, ${comment.vs_cno})">수정</button>
										<button type="button" class="deleteCommentButton pointer" onclick="deleteComment(${comment.vs_no}, ${comment.vs_cno})">삭제</button>
										<button type="button" class="updateCancelButton pointer" onclick="updateCommentCancel()">취소</button>
									</c:if>
								</div>
								<div class="clear"></div>

								<div class="recomment_area${comment.vs_cno} recomment_area">
									<textarea name="vs_recomment" class="recomment_input recomment_input${comment.vs_cno}" placeholder="답글 입력"></textarea>
									<button onclick="insertRecomment(${comment.vs_no},${comment.vs_cno})">작성</button>

									<c:forEach items="${recommentList}" var="recomment">
										<c:if test="${comment.vs_cno == recomment.vs_rcno}">
											<div class="recomment_info">
												<p class="writer">${recomment.vs_writer}</p>
												<p class="date">${recomment.vs_date }</p>
											</div>
											<div class='clear'></div>
											<pre class="comment comment${recomment.vs_cno}">${recomment.vs_comment}</pre>
											<textarea name="vs_comment" class="comment_input comment_input${recomment.vs_cno}">${recomment.vs_comment}</textarea>
											<div class="comment_btn">
												<c:if test="${userId != null && userNickname == recomment.vs_writer}">
													<button type="button" class="updateCommentButton" onclick="updateComment(${comment.vs_no}, ${recomment.vs_cno})">수정</button>
													<button type="button" class="deleteCommentButton" onclick="deleteComment(${comment.vs_no}, ${recomment.vs_cno})">삭제</button>
													<button type="button" class="updateCancelButton" onclick="updateCommentCancel()">취소</button>
												</c:if>
											</div>
											<div class="clear"></div>
										</c:if>
									</c:forEach>
								</div>
							</div>

						</c:if>
					</c:forEach>
				</div>

				<c:if test="${userId == null || userId == ''}">
					<script>
									$("textarea[name=vs_comment]").prop("disabled", true);
									$("textarea[name=vs_comment]").prop("placeholder", "댓글 권한이 없습니다.");

									$('textarea[name="vs_recomment"]').each(function() {
								        $(this).prop("disabled", true);
								        $(this).prop("placeholder", "답글 권한이 없습니다.");
									});
								</script>
				</c:if>

				<form name="hideFrm" style="display: none;">
					<input type="hidden" name="nowPage" value="${nowPage}"> 
					<input type="hidden" name="searchKeyword" value="${searchKeyword}">
					<input type="hidden" name="searchCondition" value="${searchCondition}">
				</form>
			</div>
		</section>
	</main>
	<%@ include file="../view/footer.jsp"%>
	</div>
	<!-- menu.jsp 내 <div id="wrap> 닫는 태그 -->
	<script
		src="${pageContext.request.contextPath}/resources/js/community_vs.js"></script>


</body>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ include file="../../header.jsp" %>

		<head>
			<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/community_vs.css">

		</head>

		<body>
			<%@ include file="../../menu.jsp" %>
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
										<button onclick="updateBoard(${board.vs_no})">수정</button>
										<button onclick="deleteBoard(${board.vs_no})">삭제</button>
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
									</ul>

									<ul class="vote_box">
										<li><button onclick="vote(${board.vs_no}, 1)">투표하기</button></li>
										<li><button onclick="vote(${board.vs_no}, 2)">투표하기</button></li>
									</ul>
									<pre class="board_content">${board.vs_content}</pre>
								</div>
							</div>

							<div class="fm_comment_write">
								<input type="text" name="vs_comment">
								<input type="hidden" name="vs_no" value="${board.vs_no}">
								<button onclick="insertComment()">작성</button>
							</div>
							</c:forEach>

							<c:if test="${userId == null || userId == ''}">
								<script>
									$("input[name=vs_comment]").prop("disabled", true);
									$("input[name=vs_comment]").prop("placeholder", "댓글 권한이 없습니다.");
								</script>
							</c:if>

							<div id="comment_area">
								<c:forEach items="${commentList}" var="comment">
									<div class="comment_box">
										<div class="comment_info">
											<p class="writer">${comment.vs_writer}</p>
											<button class="recomment_btn" onclick="viewRecomment(${comment.vs_no})">답글보기</button>
											<p class="date">${comment.vs_date }</p>
										</div>
										<pre class="comment">${comment.vs_comment}</pre>
										<input type="text" name="vs_comment" class="comment_input"
											value="${comment.vs_comment}">
										<div class="comment_btn">
										
										<c:if test="${userId != null && userId == comment.vs_writer}">
										<button type="button" class="updateCommentButton" onclick="updateComment(${comment.vs_no}, ${comment.vs_cno})">수정</button>
										<button type="button" class="deleteCommentButton" onclick="deleteComment(${comment.vs_no}, ${comment.vs_cno})">삭제</button>
										<button type="button" class="updateCancelButton" onclick="updateCommentCancel()">취소</button>
										</c:if>
										</div>
										
										<!-- DB에 대댓글번호 컬럼 추가 후 해당 컬럼의 값으로 변경해야함. -->
										<div class="recomment_box${comment.vs_no} recomment_box">
											<input type="text" name="vs_recomment" class="recomment">
											<button>답글쓰기</button>
										</div>
									</div>
								</c:forEach>
							</div>


							<div class="btn-area board_list_btn">
								<button onclick="BoardIndex()">목록보기</button>
							</div>
						</div>
					</section>
				</main>
				</div>
				<!-- menu.jsp 내 <div id="wrap> 닫는 태그 -->
				<script src="${pageContext.request.contextPath}/resources/js/community_vs.js"></script>


		</body>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../view/header.jsp"%>

<body>
	<style>
#imgBox {
	display: none;
	position: absolute;
	top: 0;
	left: 0;
	height: 100vh !important;
	background-color: rgba(0, 0, 0, 0.5);
	z-index: 9999999;
}

#imgContentBox {
	width: 600px;
	max-height: 550px;
	overflow: auto;
	position: absolute;
	top: 30%;
	left: 30%;
	border-radius: 5px;
	z-index: 9999999;
}

#imgBoxTitleBar {
	border-bottom: 1px solid #777;
	border-radius: 5px 5px 0 0;
	background-color: #ddd;
	width: 100%;
	padding: 10px;
	text-align: right;
	font-size: 20px;
	font-weight: bolder;
}

#imgBoxImg {
	width: 100%;
	border-radius: 0 0 5px 5px;
}

#closeX {
	padding: 5px 20px;
	border-radius: 5px;
	border: 1px solid #777;
	background-color: red;
	color: #fff;
}

#closeX:hover {
	background-color: #777;
	cursor: pointer;
}

#replyForm {
	display: none;
}

.text-muted {
	display: block;
}

.reply2 {
	margin-left: 50px;
}

.repTogYooka {
	display: none;
}

.upDown {
	width: 100%;
	display: inline-flex;
}

.likeUp>p {
	text-align: right;
	padding-right: 18px;
	color: blue;
}

.hateDown>p {
	text-align: left;
	padding-left: 18px;
	color: red;
}

.likeUp button {
	width: 100%;
	background-position: right;
	background-color: #fff;
}

.hateDown button {
	width: 100%;
	background-position: left;
	background-color: #fff;
}

.likeUp, .hateDown {
	width: 50%;
	padding: 15px;
}
</style>
	<%@ include file="../view/menu.jsp"%>
	<div class="container">
		<h1 style="margin-top: 50px;">육아정보</h1>
		<form name="fm" action="/updateYooka.do" method="get"
			enctype="multipart/form-data">
			<input type="hidden" name="cm_no" value="${yooka.cm_no}">
			<div class="input-group">
				<div class="input-group-prepend">
					<span class="input-group-text">제목</span>
				</div>

				<input type="text" class="form-control" name="cm_title"
					value="${yooka.cm_title}" readonly>

				<div class="input-group-prepend">
					<span class="input-group-text">작성자</span>
				</div>
				<input type="text" class="form-control innm" name="cm_writer"
					value="${yooka.cm_writer}" readonly>
			</div>
			<div class="input-group">
				<div class="input-group-prepend">
					<span class="input-group-text">등록일</span>
				</div>
				<input type="text" class="form-control innm" name="cm_date"
					value="${yooka.cm_date}" readonly>
				<div class="input-group-prepend">
					<span class="input-group-text">조회수</span>
				</div>
				<input type="text" class="form-control innm" name="cm_view"
					value="${yooka.cm_view}" readonly>
				<div class="input-group-prepend">
					<span class="input-group-text">추천</span>
				</div>
				<input style="text-align: center;" type="text"
					class="form-control innm" name="cm_up" value="${likeResult}"
					readonly>
				<div class="input-group-prepend">
					<span class="input-group-text">비추천</span>
				</div>
				<input style="text-align: center;" type="text"
					class="form-control innm" name="cm_down" value="${hateResult}"
					readonly>

			</div>
			<br> <br>
			<div style="width: 100%;">
				<c:choose>
					<c:when test="${not empty yooka.cm_img}">
						<c:forEach var="img" items="${fn:split(yooka.cm_img, ',')}">
							<img style="display: block; width: 80%;"
								src="${pageContext.request.contextPath}/resources/img/community/${img.trim()}">
							<br>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<p></p>
					</c:otherwise>
				</c:choose>
			</div>
			${yooka.cm_content} <br> <br>
			<ul class="upDown">
				<li class="likeUp"><button type="button" id="likebtn"
						name="likebtn"
						style="background-image: url('${pageContext.request.contextPath}/resources/img/community/like.png'); background-size: contain; background-repeat: no-repeat;height: 50px; border: none;"
						onclick="UpDownStsYooka(${yooka.cm_no}, 1)"></button>
					<p>${likeResult}</p></li>


				<li class="hateDown"><button type="button" id="hatebtn"
						name="hatebtn"
						style="background-image: url('${pageContext.request.contextPath}/resources/img/community/hate.png'); background-size: contain; background-repeat: no-repeat; height: 50px; border: none;"
						onclick="UpDownStsYooka(${yooka.cm_no}, 2)"></button>
					<p>${hateResult}</p></li>
			</ul>
			<br> <br>
			<div id="footer">
				<c:if test="${sessionScope.userId == yooka.cm_writer }">
					<button type="submit" class="">글수정</button>
					<button id="conWrite" type="button">글쓰기</button>
					<button id="conDelYooka" type="button">글삭제</button>
				</c:if>
				<button id="yookaList" type="button">글목록</button>
			</div>
		</form>
		<form name="hideFrm" style="display: none;">
			<input type="hidden" name="nowPage" value="${nowPage}"> <input
				type="hidden" name="searchKeyword" value="${searchKeyword}">
			<input type="hidden" name="searchCondition"
				value="${searchCondition}">
		</form>

		<!-- 댓글 입력 폼 -->
		<c:if test="${sessionScope.userId != NULL }">
			<div class="card mb-4">
				<div class="card-body">
					<form id="commentForm" name="commentForm"
						action="/insertCommentYooka.do">
						<div class="form-group">
							<label for="comment">내용</label>
							<textarea class="form-control" id="comment" rows="3"
								placeholder="댓글을 입력하세요" name="co_content" required></textarea>
						</div>
						<input type="hidden" name="cm_no" value="${yooka.cm_no}">
						<button type="submit" class="">댓글 남기기</button>
					</form>
				</div>
			</div>
		</c:if>

		<!-- 댓글 목록 -->
		<c:forEach items="${commentYooka}" var="commentYooka">
			<c:if test="${commentYooka.co_no2 == null}">
				<div id="commentList">
					<div class="media mb-4">
						<div class="media-body">
							<span class="mt-0">${commentYooka.co_writer}</span>
							<button id="repToggleYooka" type="button"
								onclick="replyToggleYooka(${commentYooka.co_no})">댓글보기</button>

							<small class="text-muted"> <c:choose>
									<c:when test="${not empty commentYooka.co_date2}">
						                수정일: ${commentYooka.co_date2}
						            </c:when>
									<c:otherwise>
						                등록일: ${commentYooka.co_date}
						            </c:otherwise>
								</c:choose>
							</small>

							<div style="text-align: right;">
								<form id="commentUpDel" name="commentUpDel"
									action="/updateCommentYooka.do">

									<input id="commentCoNo" type="hidden" name="co_no"
										value="${commentYooka.co_no}"> 
									<input id="commentCmNo" type="hidden" name="cm_no" 
										value="${commentYooka.cm_no}">
									<input id="commentCoWriter" type="hidden" name="co_writer"
										value="${commentYooka.co_writer}">

									<c:if test="${sessionScope.userId == commentYooka.co_writer}">
										<button id="updateCommentYooka" type="submit"
											class="btn btn-primary">수정</button>
										<button id="deleteCommentYooka" type="button"
											class="btn btn-primary"
											onclick="delCommentYooka(${commentYooka.cm_no},${commentYooka.co_no},'${commentYooka.co_writer}','${commentYooka.co_content}')">삭제</button>
									</c:if>
									
									<button id="replyYooka" type="button"
										class="btn btn-secondary btn-sm"
										onclick="replyYookabtn(${commentYooka.co_no})">댓글쓰기</button>
									
									<c:choose>
										<c:when
											test="${sessionScope.userId == commentYooka.co_writer}">
											<input id="Comment" type="text" class="form-control innm"
												name="co_content" value="${commentYooka.co_content}">
										</c:when>
										<c:otherwise>
											<input id="Comment" type="text" class="form-control innm"
												name="co_content" value="${commentYooka.co_content}"
												readonly>
										</c:otherwise>
									</c:choose>
								</form>
							</div>
							<!-- 대댓글 입력 폼 (초기에는 숨김) -->
							<div class="reply-form mt-2">
								<form class="replyForm${commentYooka.co_no} replyForm"
									action="/insertReplyYooka.do" id="replyForm">
									<input type="hidden" name="co_no2"
										value="${commentYooka.co_no}" />
									<div class="form-group">
										<textarea class="form-control" rows="2"
											placeholder="대댓글을 입력하세요" name="co_content" required></textarea>
									</div>
									<input type="hidden" name="cm_no" value="${yooka.cm_no}">
									<button type="submit" class="btn btn-secondary btn-sm">등록</button>
								</form>
							</div>

							<!-- 대댓글 목록 -->
							<c:forEach items="${commentYooka1}" var="replyYooka">
								<c:if test="${replyYooka.co_no2 == commentYooka.co_no }">
									<div
										class="media mt-3 repTogYooka${commentYooka.co_no} repTogYooka">
										<div class="media-body reply2">
											<h6 class="mt-0">${replyYooka.co_writer}</h6>
											<small class="text-muted"> 
											<c:choose>
													<c:when test="${not empty replyYooka.co_date2}">
									                수정일: ${replyYooka.co_date2}
									            </c:when>
													<c:otherwise>
									                등록일: ${replyYooka.co_date}
									            </c:otherwise>
												</c:choose>
											</small>

											<div style="text-align: right;">
												<form id="commentReplyUpDel" name="commentReplyUpDel"
													action="/updateReplyYooka.do">

													<input id="commentReplyCoNo" type="hidden" name="co_no"
														value="${replyYooka.co_no}"> <input
														id="commentReplyCmNo" type="hidden" name="cm_no"
														value="${replyYooka.cm_no}"> <input
														id="commentReplyCoWriter" type="hidden" name="co_writer"
														value="${replyYooka.co_writer}"> <input
														id="commentReplyCoNo2" type="hidden" name="co_no2"
														value="${replyYooka.co_no2}">
													<c:if test="${sessionScope.userId == replyYooka.co_writer}">
														<button id="updateReplyYooka" type="submit"
															class="btn btn-primary">수정</button>
														<button id="deleteReplyYooka" type="button"
															class="btn btn-primary deleteRB"
															onclick="delReplyYooka(${replyYooka.cm_no},${replyYooka.co_no},'${replyYooka.co_writer}','${replyYooka.co_content}')">삭제</button>
													</c:if>
													<c:choose>
														<c:when
															test="${sessionScope.userId == replyYooka.co_writer}">
															<input id="CommentReply" type="text"
																class="form-control innm" name="co_content"
																value="${replyYooka.co_content}">
														</c:when>
														<c:otherwise>
															<input id="CommentReply" type="text"
																class="form-control innm" name="co_content"
																value="${replyYooka.co_content}" readonly>
														</c:otherwise>
													</c:choose>
												</form>
											</div>
										</div>
									</div>
								</c:if>
							</c:forEach>
						</div>

					</div>
				</div>
			</c:if>
		</c:forEach>
	</div>

</body>
</html>

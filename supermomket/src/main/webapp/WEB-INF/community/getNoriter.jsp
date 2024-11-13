<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../../header.jsp"%>

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

.repTogNoriter { 
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
	<%@ include file="/menu.jsp"%>
	<div class="container">
		<h1 style="margin-top: 50px;">놀이터</h1>
		<form name="fm" action="/updateNoriter.do" method="get"
			enctype="multipart/form-data">
			<input type="hidden" name="cm_no" value="${noriter.cm_no}">
			<div class="input-group">
				<div class="input-group-prepend">
					<span class="input-group-text">제목</span>
				</div>
				<input type="text" class="form-control innm" name="cm_title"
					value="${noriter.cm_title}" readonly>
				<div class="input-group-prepend">
					<span class="input-group-text">작성자</span>
				</div>
				<input type="text" class="form-control innm" name="cm_writer"
					value="${noriter.cm_writer}" readonly>
			</div>
			<div class="input-group">
				<div class="input-group-prepend">
					<span class="input-group-text">등록일</span>
				</div>
				<input type="text" class="form-control innm" name="cm_date"
					value="${noriter.cm_date}" readonly>

				<div class="input-group-prepend">
					<span class="input-group-text">조회수</span>
				</div>
				<input type="text" class="form-control innm" name="cm_view"
					value="${noriter.cm_view}" readonly>

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
					class="form-control innm" name="cm_up" value="${hateResult}"
					readonly>
			</div>
			<br> <br>
			<div style="width: 100%;">
				<c:choose>
					<c:when test="${not empty noriter.cm_img}">
						<c:forEach var="img" items="${fn:split(noriter.cm_img, ',')}">
							<img style="display: block; width: 80%;"
								src="${pageContext.request.contextPath}/resources/img/community/${img.trim()}">
						</c:forEach>
					</c:when>
					<c:otherwise>
						<p></p>
					</c:otherwise>
				</c:choose>

			</div>

			${noriter.cm_content} <br> <br>
			<ul class="upDown">
				<li class="likeUp"><button type="button" id="likebtn"
						name="likebtn"
						style="background-image: url('${pageContext.request.contextPath}/resources/img/community/like.png'); background-size: contain; background-repeat: no-repeat;height: 50px; border: none;"
						onclick="UpDownStsNoriter(${noriter.cm_no}, 1)"></button>
					<p>${likeResult}</p></li>


				<li class="hateDown"><button type="button" id="hatebtn"
						name="hatebtn"
						style="background-image: url('${pageContext.request.contextPath}/resources/img/community/hate.png'); background-size: contain; background-repeat: no-repeat; height: 50px; border: none;"
						onclick="UpDownStsNoriter(${noriter.cm_no}, 2)"></button>
					<p>${hateResult}</p></li>
			</ul>
			<br> <br>
			<div id="footer">
				<c:if test="${sessionScope.userId == noriter.cm_writer }">
					<button type="submit" class="">글수정</button>
					<button id="conWrite" type="button" class="">글쓰기</button>
					<button id="conDelNoriter" type="button" class="">글삭제</button>
				</c:if>
				<button id="noriterList" type="button" class="">글목록</button>
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
						action="/insertCommentNoriter.do">
						<div class="form-group">
							<label for="comment">내용</label>
							<textarea class="form-control" id="comment" rows="3"
								placeholder="댓글을 입력하세요" name="co_content" required></textarea>
						</div>
						<input type="hidden" name="cm_no" value="${noriter.cm_no}">
						<button type="submit" class="">댓글 남기기</button>
					</form>
				</div>
			</div>
		</c:if>

		<!-- 댓글 목록 -->
		<c:forEach items="${commentNoriter}" var="commentNoriter">
			<c:if test="${commentNoriter.co_no2 == null}">
				<div id="commentList">
					<div class="media mb-4">
						<div class="media-body">
							<span class="mt-0">${commentNoriter.co_writer}</span>
							<button id="repToggleNoriter" type="button"
								onclick="replyToggleNoriter(${commentNoriter.co_no})">댓글보기</button>

							<small class="text-muted"> <c:choose>
									<c:when test="${not empty commentNoriter.co_date2}">
						                수정일: ${commentNoriter.co_date2}
						            </c:when>
									<c:otherwise>
						                등록일: ${commentNoriter.co_date}
						            </c:otherwise>
								</c:choose>
							</small>
							<div style="text-align: right;">
								<form id="commentUpDel" name="commentUpDel"
									action="/updateCommentNoriter.do">

									<input id="commentCoNo" type="hidden" name="co_no"
										value="${commentNoriter.co_no}"> <input
										id="commentCmNo" type="hidden" name="cm_no"
										value="${commentNoriter.cm_no}"> <input
										id="commentCoWriter" type="hidden" name="co_writer"
										value="${commentNoriter.co_writer}">

									<c:if test="${sessionScope.userId == commentNoriter.co_writer}">
										<button id="updateCommentNoriter" type="submit"
											class="btn btn-primary">수정</button>
										<button id="deleteCommentNoriter" type="button"
											class="btn btn-primary"
											onclick="delCommentNoriter(${commentNoriter.cm_no},${commentNoriter.co_no},'${commentNoriter.co_writer}','${commentNoriter.co_content}')">삭제</button>
									</c:if>

									<button id="replyNoriter" type="button"
										class="btn btn-secondary btn-sm"
										onclick="replyNoriterbtn(${commentNoriter.co_no})">댓글쓰기</button>

									<c:choose>
										<c:when
											test="${sessionScope.userId == commentNoriter.co_writer}">
											<input id="Comment" type="text" class="form-control innm"
												name="co_content" value="${commentNoriter.co_content}">
										</c:when>
										<c:otherwise>
											<input id="Comment" type="text" class="form-control innm"
												name="co_content" value="${commentNoriter.co_content}"
												readonly>
										</c:otherwise>
									</c:choose>
								</form>
							</div>

							<!-- 대댓글 입력 폼 (초기에는 숨김) -->
							<div class="reply-form mt-2">
								<form
									class="replyFormNoriter${commentNoriter.co_no} replyFormNoriter"
									action="/insertReplyNoriter.do" id="replyForm">
									<input type="hidden" name="co_no2"
										value="${commentNoriter.co_no}" />
									<div class="form-group">
										<textarea class="form-control" rows="2"
											placeholder="대댓글을 입력하세요" name="co_content" required></textarea>
									</div>
									<input type="hidden" name="cm_no" value="${noriter.cm_no}">
									<button type="submit" class="btn btn-secondary btn-sm">등록</button>
								</form>
							</div>

							<!-- 대댓글 목록 -->
							<c:forEach items="${commentNoriter1}" var="replyNoriter">
								<c:if test="${replyNoriter.co_no2 == commentNoriter.co_no }">
									<div
										class="media mt-3 repTogNoriter${commentNoriter.co_no} repTogNoriter">
										<div class="media-body reply2">
											<h6 class="mt-0">${replyNoriter.co_writer}</h6>
											<small class="text-muted"> <c:choose>
													<c:when test="${not empty replyNoriter.co_date2}">
									                수정일: ${replyNoriter.co_date2}
									            </c:when>
													<c:otherwise>
									                등록일: ${replyNoriter.co_date}
									            </c:otherwise>
												</c:choose>
											</small>

											<div style="text-align: right;">
												<form id="commentReplyUpDel" name="commentReplyUpDel"
													action="/updateReplyNoriter.do">

													<input id="commentReplyCoNo" type="hidden" name="co_no"
														value="${replyNoriter.co_no}"> <input
														id="commentReplyCmNo" type="hidden" name="cm_no"
														value="${replyNoriter.cm_no}"> <input
														id="commentReplyCoWriter" type="hidden" name="co_writer"
														value="${replyNoriter.co_writer}"> <input
														id="commentReplyCoNo2" type="hidden" name="co_no2"
														value="${replyNoriter.co_no2}">
													<c:if
														test="${sessionScope.userId == replyNoriter.co_writer}">
														<button id="updateReplyNoriter" type="submit"
															class="btn btn-primary">수정</button>
														<button id="deleteReplyNoriter" type="button"
															class="btn btn-primary deleteRB"
															onclick="delReplyNoriter(${replyNoriter.cm_no},${replyNoriter.co_no},'${replyNoriter.co_writer}','${replyNoriter.co_content}')">삭제</button>
													</c:if>
													<c:choose>
														<c:when
															test="${sessionScope.userId == replyNoriter.co_writer}">
															<input id="CommentReply" type="text"
																class="form-control innm" name="co_content"
																value="${replyNoriter.co_content}">
														</c:when>
														<c:otherwise>
															<input id="CommentReply" type="text"
																class="form-control innm" name="co_content"
																value="${replyNoriter.co_content}" readonly>
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
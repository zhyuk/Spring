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
									<div class="text-group">
										<p class="title">${board.vs_title}</p>
										<p class="date">${board.vs_date}</p>
										<div class="clear"></div>
									</div>

									

									<div class="text-group">
										<p class="writer">${board.vs_writer}</p>

										<div class="btn-area">
											<button onclick="updateBoard(${board.vs_no})">수정</button>
											<button onclick="deleteBoard(${board.vs_no})">삭제</button>
										</div>

										<div class="clear"></div>
									</div>

									<div class="text-group">
										<div class="img-box">
											<img src="${pageContext.request.contextPath}/resources/img/vs/${board.vs_img1}">
											<img src="${pageContext.request.contextPath}/resources/img/vs/${board.vs_img2}">
										</div>
										<ul class="img-box">
											<li>${leftResult}</li>
											<li>${rightResult}</li>
										</ul>
										
										<ul class="img-box">
											<li onclick="leftAjax(${board.vs_no})">투표하기</li>
											<li onclick="rightAjax(${board.vs_no})">투표하기</li>
										</ul>
										<pre>${board.vs_content}</pre>
									</div>
								</div>

								<div class="content">
<!-- 									<form action="/vs_comment_insert.do" method="post"> -->
<!-- 										<input type="text" name="vs_comment"> -->
<%-- 										<input type="hidden" name="vs_no" value="${board.vs_no}"> --%>
<!-- 										<button type="submit">작성</button> -->
<!-- 									</form> -->
									<input type="text" name="vs_comment">
									<input type="hidden" name="vs_no" value="${board.vs_no}">
									<button onclick="insertComment()">작성</button>
								</div>
							</c:forEach>
							<c:forEach items="${commentList}" var="comment">
								<div class="comment">
									<p>${comment.vs_writer}</p>
									<pre class="comment">${comment.vs_comment}</pre>
									<input type="text" id="vs_comment" name="vs_comment" value="${comment.vs_comment}">
									<p>${comment.vs_date }</p>
									
									<button type="button" onclick="updateComment(${comment.vs_no}, ${comment.vs_cno})">수정</button>
									<button type="button" onclick="deleteComment(${comment.vs_no}, ${comment.vs_cno})">삭제</button>
								</div>
							</c:forEach>
							

							<div class="btn-area">
								<button onclick="BoardIndex()">목록보기</button>
							</div>
						</div>
					</section>
				</main>
				</div>
				<!-- menu.jsp 내 <div id="wrap> 닫는 태그 -->
				<script src="${pageContext.request.contextPath}/resources/js/community_vs.js"></script>


		</body>
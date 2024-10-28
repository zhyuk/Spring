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
											<img src="${pageContext.request.contextPath}/resources/img/vs/${board.vs_img1}" onclick="leftAjax(${board.vs_no})">
											<img src="${pageContext.request.contextPath}/resources/img/vs/${board.vs_img2}" onclick="rightAjax(${board.vs_no})">
										</div>

										<pre>${board.vs_content}</pre>
									</div>
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
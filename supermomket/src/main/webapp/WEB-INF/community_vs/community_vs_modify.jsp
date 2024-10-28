<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ include file="../../header.jsp" %>

		<head>
			<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/community_vs.css">

		</head>

		<body>
			<%@ include file="../../menu.jsp" %>
				<main>
					<section id="modify">
						<div class="inner">
							<c:forEach items="${boardList}" var="board">
								<form action="/vs_update.do" id="writeForm" method="post" enctype="multipart/form-data">

									<div class="input-group">
										<input type="hidden" name="vs_no" value="${board.vs_no}">
									</div>

									<div class="input-group">
										<input type="text" id="title" class="inputData" name="vs_title"
											placeholder="제목을 입력하세요." value="${board.vs_title}">
									</div>

									<div class="input-group">
										
										<button type="button">이미지 보기</button>
										<button type="button">이미지 수정</button>
										<input type="file" id="img1_button" class="inputData" name="vs_img1_file">

										<!-- <input type="file" class="inputData" name="vs_img2_file"> -->
									</div>

									<div class="input-group">
										<textarea id="content" class="inputData" name="vs_content"
											placeholder="내용 입력">${board.vs_content}</textarea>
									</div>

									<div class="btn-area">
										<button type="submit" id="btn">수정</button>
										<button type="button" onclick="location.href = '/vs_index.do'">취소</button>
									</div>
								</form>
							</c:forEach>
						</div>
					</section>
				</main>
				</div> <!-- menu.jsp 내 <div id="wrap> 닫는 태그 -->
				<script src="${pageContext.request.contextPath}/resources/js/community_vs.js"></script>
				<script src="${pageContext.request.contextPath}/resources/js/community_vs_write.js"></script>


		</body>
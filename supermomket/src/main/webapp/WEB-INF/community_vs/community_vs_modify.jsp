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
										
										<button type="button" id="img1_view_btn" class="img_view_btn">이미지 보기</button>
										<div id="img1_box" class="img_box">
											<button type="button" id="img1_close" class="close pointer">X</button>
											<img src="${pageContext.request.contextPath}/resources/img/vs/${board.vs_img1}">
											<input type="hidden" name="vs_img1" value="${board.vs_img1}">
										</div>
										<button type="button" id="img1_select_btn" class="img_select_btn">이미지 수정</button>

										<div id="img1_select" class="img_select">
											<input type="file" id="img1_button" name="vs_img1_file" disabled>
										</div>

										<button type="button" id="img2_view_btn" class="img_view_btn">이미지 보기</button>
										<div id="img2_box" class="img_box">
											<button type="button" id="img2_close" class="close pointer">X</button>
											<img src="${pageContext.request.contextPath}/resources/img/vs/${board.vs_img2}">
											<input type="hidden" name="vs_img2" value="${board.vs_img2}">
										</div>
										<button type="button" id="img2_select_btn" class="img_select_btn">이미지 수정</button>

										<div id="img2_select" class="img_select">
											<input type="file" id="img2_button" name="vs_img2_file" disabled>
										</div>
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
				<script>
					$(".img_view_btn").click(function(){
						// console.log($(this).attr("id"));

						if($(this).attr("id") == "img1_view_btn"){
							// console.log("이미지 1");
							$("#img1_box").show();
						} else {
							// console.log("이미지 2");
							$("#img2_box").show();
						}
					});

					$(".close").click(function(){
						$(".img_box").hide();
					});

					$(".img_select_btn").click(function(){

						if($(this).attr("id") == "img1_select_btn"){
							console.log("이미지 1 수정");
							$("#img1_box input").attr("disabled", true);
							$("#img1_select input").attr("disabled", false);
							$("#img1_select").show();
						} else {
							console.log("이미지 2 수정");
							$("#img2_box input").attr("disabled", true);
							$("#img2_select input").attr("disabled", false);
							$("#img2_select").show();
						}
					});
				</script>


		</body>
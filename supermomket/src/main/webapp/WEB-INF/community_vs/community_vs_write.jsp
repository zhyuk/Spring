<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ include file="../../header.jsp" %>

		<head>
			<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/community_vs.css">

		</head>

		<body>
			<%@ include file="../../menu.jsp" %>
				<main>
					<section id="write">
						<div class="inner">
							<form action="/vs_write.do" id="writeForm" method="post" enctype="multipart/form-data">
								<div class="input-group">
									<input type="text" id="title" class="inputData" name="vs_title"
										placeholder="제목을 입력하세요.">
								</div>

								<div class="input-group">
									<input type="file" class="inputData" name="vs_img1_file" onchange="readURL(this)">
									<input type="file" class="inputData" name="vs_img2_file" onchange="readURL(this)">
								</div>
								
								<div class="preview_box">
									<div><img id="img1_preview" class="preview_img"></div>
									<div><img id="img2_preview" class="preview_img"></div>
								</div>

								<div class="input-group">
									<textarea id="content" class="inputData" name="vs_content"
										placeholder="내용 입력"></textarea>
								</div>

								<div class="btn-area">
									<button type="submit" id="btn">등록</button>
									<button type="button" onclick="location.href = '/vs_index.do'">취소</button>
								</div>
							</form>
						</div>
					</section>
				</main>
				</div> <!-- menu.jsp 내 <div id="wrap> 닫는 태그 -->
				<script src="${pageContext.request.contextPath}/resources/js/community_vs_write.js"></script>


		</body>
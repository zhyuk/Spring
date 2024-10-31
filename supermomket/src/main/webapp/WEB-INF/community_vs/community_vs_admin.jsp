<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ include file="../admin/header.jsp" %>

			<head>
				<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/community_vs.css">

			</head>

			<body>
				<%@ include file="../admin/menu.jsp" %>
					<main>
						<section id="admin">
							<div class="inner">
								<div class="button_list">
									<button class="update_button">수정</button>
									<button class="delete_button">삭제</button>
								</div>
								
								<table>
									<tr>
										<th><input type="checkbox" id="all_check" class="pointer" name="all_check"></th>
										<th>번호</th>
										<th>제목</th>
										<th>작성자</th>
										<th>작성일자</th>
									</tr>
									<c:forEach items="${boardList}" var="board">
										<tr>
											<td>
												<input type="checkbox" class="check pointer" name="vs_check">
												<input type="hidden" name="vs_no" value="${board.vs_no}">
											</td>
											<td><input type="text" name="vs_no" value="${board.vs_no}" readonly></td>
											<td><input type="text" name="vs_no" value="${board.vs_title}"></td>
											<td><input type="text" name="vs_no" value="${board.vs_writer}" readonly>
											</td>
											<td><input type="text" name="vs_no" value="${board.vs_date}" readonly></td>
										</tr>
										<tr>
											<td><input type="text" value="${board.vs_content}"></td>
											<td colspan="2"><img
													src="${pageContext.request.contextPath}/resources/img/vs/${board.vs_img1}">
											</td>
											<td colspan="2"><img
													src="${pageContext.request.contextPath}/resources/img/vs/${board.vs_img2}">
											</td>
										</tr>
									</c:forEach>
								</table>

							</div>
						</section>
					</main>
					</div>
					<!-- menu.jsp 내 <div id="wrap> 닫는 태그 -->
					<script>
						$("#all_check").click(function () {
							let result = false;
// 							console.log($(".check"));
							$(".check").each(function (index, item) {
// 								console.log($(item).prop("checked"));
								if ($(item).prop("checked") == true) {
									result = true;
								}

								if (result == false) {
									$(item).prop("checked", true);
								} else {
									$(item).prop("checked", false);
								}
							})
						});

					</script>
			</body>
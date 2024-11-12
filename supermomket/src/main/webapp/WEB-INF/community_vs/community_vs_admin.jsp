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
								<h3>커뮤니티 - 고민거리 관리</h3>
								<div class="button_list">
									<button id="update_button" class="pointer">수정</button>
									<button id="delete_button" class="pointer">삭제</button>
									<div class="clear"></div>
								</div>


								<table id="admin_list_table">
									<thead>
										<tr>
											<th><input type="checkbox" id="all_check" class="pointer" name="all_check">
											</th>
											<th>번호</th>
											<th>제목</th>
											<th>작성자</th>
											<th>작성일자</th>
											<th>관리</th>
										</tr>
									</thead>

									<tbody>
										<c:forEach items="${boardList}" var="board">
											<tr class="basic_info">
												<td><input type="checkbox" class="check pointer" name="vs_check"></td>
												<td>
													<input type="text" name="vs_no" value="${board.vs_no}" readonly>
												</td>
												<td><input type="text" name="vs_title" value="${board.vs_title}"></td>
												<td>
													<input type="text" name="vs_writer" value="${board.vs_writer}"
														readonly>
												</td>
												<td>
													<input type="text" name="vs_date" value="${board.vs_date}" readonly>
												</td>
												<td>
													<button onclick="showContentInfo(${board.vs_no})">상세보기</button>
													<button onclick="showCommentInfo(${board.vs_no})">댓글보기</button>
												</td>
											</tr>

											<tr class="content_info${board.vs_no} content_info">
												<td></td>
												<td></td>
												<td colspan="4">
													<textarea id="content" class="inputData"
														name="vs_content">${board.vs_content}</textarea>
												</td>
											</tr>

											<tr class="img_info${board.vs_no} img_info">
												<td></td>
												<td></td>
												<td colspan="2">
													<img src="${pageContext.request.contextPath}/resources/img/vs/${board.vs_img1}"
														alt="투표에 사용된 이미지 1">
												</td>
												<td colspan="2">
													<img src="${pageContext.request.contextPath}/resources/img/vs/${board.vs_img2}"
														alt="투표에 사용된 이미지 2">
												</td>
											</tr>

										</c:forEach>
									</tbody>
								</table>

								<div id="modal">
									<button id="modalClose" class="close" onclick="closeCommentInfo()">X</button>
									<div class="inner"></div>
								</div>
							</div>
						</section>
					</main>
					<button id="ScrollTop">TOP</button>
					</div>

					<script src="${pageContext.request.contextPath}/resources/js/community_vs_admin.js"></script>
			</body>
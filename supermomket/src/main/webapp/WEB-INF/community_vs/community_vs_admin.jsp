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
									<button class="update_button pointer">수정</button>
									<button class="delete_button pointer">삭제</button>
								</div>

								<table>
									<thead>
										<tr>
											<th><input type="checkbox" id="all_check" class="pointer" name="all_check">
											</th>
											<th>제목</th>
											<th>내용</th>
											<th>작성자</th>
											<th>작성일자</th>
										</tr>
									</thead>
									<c:forEach items="${boardList}" var="board">
										<tr>
											<td><input type="checkbox" class="check pointer" name="vs_check"></td>
											<td><input type="text" name="vs_title" value="${board.vs_title}"></td>
											<td><textarea id="content" class="inputData" name="vs_content" placeholder="내용 입력">${board.vs_content}</textarea></td>
											<td><input type="text" name="vs_writer" value="${board.vs_writer}" readonly>
											</td>
											<td><input type="text" name="vs_date" value="${board.vs_date}" readonly>
											</td>
										</tr>
										<tr>
											<td><input type="text" name="vs_no" value="${board.vs_no}" readonly></td>
											<td colspan="2"><img src="${pageContext.request.contextPath}/resources/img/vs/${board.vs_img1}" alt="투표에 사용된 이미지 1">
											</td>
											<td colspan="2"><img src="${pageContext.request.contextPath}/resources/img/vs/${board.vs_img2}" alt="투표에 사용된 이미지 2">
											</td>
										</tr>
									</c:forEach>
								</table>

							</div>
						</section>
					</main>
					<button id="ScrollTop">TOP</button>
					</div>
					<!-- menu.jsp 내 <div id="wrap> 닫는 태그 -->
					<script>
						$(function () {
							// ScrollTop
							function scrollToTop() {
								window.scrollTo({
									top: 0,
									behavior: 'smooth'
								});
							}
							// 버튼 클릭 시 화면 맨 위로 스크롤하는 이벤트 핸들러
							var button = document.getElementById('ScrollTop');
							button.addEventListener('click', scrollToTop);
						});

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

						$(".update_button").click(function () {
							$("input.check:checked").each(function () {
								let tr = $(this).closest("tr");
								let nextTr = $(tr).next("tr");
								let vs_no = $(nextTr).children("td").children("input[name='vs_no']").val();
								let vs_title = $(tr).children("td").children("input[name='vs_title']").val();
								let vs_content = $(tr).children("td").children("textarea[name='vs_content']").val();

								if (confirm("정말로 수정하시겠습니까?")) {
									$.ajax({
										type: "POST",
										url: "/vs_admin_update.do",
										data: {
											vs_no: vs_no,
											vs_title: vs_title,
											vs_content: vs_content
										},
										cache: false,
										success: function (data) {
											console.log('ajax 성공');
											console.log(data);
											console.log(data.length);

											let content = '<tr>';
											content += '<th><input type="checkbox" id="all_check" class="pointer" name="all_check"></th>';
											content += '<th>제목</th>';
											content += '<th>내용</th>';
											content += '<th>작성자</th>';
											content += '<th>작성일자</th>';
											content += '</tr>';

											if (data.length > 0) {
												$("table").html("");
												for (let i = 0; i < data.length; i++) {
													content += '<tr>';
													content += '<td>';
													content += '<input type="checkbox" class="check pointer" name="vs_check">';
													content += '</td>';
													content += '<td><input type="text" name="vs_title" value="' + data[i].vs_title + '"></td>';
													content += '<td><textarea id="content" class="inputData" name="vs_content" placeholder="내용 입력">' + data[i].vs_content + '</textarea></td>'
													content += '<td><input type="text" name="vs_writer" value="' + data[i].vs_writer + '" readonly>';
													content += '</td>';
													content += '<td><input type="text" name="vs_date" value="' + data[i].vs_date + '" readonly>';
													content += '</td>';
													content += '</tr>';
													content += '<tr>';
													content += '<td><input type="text" name="vs_no" value="' + data[i].vs_no + '" readonly></td>';
													content += '<td colspan="2"><img src="${pageContext.request.contextPath}/resources/img/vs/' + data[i].vs_img1 + '"> </td>';
													content += '<td colspan="2"><img src="${pageContext.request.contextPath}/resources/img/vs/' + data[i].vs_img2 + '"> </td>';
													content += '</tr>';
												}
											} else {
												content += '<tr>'
												content += '<td colspan="5">'
												content += '<p>내용없음</p>'
												content += '</td>'
											}
											alert("수정 완료되었습니다.");
											$("table").append(content);
										},
										error: function (error) {
										}
									});
								}
							});
						});

						$(".delete_button").click(function () {
							$("input.check:checked").each(function () {
								let tr = $(this).closest("tr");
								let nextTr = $(tr).next("tr");
								let vs_no = $(nextTr).children("td").children("input[name='vs_no']").val();
								let vs_title = $(tr).children("td").children("input[name='vs_title']").val();
								let vs_content = $(tr).children("td").children("input[name='vs_content']").val();

								if (confirm("정말로 삭제하시겠습니까?")) {
									$.ajax({
										type: "POST",
										url: "/vs_admin_delete.do",
										data: {
											vs_no: vs_no,
											vs_title: vs_title,
											vs_content: vs_content
										},
										cache: false,
										success: function (data) {
											console.log('ajax 성공');
											console.log(data);
											console.log(data.length);

											let content = '<tr>';
											content += '<th><input type="checkbox" id="all_check" class="pointer" name="all_check"></th>';
											content += '<th>제목</th>';
											content += '<th>내용</th>';
											content += '<th>작성자</th>';
											content += '<th>작성일자</th>';
											content += '</tr>';

											if (data.length > 0) {
												$("table").html("");
												for (let i = 0; i < data.length; i++) {
													content += '<tr>';
													content += '<td>';
													content += '<input type="checkbox" class="check pointer" name="vs_check">';
													content += '</td>';
													content += '<td><input type="text" name="vs_title" value="' + data[i].vs_title + '"></td>';
													content += '<td><input type="text" name="vs_content" value="' + data[i].vs_content + '"></td>';
													content += '<td><input type="text" name="vs_writer" value="' + data[i].vs_writer + '" readonly>';
													content += '</td>';
													content += '<td><input type="text" name="vs_date" value="' + data[i].vs_date + '" readonly>';
													content += '</td>';
													content += '</tr>';
													content += '<tr>';
													content += '<td><input type="text" name="vs_no" value="' + data[i].vs_no + '" readonly></td>';
													content += '<td colspan="2"><img src="${pageContext.request.contextPath}/resources/img/vs/' + data[i].vs_img1 + '"> </td>';
													content += '<td colspan="2"><img src="${pageContext.request.contextPath}/resources/img/vs/' + data[i].vs_img2 + '"> </td>';
													content += '</tr>';
												}
											} else {
												content += '<tr>'
												content += '<td colspan="5">'
												content += '<p>내용없음</p>'
												content += '</td>'
											}
											alert("삭제가 완료되었습니다.");
											$("table").append(content);

										},
										error: function (error) {
										}
									});
								}
							});
						});
					</script>
			</body>
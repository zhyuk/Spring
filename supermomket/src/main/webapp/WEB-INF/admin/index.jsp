b<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<%@ include file="header.jsp" %>

			<body>
				<%@ include file="menu.jsp" %>
					<main>
						<section id="admin_index_section">
							<div class="inner">
								<div class="row_section">
									<div id="chart_card" class="card">
										<h3>오늘 가입한 사용자</h3>
										<div class="content_box">
										</div>
									</div>

									<div id="product_card" class="card">
										<h3>상품 관리</h3>
										<div class="content_box">
											<table>
												<thead>
													<tr>
														<th>상품번호</th>
														<th>상품명</th>
														<th>가격</th>
														<th>재고</th>
														<th>조회수</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${productList}" var="product">
														<tr>
															<td>${product.p_no}</td>
															<td class="scroll">${product.p_name}</td>
															<td>${product.p_price}</td>
															<td>${product.p_count}</td>
															<td>${product.p_view}</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
								</div>
								<div class="second_row row_section">
									<div id="board_card" class="card">
										<h3>게시글 관리</h3>
										<div class="content_box">
											<table>
												<thead>
													<tr>
														<th>분류</th>
														<th>제목</th>
														<th>작성자</th>
														<th>작성일자</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${boardList}" var="board">
														<tr>
															<td>${board.source}-${board.vs_no}</td>
															<td class="scroll">${board.vs_title}</td>
															<td>${board.vs_writer}</td>
															<td>${board.vs_date}</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>

									<div id="user_card" class="card">
										<h3>사용자 관리</h3>
										<div class="content_box">
											<table>
												<thead>
													<tr>
														<th>이름</th>
														<th>닉네임</th>
														<th>아이디</th>
														<th>휴대전화</th>
														<th>가입일자</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${userList}" var="user">
														<tr>
															<td>${user.u_name}</td>
															<td class="scroll">${user.u_nickname}</td>
															<td>${user.u_id}</td>
															<td>${user.u_pno}</td>
															<td>${user.u_date}</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</section>
					</main>
			</body>
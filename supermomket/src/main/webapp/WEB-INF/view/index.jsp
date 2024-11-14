<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<%@ include file="./header.jsp" %>

			<body>
				<%@ include file="./menu.jsp" %>
					<main>
						<section id="user_index_section">
							<div class=inner>

								<div id="product_box">
									<h3>이번 주 특가</h3>

									<div class="list">
										<c:forEach items="${productList}" var="product">
											<div class="card">
												<a href="/detail.do?p_no=${product.p_no}"> <img
														src="resources/img/product/${product.p_img}"
														alt="${product.p_name}">
												</a>
											</div>
										</c:forEach>
									</div>
								</div>

								<div id="list_box">
									<div id="used_box" class="content_box">
										<div>
											<h3>중고상품</h3>
											<!-- 						<button class="about_btn"> -->
											<!-- 							<a href="/trade.do">더보기</a> -->
											<!-- 						</button> -->
										</div>
										<div class="clear"></div>

										<ul>
											<c:forEach items="${tradeList}" var="trade">
												<li><a href="/trade_detail.do?t_no=${trade.t_no}">
														<p class="title">${trade.t_product}</p>
														<p class="date">${trade.t_date.split(' ')[0]}</p>
													</a></li>

											</c:forEach>
										</ul>
									</div>

									<div id="community_box" class="content_box">
										<div>
											<h3>게시판</h3>
											<!-- 						<button class="about_btn"> -->
											<!-- 							<a href="/getCommunity_yookaList.do">더보기</a> -->
											<!-- 						</button> -->
										</div>
										<div class="clear"></div>

										<ul>
											<c:forEach items="${boardList}" var="board">
												<li>
													<c:choose>
														<c:when test="${board.source eq 'vs'}">
															<a
																href="/vs_info.do?vs_no=${board.vs_no}&searchCondition=title&searchKeyword=&nowPage=1">
																<p class="title">
																	<span>고민거리</span>${board.vs_title}
																</p>
																<p class="date">${board.vs_date}</p>
															</a>
														</c:when>

														<c:when test="${board.source eq 'yooka'}">
															<a
																href="/getYooka.do?cm_no=${board.vs_no}&searchCondition=cm_title&searchKeyword=&nowPage=1">
																<p class="title">
																	<span>육아정보</span>${board.vs_title}
																</p>
																<p class="date">${board.vs_date}</p>
															</a>
														</c:when>

														<c:when test="${board.source eq 'noriter'}">
															<a
																href="/getNoriter.do?cm_no=${board.vs_no}&searchCondition=title&searchKeyword=&nowPage=1">
																<p class="title">
																	<span>놀이터</span>${board.vs_title}
																</p>
																<p class="date">${board.vs_date}</p>
															</a>
														</c:when>

														<c:otherwise>
															<a
																href="/getShopping.do?cm_no=${board.vs_no}&searchCondition=title&searchKeyword=&nowPage=1">
																<p class="title">
																	<span>쇼핑정보</span>${board.vs_title}
																</p>
																<p class="date">${board.vs_date}</p>
															</a>
														</c:otherwise>
													</c:choose>
												</li>

											</c:forEach>
										</ul>
									</div>
								</div>
								<div class="clear"></div>
							</div>
						</section>
					</main>
					<%@ include file="./footer.jsp" %>
			</body>
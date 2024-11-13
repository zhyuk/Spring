<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="header.jsp"%>
<body>
	<%@ include file="menu.jsp"%>
	<main>
		<section id="admin_index_section">
			<div class="inner">
				<div class="content_box">
					<h3>오늘 가입한 사용자</h3>
					<div class="card"></div>
				</div>
				<div class="content_box">
					<h3>상품 관리</h3>
					<div class="card"></div>
				</div>
				<div class="content_box">
					<h3>게시글 관리</h3>
					<div class="card">
						<table>
							<thead>
								<tr>
									<th>분류</th>
									<th>글번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일자</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${boardList}" var="board">
									<tr>
										<c:choose>
											<c:when test="${board.source eq 'vs'}">
												<td>고민거리</td>
											</c:when>
											
											<c:when test="${board.source eq 'yooka'}">
												<td>육아정보</td>
											</c:when>
											
											<c:when test="${board.source eq 'noriter'}">
												<td>놀이터</td>
											</c:when>
											
											<c:otherwise>
												<td>쇼핑정보</td>
											</c:otherwise>
										</c:choose>
										
										<td>${board.vs_no}</td>
										<td>${board.vs_title}</td>
										<td>${board.vs_writer}</td>
										<td>${board.vs_date}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div class="content_box">
					<h3>사용자 관리</h3>
					<div class="card"></div>
				</div>

				<div class="clear"></div>

			</div>
		</section>
	</main>
</body>
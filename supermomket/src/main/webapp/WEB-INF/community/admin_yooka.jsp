<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../admin/header.jsp"%>
<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/community_vs.css">
</head>
<style>
</style>
<body>
	<%@ include file="../admin/menu.jsp"%>
	<main>
		<section id="admin">
			<div class="inner">
				<div class="button_list">
					<button class="update_button pointer">수정</button>
					<button class="delete_button pointer">삭제</button>
				</div>

				<table>
					<tr>
						<th><input type="checkbox" id="all_check" class="pointer"
							name="all_check"></th>
						<th>제목</th>
						<th>내용</th>
						<th>작성자</th>
						<th>작성일자</th>
					</tr>
					<c:forEach items="${yookaList}" var="yookaList">
						<tr>
							<td><input type="checkbox" class="check pointer"
								name="vs_check"></td>
							<td><input type="text" name="vs_title"
								value="${yookaList.cm_title}"></td>
							<td><textarea id="content" class="inputData"
									name="vs_content" placeholder="내용 입력">${yookaList.cm_content}</textarea></td>
							<td><input type="text" name="vs_writer"
								value="${yookaList.cm_writer}" readonly></td>
							<td><input type="text" name="vs_date"
								value="${yookaList.cm_date}" readonly></td>
						</tr>
						<tr>
							<td><input type="text" name="vs_no"
								value="${yookaList.cm_no}" readonly "></td>
							<td colspan="4" style="display:flex; border: none;"><c:choose>
									<c:when test="${not empty yookaList.cm_img}">
										<c:forEach var="img" items="${fn:split(yookaList.cm_img, ',')}">
											<img style="width: 100px; height: 100px; display: inline;"
												src="${pageContext.request.contextPath}/resources/img/community/${img.trim()}">
											<br>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<p></p>
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
					</c:forEach>
				</table>

			</div>
		</section>
	</main>
</body>

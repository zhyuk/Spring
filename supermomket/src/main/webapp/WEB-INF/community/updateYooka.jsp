<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../view/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
.textarea {
	border: none;
}

.textarea:focus {
	outline: none;
}
</style>
<body>
	<%@ include file="../view/menu.jsp"%>
	<div class="container">
		<h1 style="padding: 50px;">수정하기</h1>
		<div class="container-fluid">
			<form action="updateYooka.do" method="post"
				enctype="multipart/form-data">
				<input type="hidden" name="cm_no" value="${yookaList1.cm_no}">
				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text">제목</span>
					</div>
					<input type="text" class="form-control" name="cm_title"
						value="${yookaList1.cm_title}">
					<div class="input-group-prepend">
						<span class="input-group-text">작성자</span>
					</div>
					<input type="text" class="form-control innm" name="cm_writer"
						value="${userId}" readonly>
				</div>
				<br> <br>
				<c:choose>
					<c:when test="${not empty yookaList1.cm_img}">
						<c:forEach var="image" items="${fn:split(yookaList1.cm_img, ',')}">
							<img style="width: 80%;"
								src="${pageContext.request.contextPath}/resources/img/community/${image}"
								alt="현재 이미지">
						</c:forEach>
						<div>
							<label><input type="checkbox" name="deleteOldImage"
								value="true"> 기존이미지 삭제</label>
						</div>
					</c:when>
					<c:otherwise>
						<p></p>
					</c:otherwise>
				</c:choose>
				<div>
					<textarea class="textarea" rows="20" cols="130" id="comment"
						name="cm_content">${yookaList1.cm_content }</textarea>
				</div>

				<label>사진:</label> <input type="file" name="uploadFiles" multiple>
				<div id="footer">
					<button type="submit" class="">수정하기</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>

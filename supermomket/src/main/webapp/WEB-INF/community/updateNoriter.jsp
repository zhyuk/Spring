<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../view/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
.card-write {
	border: 1px solid #999;
	padding: 10px;
	border-radius: 13px;
	box-shadow: 2px 4px 8px rgba(0, 0, 0, 0.2);
	border: none;
}

.textarea:focus {
	outline: none;
}

.modify {
	height: 40px;
	border-radius: 5px;
	margin: 20px 0;
	border: none;
	padding: 5px;
	background-color: #e7e4e4;
}

.modifyBtn{
	text-align: center;
}
h1 {
	padding: 20px;
	text-align: center;
}

.click {
	width: 80%;
}

.title input[type="text"] {
	margin-top: 20px;
	margin-bottom: 5px;
	width: 100%;
	border: 1px solid #999;
	padding: 10px;
	border-radius: 13px;
	box-shadow: 2px 4px 8px rgba(0, 0, 0, 0.2);
}

.title {
	width: 100%;
}

.card-write input {
	padding: 10px;
	border: 1px solid #e2e2e2;
	border-radius: 5px;
	box-shadow: 3px 3px 10px #e6e6e6;
}

.textarea {
	width: 100%;
	border: none;
}

label {
	border: 1px solid #999;
	padding: 10px;
	border-radius: 13px;
	box-shadow: 2px 4px 8px rgba(0, 0, 0, 0.2);
	border: none;
}

@media screen and (max-width: 425px){
	input{
		width: 83%
	}
}
</style>
<body>
	<%@ include file="../view/menu.jsp"%>
	<div class="container">
		<h1>수정하기</h1>
		<div class="">
			<form action="updateNoriter.do" method="post"
				enctype="multipart/form-data">
				<input type="hidden" name="cm_no" value="${noriterList1.cm_no}">
				<input type="hidden" name="cm_writer" value="${userId}">
				
				<div class="card-write">
					<div class="title">
						<input type="text" name="cm_title" value="${noriterList1.cm_title }">
					</div>
					<br>
					<c:choose>
						<c:when test="${not empty noriterList1.cm_img}">
							<c:forEach var="image"
								items="${fn:split(noriterList1.cm_img, ',')}">
								<img style="width: 80%;"
									src="${pageContext.request.contextPath}/resources/img/community/${image}"
									alt="현재 이미지">
							</c:forEach>

							<div class="textarea">
								<label><input type="checkbox" name="deleteOldImage"
									value="true"> 기존이미지 삭제</label>
							</div>
						</c:when>
						<c:otherwise>
							<p></p>
						</c:otherwise>
					</c:choose>
					<textarea class="textarea" rows="20" cols="130" id="comment"
						name="cm_content">${noriterList1.cm_content }</textarea>
					<br> <br> <label>사진:</label> <input type="file"
						name="uploadFiles" multiple>
					<div class="modifyBtn">
						<button type="submit" class="modify">수정하기</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<br>
	<br>
</body>

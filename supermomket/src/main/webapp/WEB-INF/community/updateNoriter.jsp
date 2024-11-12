<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.textarea{
	border : none;
}
.textarea:focus{
	outline : none;
}
</style>
<body>
	<%@ include file="/menu.jsp"%>
<div class="container">
	<h1 style="padding: 50px;">수정하기</h1>
		<div class="container-fluid">
			<form action="updateNoriter.do" method="post"
				enctype="multipart/form-data">
				<input type="hidden" name="cm_no" value="${noriterList1.cm_no}">
				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text">제목</span>
					</div>
					<input type="text" class="form-control" name="cm_title"
						value="${noriterList1.cm_title}">
				</div>
				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text">작성자</span>
					</div>
					<input type="text" class="form-control innm" name="cm_writer"
						value="${userId}" readonly>
				</div>
				<br><br>
				<c:if test="${not empty noriterList1.cm_img}">
					<div class="input-group">
						<img src="${pageContext.request.contextPath}/resources/img/community/${noriterList1.cm_img}" alt="현재 이미지" >
						<input type="hidden" name="cm_content" value="${noriterList1.cm_content}">
						</div>
					<div>
						 <label><input type="checkbox" name="deleteOldImage" value="true"> 기존이미지 삭제</label>
					</div> 
				</c:if>
						<div>
						<textarea class="textarea" rows="20" cols="130" id="comment"name="cm_content">${noriterList1.cm_content }</textarea>
					</div>

				<label>새 이미지 업로드:</label> 
				<input type="file" name="uploadFiles" multiple>
				<div id="footer">
					<button type="submit" class="">수정하기</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>

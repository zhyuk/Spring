<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../view/header.jsp"%>
<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&callback=initMap" async defer></script>
<body>
	<div class="container">

		<%@ include file="../view/menu.jsp"%>
		<h1 style="padding: 50px;">글쓰기</h1>
		<div class="container-fluid">
			<form action="insertCommunity.do" method="post"
				enctype="multipart/form-data">
				<select name="communityID" class="form-control">
					<option selected value hidden>선택하세요</option>
					<option value="yooka">육아정보</option>
					<option value="noriter">놀이터</option>
					<option value="shopping">쇼핑정보</option>
				</select>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">제목</span>
					</div>
					<input type="text" class="form-control" name="cm_title"
						placeholder="제목을 입력하세요." required>
				</div>
				
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">작성자</span>
					</div>
					<input type="text" class="form-control innm" name="cm_writer"
						value="${userId}" readonly>
				</div>
				
				<div class="input-group mb-3">
					<textarea class="form-control" rows="20" cols="30" id="comment"
						name="cm_content"></textarea>
				</div>
				
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">사진첨부</span>
					</div>
					<input type="file" class="form-control innm" name="uploadFiles"
						multiple>
				</div>

				<div id="footer">
					<button id="conComplete" type="submit" class="btn btn-primary"
						onclick="return confirm('등록 하시겠습니까?')">새글 등록</button>
					<button id="conList" type="button" class="btn btn-primary"
						onclick="return confirm('정말 취소 하시겠습니까?')">취소</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>

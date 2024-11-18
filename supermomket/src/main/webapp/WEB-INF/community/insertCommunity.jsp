<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../view/header.jsp"%>

<style>
button {
	background-color: #FFD26E;
    border: none;
    padding: 5px;
    border-radius: 10px;
    margin-top: 50px;
}

input, select {
	height: 40px;
	border: 1px solid #FFD26E;
}

input, textarea{
	width: 70%;
}
select{
	width: 150px;
}
input {
	padding: 8px;
}
textarea{
	outline: none;
	border: 1px solid #FFD26E;
}
form{
	text-align: center;
}
</style>
<body>
	<div>

		<%@ include file="../view/menu.jsp"%>
		<main>
			<section>

					<form action="insertCommunity.do" method="post"
						enctype="multipart/form-data">
						<div>
							<select name="communityID" class="">
								<option selected value hidden>선택하세요</option>
								<option value="yooka">육아정보</option>
								<option value="noriter">놀이터</option>
								<option value="shopping">쇼핑정보</option>
							</select>
							<div>
								<input type="text" name="cm_title" placeholder="제목을 입력하세요."
									required>
							</div>

							<div>
								<input type="text" name="cm_writer" value="${userId}" readonly>
							</div>

							<div>
								<textarea rows="20" cols="30" id="comment" name="cm_content">
					</textarea>
							</div>

							<div>
								<input type="file" name="uploadFiles" multiple>
							</div>

							<div id="footer">
								<button id="conComplete" type="submit"
									onclick="return confirm('등록 하시겠습니까?')">새글 등록</button>
								<button id="conList" type="button"
									onclick="return confirm('정말 취소 하시겠습니까?')">취소</button>
							</div>
						</div>
					</form>
			</section>
		</main>
	</div>
</body>

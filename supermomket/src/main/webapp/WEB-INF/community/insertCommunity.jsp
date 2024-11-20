<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../view/header.jsp"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
button {
	background-color: #e6e6e6;
	border: none;
	padding: 5px;
	border-radius:5px;
	margin-top: 50px;
}

input, select {
	height: 40px;
	border: 1px solid #e6e6e6;
}

input, textarea {
	width: 80%;
}

.all{
	width: 80%;
	margin: 0 auto;
	border: 1px solid #e2e2e2;
    padding: 10px;
    border-radius: 13px;
    box-shadow: 2px 4px 8px rgba(0, 0, 0, 0.2);
	border: none;
}

select {
	border: 1px solid #999;
    padding: 5px;
    border-radius: 13px;
    box-shadow: 2px 4px 8px rgba(0, 0, 0, 0.2);
	margin: 20px 0;
	width: 90%;
	border-radius: 4px;
	display: flex;
	margin-left: 47px;
}

input {
	padding: 8px;
}

textarea {
	outline: none;
	border: 1px solid #e6e6e6;
	margin: 20px 0;
}

form {
	text-align: center;
}

h1{
	text-align: center;
	margin-bottom: 40px;
}

.msg textarea {
	min-width: 90%;
	max-width: 90%;
	min-height: 200px;
	max-height: 200px;
	box-shadow: 3px 3px 10px #e6e6e6;
	vertical-align: top;
	
}

.msg input[type="file"] {
	border: 1px solid #e2e2e2;
    padding: 10px;
    box-shadow: 2px 4px 8px rgba(0, 0, 0, 0.2);
	padding: 10px;
	width: 90%;
	height: 50px;
}

.title input[type="text"] {
	margin-top: 20px;
	margin-bottom: 20px;
	width: 90%;
}

.card-write input, textarea{
	padding: 10px;
	border: 1px solid #999;
	border-radius: 5px;
	box-shadow: 3px 3px 10px #e6e6e6;
}

@media screen and (max-width: 425px){
	select {
		margin-left: 16px;
	}
	main {
		margin-top: 20px;
	}
}
</style>
<body>
	<div>

		<%@ include file="../view/menu.jsp"%>
		<main>
			<section>
				<h1>글쓰기</h1>
				<form action="insertCommunity.do" method="post"
					enctype="multipart/form-data">
					<input type="hidden" name="cm_writer"value="${userId }">
					<div class="all">
						<select name="communityID" class="">
							<option selected value hidden>선택하세요</option>
							<option value="yooka">육아정보</option>
							<option value="noriter">놀이터</option>
							<option value="shopping">쇼핑정보</option>
						</select>
						<div class="card-write">
							<div class="title">
								<input type="text" placeholder="제목을 입력하세요." name="cm_title">
							</div>

							<div class="msg">
								<textarea name="cm_content"placeholder="내용을 입력하세요."></textarea>
								<input type="file" name="uploadFiles" multiple>
							</div>
						</div>
					</div>

					<div id="footer">
						<button id="conComplete" type="submit"
							onclick="return confirm('등록 하시겠습니까?')">새글 등록</button>
						<button id="conList" type="button"
							onclick="return confirm('정말 취소 하시겠습니까?')">취소</button>
					</div>
				</form>
				<br><br>
			</section>
		</main>
	</div>
</body>

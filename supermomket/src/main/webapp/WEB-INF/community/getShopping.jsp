<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../view/header.jsp"%>

<body>
	<style>
#wrap{
	margin-bottom: 50px;
}
#scrollTopBtn {
	position: fixed;
	bottom: 20px;
	left: 20px;
	width: 50px;
	height: 50px;
	background-color: rgba(255,255,255,0.5);
	color: black;
	border-radius: 50%;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	display: none;
	justify-content: center;
	align-items: center;
	text-align: center;
	font-size: 16px;
	cursor: pointer;
	transition: opacity 0.3s, transform 0.3s;
}

#scrollTopBtn:hover {
	opacity: 0.8;
	transform: scale(1.1);
}

#scrollTopBtn:active {
	transform: scale(0.9);
}

body {
	font-size: 14px;
}

button {
	background-color: #FFD26E;
	border: none;
	padding: 5px;
	border-radius: 10px;
}

#imgBox {
	display: none;
	position: absolute;
	top: 0;
	left: 0;
	height: 100vh !important;
	background-color: rgba(0, 0, 0, 0.5);
	z-index: 9999999;
}

#imgContentBox {
	width: 600px;
	max-height: 550px;
	overflow: auto;
	position: absolute;
	top: 30%;
	left: 30%;
	border-radius: 5px;
	z-index: 9999999;
}

#imgBoxTitleBar {
	border-bottom: 1px solid #777;
	border-radius: 5px 5px 0 0;
	background-color: #ddd;
	width: 100%;
	padding: 10px;
	text-align: right;
	font-size: 20px;
	font-weight: bolder;
}

#imgBoxImg {
	width: 100%;
	border-radius: 0 0 5px 5px;
}

#closeX {
	padding: 5px 20px;
	border-radius: 5px;
	border: 1px solid #777;
	background-color: red;
	color: #fff;
}

#closeX:hover {
	background-color: #777;
	cursor: pointer;
}

h1 {
	padding-top: 30px;
	margin-bottom: 10px;
	text-align: left;
}

#replyForm {
	display: none;
}

.form1 {
	text-align: center;
}

.form1 input[type="text"] {
	/* 	border: none; */
	outline: none;
	height: 50px;
	font-size: 18px;
}

.second .vie input {
	width: 6ch;
}

.second .up input, .second .down input {
	width: 4ch;
}

.text-muted {
	display: block;
}

.reply2 {
	margin-left: 50px;
}

.repTogShopping {
	display: none;
}

.upDown {
	width: 100%;
	display: inline-flex;
}

.likeUp>p {
	text-align: right;
	padding-right: 18px;
	color: blue;
}

.hateDown>p {
	text-align: left;
	padding-left: 18px;
	color: red;
}

.likeUp button {
	width: 100%;
	background-position: right;
	background-color: #fff;
}

.hateDown button {
	width: 100%;
	background-position: left;
	background-color: #fff;
}

.likeUp, .hateDown {
	width: 50%;
	padding: 15px;
}

.cotent12 {
	height: 100%;
	width: 1200px;
	text-align: left;
	margin: 0 auto;
	font-family: 'Quicksand', 'Noto Sans KR', sans-serif;
}

#commentUpDel {
	display: flex;
	align-items: center;
	flex-wrap: nowrap;
	flex-direction: row-reverse;
	align-items: normal;
}

#footer button {
	padding: 8px;
}

.form-control:disabled, .form-control[readonly]{
	background-color: white;
	border: none;
}

.form-control[readonly]:focus{
	border:none;
}
#footer-pc{
	width: 1200px;
    margin: 0 auto;
	text-align: right;
}

#commentReplyUpDel {
	display: flex;
	align-items: center;
	flex-wrap: nowrap;
	flex-direction: row-reverse;
	align-items: normal;
}

#replyShopping {
	padding: 8px;
	float: right;
}

#deleteCommentShopping, #updateCommentShopping, #deleteReplyShopping,
	#updateReplyShopping {
	width: 50px;
	margin: 0 3px;
}

#maincom {
	width: 1200px;
	margin: 0 auto;
	border: 1px solid #e0e0e0;
	padding: 10px;
	border-radius: 13px;
	box-shadow: 2px 4px 8px rgba(0, 0, 0, 0.2);
}

#commentinput {
	width: 1200px;
	margin: 0 auto;
	border-radius: 13px;
	box-shadow: 2px 4px 8px rgba(0, 0, 0, 0.2);
	margin-top: 10px;
}

li::marker {
	content: none;
}

ul {
	list-style-type: none;
	padding-left: 0;
}

#replyForm {
	text-align: right;
}

.form-group {
	margin-bottom: 4px;
}

.detail-box {
	font-size: 18px;
	width: 1200px;
	margin: 0 auto; 
	flex-direction: column;
	padding: 10px 15px;
	border: 1px solid #ddd;
	border-radius: 8px;
	background-color: #f9f9f9;
	display: flex;
}

.category-title {
	display: flex;
	align-items: center;
	gap: 5px;
	margin-bottom: 3px;
}

.detail-box .category {
	font-weight: bold;
	color: #007bff;
	margin-bottom: 5px;
}

.detail-box .title {
	font-size: 20px;
	font-weight: bold;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	max-width: calc(100% - 50px);
}

.detail-box .info12 {
	display: flex;
	flex-wrap: wrap;
	gap: 10px;
	color: #666;
}

.detail-box .info12 span {
	white-space: nowrap;
}
#inputbtn{
	background-color: #FFD26E;
    padding: 8px;
    border-radius: 10px;
}

.mt-0, .writer{
	font-weight: 900; 
}

#commentinput button{
	float: right;
}

.cotent12 {
	font-size: 18px;
}

#footer-m,#update-m, #conWrite-m, #conDelShopping-m, #shoppingList-m {
    display: none; 
  }

#footer-pc {
    display: block; 
  }

@media screen and (max-width: 425px) {
	#footer-m,#update-m, #conWrite-m, #conDelShopping-m, #shoppingList-m {
    	display: block;
  	}

 	 #footer-pc {
   	 	display: none;
  	}
	.detail-box{
		font-size: 14px;
		text-align: left;
		width: 100%;
	}
	.form1 div input {
		width: 30%;
	}
	.form1 div div {
		display: inline;
	}
	.form1 {
		text-align: center;
	}
	.m-div {
		margin: 0 5px;
	}
	#maincom {
		border: 1px solid #e0e0e0;
		padding: 10px;
		border-radius: 13px;
		box-shadow: 2px 4px 8px rgba(0, 0, 0, 0.2);
	}
	#commentinput {
		width: 100%;
		margin: 0 auto;
		border-radius: 13px;
		box-shadow: 2px 4px 8px rgba(0, 0, 0, 0.2);
		margin-top: 10px;
	}
	.cotent12 {
		width: 90%;
	}
	li::marker {
		content: none;
	}
	ul {
		list-style-type: none;
		padding-left: 0;
	}
	#deleteReplyShopping, #updateReplyShopping {
		font-size: 14px;
	}
	#footer-m {
		width: 100%;
	}
	#update-m, #conWrite-m, #conDelShopping-m, #shoppingList-m {
		display: none;
	}
	#update-m {
		position: fixed;
		bottom: 39%;
		left: 5%;
		width: 50px;
		height: 50px;
		background-color: #FFD26E;
		color: black;
		border-radius: 50%;
		box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
		justify-content: center;
		align-items: center;
		text-align: center;
		font-size: 16px;
		cursor: pointer;
		z-index: 1;
	}
	#conWrite-m {
		position: fixed;
		bottom: 32%;
		left: 5%;
		width: 50px;
		height: 50px;
		background-color: #FFD26E;
		color: black;
		border-radius: 50%;
		box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
		justify-content: center;
		align-items: center;
		text-align: center;
		font-size: 16px;
		cursor: pointer;
		transition: opacity 0.5s ease, transform 0.5s ease;
		z-index: 1;
	}
	#conDelShopping-m {
		position: fixed;
		bottom: 25%;
		left: 5%;
		width: 50px;
		height: 50px;
		background-color: #FFD26E;
		color: black;
		border-radius: 50%;
		box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
		justify-content: center;
		align-items: center;
		text-align: center;
		font-size: 16px;
		cursor: pointer;
		transition: opacity 0.5s ease, transform 0.5s ease;
		z-index: 1;
	}
	#shoppingList-m {
		position: fixed;
		bottom: 18%;
		left: 5%;
		width: 50px;
		height: 50px;
		background-color: #FFD26E;
		color: black;
		border-radius: 50%;
		box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
		justify-content: center;
		align-items: center;
		text-align: center;
		font-size: 16px;
		cursor: pointer;
		transition: opacity 0.5s ease, transform 0.5s ease;
		z-index: 1;
	}
	#footer-m {
		position: fixed;
		bottom: 10%;
		left: 5%;
		width: 50px;
		height: 50px;
		background-color: rgba(0, 0, 0, 0.5);
		color: white;
		border-radius: 50%;
		box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
		justify-content: center;
		align-items: center;
		text-align: center;
		padding-top: 18px;
		font-size: 9px;
		cursor: pointer;
		transition: height 0.5s ease;
		z-index: 1;
}
}
</style>
	<%@ include file="../view/menu.jsp"%>
	<div class="m-div">
		<form name="fm" action="/updateShopping.do" method="get" class="form1"
			enctype="multipart/form-data">
			<input type="hidden" name="cm_no" value="${shopping.cm_no}">
			<input type="hidden" name="cm_writer" value="${shopping.cm_writer}">
			
			
			<div class="detail-box">
				<div class="category-title">
					<div class="category">[쇼핑]</div>
					<div class="title">${shopping.cm_title}</div>
				</div>
				<div class="info12">
					<span class="writer">${shopping.cm_writer}</span> 
					<span class="vie">조회: ${shopping.cm_view}</span>
					<span class="up">추천: ${likeResult}</span>
					<span class="likes">비추천: ${hateResult}</span> 
					<span class="date">${shopping.cm_date}</span>
				</div>
			</div>
			<br> <br>
			<div style="width: 100%; display: inline-block;" class="imgDiv">
				<c:choose>
					<c:when test="${not empty shopping.cm_img}">
						<c:forEach var="img" items="${fn:split(shopping.cm_img, ',')}">
							<div style="text-align: center;">
								<img style="max-width: 70%;"
									src="${pageContext.request.contextPath}/resources/img/community/${img.trim()}">
							</div>
							<br>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<p></p>
					</c:otherwise>
				</c:choose>
			</div>	
			<p class="cotent12">${shopping.cm_content}</p>
			<br> <br>
			<ul class="upDown">
				<li class="likeUp"><button type="button" id="likebtn"
						name="likebtn"
						style="background-image: url('${pageContext.request.contextPath}/resources/img/community/like.png'); background-size: contain; background-repeat: no-repeat;height: 50px; border: none;"
						onclick="UpDownStsShopping(${shopping.cm_no}, 1)"></button>
					<p>${likeResult}</p></li>


				<li class="hateDown"><button type="button" id="hatebtn"
						name="hatebtn"
						style="background-image: url('${pageContext.request.contextPath}/resources/img/community/hate.png'); background-size: contain; background-repeat: no-repeat; height: 50px; border: none;"
						onclick="UpDownStsShopping(${shopping.cm_no}, 2)"></button>
					<p>${hateResult}</p></li>
			</ul>
			<br> <br>
			<div id="footer-m"onclick="submenu()">ㅇㅇㅇ</div>
				<c:if test="${sessionScope.userId == shopping.cm_writer }">
					<button type="submit"id="update-m" >수정</button>
					<button id="conWrite-m" type="button">쓰기</button>
					<button id="conDelShopping-m" type="button">삭제</button>
				</c:if>
				<button id="shoppingList-m" type="button">목록</button>
				
			<div id="footer-pc">
			<c:if test="${sessionScope.userId == shopping.cm_writer }">
				<button type="submit" id="update" >수정</button>
				<button id="conWrite" type="button" >쓰기</button>
				<button id="conDelShopping" type="button">삭제</button>
			</c:if>
			<button id="yookaList" type="button">목록</button>
			</div>
		</form>
		<form name="hideFrm" style="display: none;">
			<input type="hidden" name="nowPage" value="${nowPage}"> <input
				type="hidden" name="searchKeyword" value="${searchKeyword}">
			<input type="hidden" name="searchCondition"
				value="${searchCondition}">
		</form>

		<!-- 댓글 입력 폼 -->
		<c:if test="${sessionScope.userId != NULL }">
			<div class="card mb-4" id="commentinput">
				<div class="card-body">
					<form id="commentForm" name="commentForm"
						action="/insertCommentShopping.do">
						<div class="form-group">
							<textarea class="form-control" id="comment" rows="3"
								placeholder="댓글을 입력하세요" name="co_content" required></textarea>
						</div>
						<input type="hidden" name="cm_no" value="${shopping.cm_no}">
						<button type="submit" >등록</button>
					</form>
				</div>
			</div>
		</c:if>

		<!-- 댓글 목록 -->
		<c:forEach items="${commentShopping}" var="commentShopping">
			<c:if test="${commentShopping.co_no2 == null}">
				<div id="commentList">
					<div class="media mb-4">
						<div class="" id="maincom">
							<span class="mt-0">${commentShopping.co_writer}</span>
							<button id="replyShopping" type="button" class=""
								onclick="replyShoppingbtn(${commentShopping.co_no})">답글</button>
							<button id="repToggleShopping" type="button"
								onclick="replyToggleShopping(${commentShopping.co_no})">답글보기</button>

							<p class="text-muted">
								<c:choose>
									<c:when test="${not empty commentShopping.co_date2}">
						                수정일: ${commentShopping.co_date2}
						            </c:when>
									<c:otherwise>
						                등록일: ${commentShopping.co_date}
						            </c:otherwise>
								</c:choose>
							</p>

							<div style="text-align: right;">
								<form id="commentUpDel" name="commentUpDel"
									action="/updateCommentShopping.do">

									<input id="commentCoNo" type="hidden" name="co_no"
										value="${commentShopping.co_no}"> <input id="commentCmNo"
										type="hidden" name="cm_no" value="${commentShopping.cm_no}">
									<input id="commentCoWriter" type="hidden" name="co_writer"
										value="${commentShopping.co_writer}">

									<c:if test="${sessionScope.userId == commentShopping.co_writer}">
										<button id="deleteCommentShopping" type="button"
											onclick="delCommentShopping(${commentShopping.cm_no},${commentShopping.co_no},'${commentShopping.co_writer}','${commentShopping.co_content}')">삭제</button>
										<button id="updateCommentShopping" type="submit">수정</button>
									</c:if>


									<c:choose>
										<c:when
											test="${sessionScope.userId == commentShopping.co_writer}">
											<input id="Comment" type="text" class="form-control innm"
												name="co_content" value="${commentShopping.co_content}">
										</c:when>
										<c:otherwise>
											<input id="Comment" type="text" class="form-control innm"
												name="co_content" value="${commentShopping.co_content}"
												readonly>
										</c:otherwise>
									</c:choose>
								</form>
							</div>
							<!-- 대댓글 입력 폼 (초기에는 숨김) -->
							<div class="reply-form mt-2">
								<form class="replyFormShopping${commentShopping.co_no} replyFormShopping"
									action="/insertReplyShopping.do" id="replyForm">
									<input type="hidden" name="co_no2"
										value="${commentShopping.co_no}" />
									<div class="form-group">
										<textarea class="form-control" rows="2"
											placeholder="대댓글을 입력하세요" name="co_content" required></textarea>
									</div>
									<input type="hidden" name="cm_no" value="${shopping.cm_no}">
									<button type="submit" 
										id="inputbtn">등록</button>
								</form>
							</div>

							<!-- 대댓글 목록 -->
							<c:forEach items="${commentShopping1}" var="replyShopping">
								<c:if test="${replyShopping.co_no2 == commentShopping.co_no }">
									<div
										class="media mt-3 repTogShopping${commentShopping.co_no} repTogShopping">
										<div class="media-body reply2">
											<span class="mt-0">${replyShopping.co_writer}</span>
											<p class="text-muted">
												<c:choose>
													<c:when test="${not empty replyShopping.co_date2}">
									                수정일: ${replyShopping.co_date2}
									            </c:when>
													<c:otherwise>
									                등록일: ${replyShopping.co_date}
									            </c:otherwise>
												</c:choose>
											</p>

											<div style="text-align: right;">
												<form id="commentReplyUpDel" name="commentReplyUpDel"
													action="/updateReplyShopping.do">

													<input id="commentReplyCoNo" type="hidden" name="co_no"
														value="${replyShopping.co_no}"> <input
														id="commentReplyCmNo" type="hidden" name="cm_no"
														value="${replyShopping.cm_no}"> <input
														id="commentReplyCoWriter" type="hidden" name="co_writer"
														value="${replyShopping.co_writer}"> <input
														id="commentReplyCoNo2" type="hidden" name="co_no2"
														value="${replyShopping.co_no2}">
													<c:if test="${sessionScope.userId == replyShopping.co_writer}">
														<button id="deleteReplyShopping" type="button" class=""
															onclick="delReplyShopping(${replyShopping.cm_no},${replyShopping.co_no},'${replyShopping.co_writer}','${replyShopping.co_content}')">삭제</button>
														<button id="updateReplyShopping" type="submit" class="">수정</button>
													</c:if>
													<c:choose>
														<c:when
															test="${sessionScope.userId == replyShopping.co_writer}">
															<input id="CommentReply" type="text"
																class="form-control innm" name="co_content"
																value="${replyShopping.co_content}">
														</c:when>
														<c:otherwise>
															<input id="CommentReply" type="text"
																class="form-control innm" name="co_content"
																value="${replyShopping.co_content}" readonly>
														</c:otherwise>
													</c:choose>
												</form>
											</div>
										</div>
									</div>
								</c:if>
							</c:forEach>
						</div>

					</div>
				</div>
			</c:if>
		</c:forEach>
	</div>
	<div id="scrollTopBtn" onclick="scrollToTop()">▲TOP</div>
	<script>
	window.addEventListener("scroll", function () {
	  const scrollTopBtn = document.getElementById("scrollTopBtn");
	  if (window.scrollY > 300) { 
	    scrollTopBtn.style.display = "flex";
	  } else {
	    scrollTopBtn.style.display = "none";
	  }
	});

	function scrollToTop() {
	  window.scrollTo({
	    top: 0,
	    behavior: "smooth", 
	  });
	}
	
	document.querySelector('#comment').addEventListener('keydown', function(event) {
	    if (event.key === 'Enter' && !event.shiftKey) {
	        event.preventDefault(); 
	        submitComment();
	    } else {
	    	
	    }
	});
	
	function submenu(){
		$("#update-m").toggle();
		$("#conWrite-m").toggle();
		$("#conDelShopping-m").toggle();
		$("#shoppingList-m").toggle();
	}
	</script>
</body>
</html>

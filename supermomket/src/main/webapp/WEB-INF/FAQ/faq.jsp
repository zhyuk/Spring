<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../admin/header.jsp"%>

<%@ include file="../admin/menu.jsp"%>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/faqadmin.css">
		<script src="${pageContext.request.contextPath}/resources/js/faqjs.js"></script>
<main style="margin-top: 50px; justify-items: center;">
	<form name="fm" action="updatefaq.do" method="POST">
		<input type="hidden" name="faq_no" value="${fvo.faq_no}">
		<!-- 여기서 textarea 값들을 hidden input에 담기 위한 숨겨진 필드를 추가 -->
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text">자주묻는 질문</span>
			</div>
			<input type="text" class="form-control innm" name="faq_q"
				value="${fvo.faq_q}">
		</div>
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text">답변</span>
			</div>
			<input type="text" class="form-control innm" name="faq_a"
				value="${fvo.faq_a}">
		</div>

		<div id="footer">
			<button type="submit" class="btn btn-primary">수정완료</button>
			<button id="faq_conDel" type="button" class="btn btn-primary">글삭제</button>
			<button id="faq_conList" type="button" class="btn btn-primary">글목록</button>
		</div>
	</form>
</main>

<!-- 모달 HTML 구조 -->
<div id="confirmModal" class="modal">
  <div class="modal-content">
    <span class="close">&times;</span>
    <h2>정말로 삭제하시겠습니까?</h2>
    <button id="confirmDeleteBtn" class="modal-btn">확인</button>
    <button id="cancelDeleteBtn" class="modal-btn">취소</button>
  </div>
</div>


</div>
<%@ include file="../../footer.jsp"%>
</body>
</html>
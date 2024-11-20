<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../admin/header.jsp"%>

<%@ include file="../admin/menu.jsp"%>
		<script src="${pageContext.request.contextPath}/resources/js/faqjs.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/faq_detail.css">

<body>		
<main>
<section>
<div id="faq_maindiv">
<h1>FAQ 글정보</h1>
	<form name="fm" action="updatefaq.do" method="POST">
		<input type="hidden" name="faq_no" value="${fvo.faq_no}">
	<!-- select 태그의 name을 faq_class로 수정하여 서버에서 해당 값을 받을 수 있도록 함 -->
      	<div class="faq_qadiv">
				
							 <fieldset>
							 <legend class="faq_q">자주 묻는 질문</legend>
							<input type="text" class="form-control faq_qinput"  placeholder="자주 묻는 질문" name="faq_q" value="${fvo.faq_q}"></td>
							 </fieldset>
							<fieldset>
							 <legend class="faq_a">자주 묻는 답변</legend>
							<textarea maxlength="2048"class="form-control faq_ainput" name="faq_a">${fvo.faq_a}</textarea>
							</fieldset>
	</div>
		<div id="footer">
			<button type="submit" class="btn btn-primary">수정완료</button>
			<button id="faq_conDel" type="button" class="btn btn-primary">글삭제</button>
			<button id="faq_conList" onclick="listbtn()" type="button" class="btn btn-primary">글목록</button>
		</div>
	</form>
</div>
</section>
</main>

<!-- 모달 HTML 구조 -->
<div id="confirmModal" class="modal" style="display: none">
  <div class="modal-content">
    <span class="close">&times;</span>
    <h2>정말로 삭제하시겠습니까?</h2>
    <button id="confirmDeleteBtn" class="modal-btn">확인</button>
    <button id="cancelDeleteBtn" class="modal-btn">취소</button>
  </div>
</div>

<script>

// FAQ 어드민 삭제 
document.addEventListener('DOMContentLoaded', function() {
    const deleteButton = document.getElementById('faq_conDel'); // 삭제 버튼
    const modal = document.getElementById('confirmModal'); // 모달 요소
    const closeModal = document.querySelector('.modal .close'); // 모달 닫기 버튼
    const confirmDelete = document.getElementById('confirmDeleteBtn'); // 삭제 확인 버튼
    const cancelDelete = document.getElementById('cancelDeleteBtn'); // 삭제 취소 버튼

    // faq_conDel 버튼 클릭 시 모달 열기
    deleteButton.addEventListener('click', function() {
        modal.style.display = 'flex';
    });

    // 모달 닫기 버튼 클릭 시 모달 닫기
    closeModal.addEventListener('click', function() {
        modal.style.display = 'none';
    });

    // 삭제 취소 버튼 클릭 시 모달 닫기
    cancelDelete.addEventListener('click', function() {
        modal.style.display = 'none';
    });

    // 삭제 확인 버튼 클릭 시 폼 제출
    confirmDelete.addEventListener('click', function() {
        document.fm.action = "deletefaq.do";
        document.fm.submit();
    });

});


</script>


</div>
</body>
</html>
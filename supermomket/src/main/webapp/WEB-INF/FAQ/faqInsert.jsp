<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../admin/header.jsp" %>

	<%@ include file="../admin/menu.jsp" %>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/faqinsert.css">
		<script src="${pageContext.request.contextPath}/resources/js/faqjs.js"></script>

<main>
<section class="faqinsert_mainsection">

<div class="faqinsert_maindiv">
<h1>FAQ 글작성</h1>
<form name="fm" action="insertfaq.do"  method="POST">
	<!-- select 태그의 name을 faq_class로 수정하여 서버에서 해당 값을 받을 수 있도록 함 -->
	<fieldset class="selectfiedset">
	<legend>분류</legend>
		<select class="form-control faqinsert" name="faq_class">
			<!-- JSP 내에서 선택된 값 유지 -->
			<option value="결제" ${fvo.faq_class == 'payment' ? 'selected' : ''}>결제</option>
			<option value="거래" ${fvo.faq_class == 'transaction' ? 'selected' : ''}>거래</option>
			<option value="이용방법" ${fvo.faq_class == 'utilization' ? 'selected' : ''}>이용방법</option>
		</select>
	</fieldset>
	<fieldset>
		<legend class="faq_q">질문</legend>
		<input type="text" class="form-control faq_qinput"  placeholder="자주 묻는 질문" name="faq_q" value="${fvo.faq_q}">
	</fieldset>
      	<fieldset>
			<legend class="faq_a">답변</legend>
			<textarea maxlength="2048"class="form-control faq_ainput" name="faq_a">${fvo.faq_a}</textarea>
      	</fieldset>

	<div id="footer">
		<button type="submit" class="btn btn-primary">작성 완료</button>
	</div>
</form>
</div>
</section>
</main>


</body>
</html>
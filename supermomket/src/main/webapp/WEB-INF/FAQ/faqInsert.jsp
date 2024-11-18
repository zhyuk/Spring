<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../admin/header.jsp" %>

	<%@ include file="../admin/menu.jsp" %>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/faqadmin.css">
		<script src="${pageContext.request.contextPath}/resources/js/faqjs.js"></script>
<main style="margin-top: 50px;justify-items: center;">
<form name="fm" action="insertfaq.do"  method="POST">
	<!-- select 태그의 name을 faq_class로 수정하여 서버에서 해당 값을 받을 수 있도록 함 -->
		<select class="form-control innm" name="faq_class">
			<!-- JSP 내에서 선택된 값 유지 -->
			<option value="결제" ${fvo.faq_class == 'payment' ? 'selected' : ''}>결제</option>
			<option value="거래" ${fvo.faq_class == 'transaction' ? 'selected' : ''}>거래</option>
			<option value="이용방법" ${fvo.faq_class == 'utilization' ? 'selected' : ''}>이용방법</option>
		</select>
	</div>
	<div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">자주묻는 질문</span>
      </div>
		<input type="text" class="form-control innm" name="faq_q" value="${fvo.faq_q}"> 
	</div>
	<div class="input-group mb-3">
		<div class="input-group-prepend">
			<span class="input-group-text">답변</span>
		</div>
		<input type="text" class="form-control innm" name="faq_a" value="${fvo.faq_a}"> 
	</div>

	<div id="footer">
		<button type="submit" class="btn btn-primary">작성 완료</button>
	</div>
</form>
</main>


</div>
</body>
</html>
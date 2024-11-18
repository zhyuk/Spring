<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../admin/header.jsp" %>

	<%@ include file="../admin/menu.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/faqadmin.css">
<script src="${pageContext.request.contextPath}/resources/js/faqjs.js"></script>


<main>
<section id="admin">
<div class="faqAdminmaindiv">
<div class="faqAdminsearchdiv">
<!--  <form class="form-inline" action="getFaqAdminList.do" method="post"> -->
<!--   	<select class="form-control" id="sel1" name="searchCondition"> -->
<%--         <c:forEach items="${conditionMap}" var="option"> --%>
<%-- 	        <option value="${option.value}">${option.key}</option> --%>
<%--         </c:forEach>         --%>
<!--     </select> -->
<!--     <input class="form-control mr-sm-2" type="text" name="searchKeyword" placeholder="검색어를 입력하세요."> -->
<!--     <button class="btn btn-success" type="submit">검색</button> -->
<!--   </form> -->
</div>


    <table class="faqadminList_table">
    <thead>
        <tr class="tradminCenter">
            <th class="thadminCenter">글번호</th>
            <th class="thadminCenter">분류</th>
            <th class="thadminCenter">질문</th>
            <th class="thadminCenter">답변</th>
            <th class="thadminCenter">수정</th>
        </tr>
    </thead>
    <tbody>
    <c:forEach items="${fvo}" var="fvo">
	<tr class="tradminCenter">
	  <td class="tdadminCenter">${fvo.faq_no}</td>
	  <td class="tdadminCenter">${fvo.faq_class}</td>
	  <td class="tdadminCenter">${fvo.faq_q}</td>
	  <td class="tdadminCenter faq-a">${fvo.faq_a}</td>
	  <td class="tdadminCenter"><button class="faqadminbtn" onclick="faqselTr(${fvo.faq_no})" >글수정</button></td>
	</tr>
</c:forEach>
    </tbody>
    </table>
     <button id="faqadminbtn" class="faqadminbtn" onclick="insertbtn()">글쓰기</button>
     <ul class="adminpagination">
		<c:if test="${paging.nowPage > 1 && paging.lastBtn > paging.viewBtnCnt}">
			<li class="adminpage-item"><a class="adminpage-link" href="getFaqAdminList.do?nowPage=${paging.nowPage-1}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}">이전</a></li>
		</c:if>
		<c:forEach var="i" begin="${paging.startBtn}" end="${paging.endBtn}" step="1">
			<c:choose>
				<c:when test="${paging.nowPage==i}"><li class="adminpage-item active"><a class="adminpage-link" >${i}</a></li></c:when>
				<c:otherwise><li class="adminpage-item"><a class="adminpage-link" href="getFaqAdminList.do?nowPage=${i}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}">${i}</a></li></c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.nowPage < paging.lastBtn  && paging.lastBtn > paging.viewBtnCnt}">
			<li class="adminpage-item"><a class="adminpage-link" href="getFaqAdminList.do?nowPage=${paging.nowPage+1}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}">이후</a></li>
		</c:if>
	</ul>
</div>
</section>
</main>

</div>
</body>
</html>
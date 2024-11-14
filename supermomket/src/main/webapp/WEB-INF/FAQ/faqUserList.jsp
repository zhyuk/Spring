<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../view/header.jsp" %>
	<script src="${pageContext.request.contextPath}/resources/js/faqjs.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/faqList.css">
<body>
	<%@ include file="../view/menu.jsp" %>
<main>
<div id="faq_btndiv" class="cartu_btn">
<form name="frm" method="post" style="display:none" >
<input type="hidden" name="faq_class" value="">
</form>
    <button onclick="faqbtn(1)" class="">결제</button>
    <button onclick="faqbtn(2)" class="">거래</button>
    <button onclick="faqbtn(3)" class="">이용방법</button>
    <button onclick="faqbtn(4)" class="">전체보기</button>
</div>
<div class="cartu_maindiv">
 <form class="form-inline" action="getFaqUserList.do" method="post">
 <div class="cartu_selectdiv">
  	<select class="form-control" id="sel1" name="searchCondition" style="display:inline-block!important;margin-right:10px;">
        <c:forEach items="${conditionMap}" var="option">
	        <option value="${option.value}">${option.key}</option>
        </c:forEach>
    </select>
    <input class="form-control mr-sm-2" type="text" name="searchKeyword" placeholder="검색어를 입력하세요.">
    <button class="btn btn-success" type="submit">검색</button>
 </div>
  </form>


<div class="cartu_tablediv">
    <table class="faquserList_table">
    <thead>
        <tr>
            <th class="cartu_thtop">분류</th>
            <th class="cartu_thmiddle">질문</th>
        </tr>
    </thead>
    <tbody>
  <c:forEach items="${fvo}" var="fvo">
    <tr class="faq-row">
        <td class="cartu_tdtop clickable">${fvo.faq_class}</td>
        <td class="cartu_tdmiddle clickable" data-answer="${fvo.faq_a}">${fvo.faq_q}</td>
    </tr>
    <!-- 답변 행 (처음에는 숨겨진 상태) -->
    <tr class="answer-row" style="display: none;">
        <th class="cartu_thbttom">답변</th>
        <td colspan="2" class="cartu_tdbttom answer-content">
            ${fvo.faq_a}
        </td>
    </tr>
</c:forEach>

    </tbody>
    </table>
</div>
    
    
    
    	<ul class="cart_pagebtn">
		<c:if test="${paging.nowPage > 1 && paging.lastBtn > paging.viewBtnCnt}">
			<li class="cartpage-item"><a class="cartpage-link" href="${searchURI }?nowPage=${paging.nowPage-1}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}">이전</a></li>
		</c:if>
		<c:forEach var="i" begin="${paging.startBtn}" end="${paging.endBtn}" step="1">
			<c:choose>
				<c:when test="${paging.nowPage==i}"><li class="cartpage-link active"><a class="cartpage-link" >${i}</a></li></c:when>
				<c:otherwise><li class="cartpage-item"><a class="cartpage-link" href="${searchURI }?nowPage=${i}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}">${i}</a></li></c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.nowPage < paging.lastBtn  && paging.lastBtn > paging.viewBtnCnt}">
			<li class="cartpage-item"><a class="page-link" href="${searchURI }?nowPage=${paging.nowPage+1}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}">이후</a></li>
		</c:if>
	</ul>
    
</div>
</main>

</div>
<%@ include file="../view/footer.jsp" %>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../admin/header.jsp"%>

<%@ include file="../admin/menu.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/cartadminlist.css">
<script
	src="${pageContext.request.contextPath}/resources/js/cartadmin.js"></script>
<body>


	<main>
		<section class="mainsection">
			<div class="maindiv">
				<div class="admin-header">
					<h1>결제 회원조회</h1>
				</div>
				<div class="adminserch">
					<form class="form-inline" action="adminorderList.do" method="post">
						<select class="form-control line" id="sel1" name="searchCondition">
							<c:forEach items="${conditionMap}" var="option">
								<option value="${option.value}">${option.key}</option>
							</c:forEach>
						</select> <input class="form-control line" type="text" name="searchKeyword"
							placeholder="검색어를 입력하세요.">
						<button class="btn btn-success line" type="submit">검색</button>
					</form>
				</div>

				<table class="paylist">
					<tr class="paythtr">
						<th class="payth">주문 ID</th>
						<th class="payth">수령인</th>
						<th class="payth">수령인 연락처</th>
						<th class="payth">주문 총 액수</th>
						<th class="payth">결제 상태</th>
						<th class="payth">결제 일자</th>
						<th class="payth">취소 일자</th>
						<th class="payth">결제 방식</th>
						<th class="payth">배송지</th>
					</tr>

					<c:forEach items="${adminlist}" var="adminlist">
						<tr class="paytdtr">
							<td class="paytd">${adminlist.u_id}</td>
							<td class="paytd">${adminlist.o_receiver}</td>
							<td class="paytd">${adminlist.o_receiver_contact}</td>
							<td class="paytd">${adminlist.o_total_price}</td>
							<td class="paytd">${adminlist.o_cancel_yn}</td>
							<td class="paytd">${adminlist.o_input_date}</td>
							<td class="paytd">${adminlist.o_update_date}</td>
							<td class="paytd">${adminlist.o_pay_type}</td>
							<td class="paytd">${adminlist.o_address}</td>
						</tr>
					</c:forEach>
				</table>

				<div class="pageingdiv">
					<ul class="paylisypageing">
						<c:if
							test="${paging.nowPage > 1 && paging.lastBtn > paging.viewBtnCnt}">
							<li class="paylisypageing-item"><a class="adminpage-link"
								href="adminorderList.do?nowPage=${paging.nowPage-1}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}">이전</a></li>
						</c:if>
						<c:forEach var="i" begin="${paging.startBtn}"
							end="${paging.endBtn}" step="1">
							<c:choose>
								<c:when test="${paging.nowPage==i}">
									<li class="adminpage-item active"><a
										class="adminpage-link">${i}</a></li>
								</c:when>
								<c:otherwise>
									<li class="adminpage-item"><a class="adminpage-link"
										href="adminorderList.do?nowPage=${i}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}">${i}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if
							test="${paging.nowPage < paging.lastBtn  && paging.lastBtn > paging.viewBtnCnt}">
							<li class="adminpage"><a class="adminpage-link"
								href="adminorderList.do?nowPage=${paging.nowPage+1}&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}">이후</a></li>
						</c:if>
					</ul>
				</div>




			</div>
		</section>
	</main>


</body>
</html>
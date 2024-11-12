<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cart.css">

<body>
	<%@ include file="../../menu.jsp"%>
<script src="${pageContext.request.contextPath}/resources/js/cartjs.js"></script>
<main style="margin-top: 50px;justify-items: center;">
	<div class="cart-container">
		<h2>장바구니</h2>
		<form name="cartList">
			<input 	type="hidden" name="u_id" value="${userId}">
			<input 	type="hidden" name="c_payment" value="${c_payment}">
			
			<table class="cart-table">
				<thead>
					<tr class="cartth">
						<th><input id="cart_allChk" type="checkbox">전체선택</th>
						<th>번호
						<th>상품이미지</th>
						<th>상품명</th>
						<th class="cart_numberinput">수량</th>
						<th>상품금액</th>
						<th>합계금액</th>
					</tr>
				</thead>
				<tbody>
					<c:set var="counter" value="1" scope="page" />
					<!-- 초기 값 설정 -->
					<c:forEach items="${cartList}" var="cvo">
						<tr name="cart_List">
							<th><input id="cart_chkVal" name="c_noarr" type="checkbox" value="${cvo.c_no }">
							<input type="hidden" name="p_no" value="${cvo.p_no}"></th>
							<td class="tdCenter">${counter}</td>
							<!-- 현재 숫자 표시 -->
							<c:set var="counter" value="${counter + 1}" />
							<!-- counter 값 증가 -->
							<td class="tdCenter cartimg"  onclick="cart_imglink(${cvo.p_no})"><img style="width: 100px" src="${pageContext.request.contextPath}/resources/img/product/${cvo.p_img}" alt="${cvo.p_img}"></td>
							<td class="tdCenter">${cvo.p_name}</td>
							<td class="tdCenter"><input type="number" name="p_count" value="${cvo.p_count}"
							data-price="${cvo.p_price}" data-cno="${cvo.c_no}" data-pno="${cvo.p_no}" data-uid="${cvo.u_id}"
							data-payment="${cvo.c_payment}" min="1" max="50" oninput="validateNumberInput(this)"></td>
							<td class="tdCenter"><fmt:formatNumber value="${cvo.p_price}" type="number" groupingUsed="true" /></td>
							<td class="tdCenter" id="total_${cvo.c_no}"><fmt:formatNumber value="${cvo.p_total}" type="number" groupingUsed="true" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<div class="total-container">
				합계: <span class="total-price" id="carttotal"><fmt:formatNumber value="${carttotal}" type="number" groupingUsed="true" /></span>
			</div>

			<div class="cart-buttons">
				<button type="button" name="cart_allNonChk" class="delete-btn">전체선택해제</button>
				<button type="button" onclick="cartsubmit(1)" class="delete-btn">선택상품삭제</button>
				<button type="button" onclick="cartsubmit(2)" class="select-purchase-btn">선택구매</button>
			<button  type="button" onclick="cartsubmit(4)"  id="allsellbtn" class="all-purchase-btn">전체구매</button>
			</div>
		</form>
	</div>
	</main>
	</div>
	
</body>
</html>
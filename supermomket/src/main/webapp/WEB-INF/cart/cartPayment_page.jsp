<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/cart.css">
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<%@ include file="../../header.jsp"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<body>
	<%@ include file="../../menu.jsp"%>
	<script src="${pageContext.request.contextPath}/resources/js/cartjs.js"></script>
	<!-- 제이쿼리 사용하기 위한 CDN -->
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
	<!-- 
	개발가이드 => [v1]선택 => 우측의 [결제 연동 시작하기] => [인증 결제 연동하기]
	우측 메뉴의 [1. 포트원 SDK 설치 ] 선택
-->
	<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
	<script>
	

	 function sample4_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var roadAddr = data.roadAddress; // 도로명 주소 변수
	                var extraRoadAddr = ''; // 참고 항목 변수

	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraRoadAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraRoadAddr !== ''){
	                    extraRoadAddr = ' (' + extraRoadAddr + ')';
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample4_postcode').value = data.zonecode;
	                document.getElementById("sample4_roadAddress").value = roadAddr;
	                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
	                
	                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
	                if(roadAddr !== ''){
	                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
	                } else {
	                    document.getElementById("sample4_extraAddress").value = '';
	                }

	                var guideTextBox = document.getElementById("guide");
	                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
	                if(data.autoRoadAddress) {
	                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
	                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
	                    guideTextBox.style.display = 'block';

	                } else if(data.autoJibunAddress) {
	                    var expJibunAddr = data.autoJibunAddress;
	                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
	                    guideTextBox.style.display = 'block';
	                } else {
	                    guideTextBox.innerHTML = '';
	                    guideTextBox.style.display = 'none';
	                }
	            }
	        }).open();
	    }
    function initLayerPosition(){
        var width = 300; //우편번호서비스가 들어갈 element의 width
        var height = 400; //우편번호서비스가 들어갈 element의 height
        var borderWidth = 5; //샘플에서 사용하는 border의 두께

        // 위에서 선언한 값들을 실제 element에 넣는다.
        element_layer.style.width = width + 'px';
        element_layer.style.height = height + 'px';
        element_layer.style.border = borderWidth + 'px solid';
        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
    }
     
	
	
// 결제시 보내야하는 파라미터 정보 확인:
// 개발가이드 => [v1]선택 => 우측의 목차에서 [ SDK ] 선택 =>  [ JavaScript SDK 레퍼런스 ] 클릭
// => 좌측의 브라우저 SDK 메뉴에서 [결제요청 파라미터] 클릭
// https://developers.portone.io/sdk/ko/v1-sdk/javascript-sdk/payrq?v=v1
// tip :  *표시가 붙은 것은 필수로 보내야하는 파라미터임.	

// 개발가이드 => [v1]선택 => 좌측의 [결제 연동 시작하기] => [인증 결제 연동하기]
// [2. 결제 요청하기 ] 내용 참고

	function setFullAddress() {
    // 각 주소 필드의 값 가져오기
    const postcode = document.getElementById('sample4_postcode').value;
    const roadAddress = document.getElementById('sample4_roadAddress').value;
    const jibunAddress = document.getElementById('sample4_jibunAddress').value;
    const detailAddress = document.getElementById('sample4_detailAddress').value;
    const extraAddress = document.getElementById('sample4_extraAddress').value;

    // fullAddress 생성
    fullAddress = `${postcode} ${roadAddress} ${extraAddress} ${detailAddress}`;
    if (!roadAddress) {
        fullAddress = `${postcode} ${jibunAddress} ${detailAddress}`;
    }
}



	IMP.init("${portOneNeeds.impCode}");
	function payFnc() {
	    let payfrom = document.payForm;
	    setFullAddress();
	    // 첫 번째 상품의 c_no 값을 가져와 orderName에 설정
	    let firstCNo = $("tr[name='cart_List']:eq(0) input[name='c_no']").val();
	    let rowCount = document.querySelectorAll("tr[name='cart_List']").length;

	    // 대표 상품명 전송 (첫 c_no 값 설정)
	    let nm = rowCount > 1 ? `${firstCNo} 외 ${rowCount - 1}개` : firstCNo;
	    
	    $("#orderName").val(nm);

	    // 각 상품 정보 수집
	    var productArr = [];
	    $("tr[name='cart_List']").each(function() {
	        let pid = $(this).find("input[name='p_no']").val(); // 상품 고유 ID
	        let pname = $(this).find(".tdCenter").eq(2).text(); // 상품명
	        let pcode = $(this).find("input[name='c_no']").val(); // 상품 코드 (여기서는 c_no 사용)
	        let punitPrice = $(this).find(".tdCenter").eq(3).text().replace(/,/g, ''); // 상품 단위 가격 (콤마 제거)
	        let pquantity = $(this).find("input[name='p_count']").val(); // 수량

	        let oneObj = {
	            id: pid,
	            name: pname,
	            code: pcode,
	            unitPrice: parseInt(punitPrice, 10),
	            quantity: parseInt(pquantity, 10)
	        };
	        productArr.push(oneObj);
	    });

	    // 주문 번호 생성 및 결제 요청
	    const date = new Date();
	    var muid = date.getTime();

	    IMP.request_pay(
	        {
	            channelKey: "${portOneNeeds.channelKey}",
	            pay_method: "card",
	            merchant_uid: `payment-` + new Date().getTime(), // 주문 고유 번호
	            name: nm, // 첫 c_no 값이 포함된 상품명
	            amount: $("#amount").val(), // 총 금액
	            buyer_name: $("#buyer_name").val(), // 구매자명
	            buyer_tel: $("#buyer_tel").val(), // 구매자 연락처
	            buyer_addr: fullAddress, // 결합된 전체 주소
	            buyer_email: $("#buyer_email").val(), // 구매자 이메일
	            products: productArr // 상품 정보 배열
	        },
	        async (response) => {
	            productArr = []; // 상품 데이터 초기화

	            if (response.error_code != null) {
	                return alert(`결제에 실패하였습니다. 에러 내용: ${response.error_msg}`);
	            }

	            var myForm = $("#payForm").serializeArray();
	            var frmData = { pvo: response, mydata: JSON.stringify(myForm) };

	            console.log("myForm: ", JSON.stringify(myForm));

	            const notified = await fetch(
	                'preparcartList.do', 
	                {
	                    method: "POST",
	                    headers: { "Content-Type": "application/json" },
	                    body: JSON.stringify(frmData),
	                }
	            );  

	            location.reload(); // 결제가 성공적으로 완료된 후 페이지 새로고침
	        }
	    );
	}



</script>


	<main style="margin-top: 50px; justify-items: center;">
		<li><a href="payMenu.do">결재 내역보기</a></li>
		<form id="payForm" name="payForm">
			<input type="hidden" name="u_id" value="${userId}"> <input
				type="hidden" name="c_payment" value="${c_payment}">
			<div class="cart-container">
				<h2>결재화면</h2>
				<table class="cart-table">
					<thead>
						<tr class="cartth">
							<th>상품제거</th>
							<th>번호
							<th>상품이미지</th>
							<th>상품명</th>
							<th>수량</th>
							<th>상품금액</th>
							<th>합계금액</th>
						</tr>
					</thead>
					<tbody>
						<c:set var="counter" value="1" scope="page" />
						<!-- 초기 값 설정 -->
						<c:forEach items="${paymentcartList}" var="cvo">
							<tr name="cart_List">
								<th><input type="button" name="c_noarr" value="삭제"
									onclick="deletePayCart(${cvo.c_no}, ${cvo.p_no}, '${userId}')">
									<input type="hidden" name="p_no" value="${cvo.p_no}"> <input
									type="hidden" name="c_no" value="${cvo.c_no}"> <input
									type="hidden" name="u_id" value="${userId}"></th>
								<td class="tdCenter">${counter}</td>
								<c:set var="counter" value="${counter + 1}" />
								<td class="tdCenter cartimg" onclick="cart_imglink(${cvo.p_no})"><img
									style="width: 100px"
									src="${pageContext.request.contextPath}/resources/img/product/${cvo.p_img}"
									alt="${cvo.p_img}"></td>
								<td class="tdCenter">${cvo.p_name}</td>
								<td class="tdCenter tdpay"><input type="number" name="p_count"
									value="${cvo.p_count}" data-price="${cvo.p_price}"
									data-cno="${cvo.c_no}" data-pno="${cvo.p_no}"
									data-uid="${cvo.u_id}" data-payment="${cvo.c_payment}" min="1"
									max="50" oninput="validateNumberInput(this)"></td>
								<td class="tdCenter tdpay">
								<fmt:formatNumber value="${cvo.p_price}" type="number" groupingUsed="true" />원</td>
								<td class="tdCenter tdpay" id="total_${cvo.c_no}">
								<fmt:formatNumber value="${cvo.p_total}" type="number" groupingUsed="true" />원</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>


			<div id="payDiv" class="payment-form">
    <h2>결제 정보</h2>
    <form action="/processPayment" method="post">
        <div class="form-group">
            <label for="customerName">주문자명:</label>
            <input type="text" id="customerName" name="customerName" class="form-control" placeholder="주문자 이름을 입력하세요" required>
        </div>
        <div class="form-group">
            <label for="email">이메일:</label>
            <input type="email" id="email" name="email" class="form-control" placeholder="이메일을 입력하세요" required>
        </div>
        <div class="form-group">
            <label for="recipientName">수취인 이름:</label>
            <input type="text" id="recipientName" name="recipientName" class="form-control" placeholder="수취인 이름을 입력하세요" required>
        </div>
        <div class="form-group">
            <label for="phoneNumber">연락처:</label>
            <input type="tel" id="phoneNumber" name="phoneNumber" class="form-control" placeholder="연락처를 입력하세요" required>
        </div>
        <div class="form-group">
            <label for="address">배송 주소:</label>
            <input type="text" id="address" name="address" class="form-control" placeholder="도로명 주소" required>
        </div>
        <div class="form-group">
            <label for="zipCode">우편번호:</label>
            <input type="text" id="zipCode" name="zipCode" class="form-control" placeholder="우편번호" required>
        </div>
        <div class="form-group">
            <label for="totalAmount">총 결제 금액:</label>
            <fmt:formatNumber value="${paymenttotal}" type="number" groupingUsed="true" />원
        </div>
        <div class="form-group text-center">
            <button type="submit" class="btn btn-primary">결제하기</button>
        </div>
    </form>
		</form>
	</main>


	</div>
</body>
</html>
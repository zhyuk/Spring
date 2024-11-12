<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
*{box-sizing: border-box;}
div.productDiv {
	margin : 8px;
	padding : 8px;
	border-radius : 5px;
	background-color: #acacac;			
}
</style>
<!-- 제이쿼리 사용하기 위한 CDN -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>

<!-- 
	개발가이드 => [v1]선택 => 우측의 [결제 연동 시작하기] => [인증 결제 연동하기]
	우측 메뉴의 [1. 포트원 SDK 설치 ] 선택
-->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script>

// 결제시 보내야하는 파라미터 정보 확인:
// 개발가이드 => [v1]선택 => 우측의 목차에서 [ SDK ] 선택 =>  [ JavaScript SDK 레퍼런스 ] 클릭
// => 좌측의 브라우저 SDK 메뉴에서 [결제요청 파라미터] 클릭
// https://developers.portone.io/sdk/ko/v1-sdk/javascript-sdk/payrq?v=v1
// tip :  *표시가 붙은 것은 필수로 보내야하는 파라미터임.	

// 개발가이드 => [v1]선택 => 좌측의 [결제 연동 시작하기] => [인증 결제 연동하기]
// [2. 결제 요청하기 ] 내용 참고

	IMP.init("${portOneNeeds.impCode}");
	function payFnc(){
		
		//대표 상품명 전송
		let pArrLength = document.getElementsByClassName("productDiv").length-1 ;
		var nm;
		if(pArrLength > 2){
			nm = $("div.productDiv:eq(0) input.name").val()+"외 "+pArrLength+"개";
		}else{
			nm = $("div.productDiv:eq(0) input.name").val();
		}
		$("#orderName").val(nm);
		
		//여러개 상품 주문시 전송할 내역
		var productDivArr = document.querySelectorAll("div.productDiv");
		productDivArr.forEach(function(obj, idx){
			let pid = $(obj).children(".id").val(); //상품고유ID
			let pname = $(obj).children().children(".name").val(); //상품명
			let pcode = $(obj).children(".code").val(); //상품코드
			let punitPrice = $(obj).children(".unitPrice").val(); //상품단위가격
			let pquantity = $(obj).children(".quantity").val(); //수량
			
			let oneObj = {id : pid, name: pname, code : pcode, unitPrice: punitPrice, quantity : pquantity };
			productDivArr[idx] = oneObj;
		});
		
		//var muid = crypto.randomUUID() : 주문번호 난수발생
		const date = new Date();
		var muid = date.getTime();
		
		IMP.request_pay(
			{
				channelKey: "${portOneNeeds.channelKey}",
				pay_method: "card",
				merchant_uid: `payment-`+muid, // 주문 고유 번호
				name: $("#orderName").val(), //상품명 
				amount: $("#amount").val(), //총금액
				buyer_name: $("#buyer_name").val(), //구매자명
				buyer_tel: $("#buyer_tel").val(), //구매자연락처
				buyer_addr: $("#buyer_addr").val()	,
				//buyer_postcode: "01181", //구매자 우편번호
				buyer_email: $("#buyer_email").val() ,//구매자 이메일
				products : productDivArr
			},
			async (response) => {
				//console.log('response: ', response);
				productDivArr= []; //상품데이터 초기화
				
				if (response.error_code != null) {
				  return alert(`결제에 실패하였습니다. 에러 내용: ${response.error_msg}`);
				}
				
				var myForm = $("#payForm").serializeArray();
			    var frmData = {pvo: response, mydata : JSON.stringify(myForm) };
			    
			    console.log("myForm: ", JSON.stringify(myForm));
			    
				const notified = await fetch(
					'/pay', 
					{
						method: "POST",
						headers: { "Content-Type": "application/json" },
						//포트원에서 받은 주문 정보를 서버에 전달
// 						body: JSON.stringify(response),
						body: JSON.stringify(frmData),
					}
				);  
		
			}
		);
	}

</script>

</head>
<body>
	<div id="payDiv">
	<form id="payForm" name="payForm">
		<!-- 주문자 아이디 -->
		<input type="hidden" id="orderUserId" name="orderUserId" value="ikarosala">
		<label>
			주문자명 : <input type="text" id="buyer_name" name="orderUsername" value="조영미">
		</label><br>
		<!-- 주문자 메일 -->
		<input type="hidden" id="buyer_email" name="orderUserEmail" value="ikaros_ala@naver.com">
		
		<!-- 수취인 정보 -->
		<label>
			받는사람 : 
			<input type="text" id="receive_name" name="orderReceiveName" value="조영미">
		</label><br>
		
		<label>
			연락처 : 
			<input type="text" id="buyer_tel" name="orderReceiveTel" value="01029952928">
		</label><br>
		
		<label>
			배송주소 : 
			<input type="text" id="buyer_addr" name="orderReceiveAddr" value="서울시">
		</label><br>
		
		<!-- 포트원으로 전송할 주문내역의 총칭명(여러 상품을 묶어서 처리, 예: 오렌지 외 3개 품목)  -->
		<input type="hidden" id="orderName" name="orderListID" value="">
		
		<hr><br>
		<!--########## 오렌지 상품 ##########-->
		<div class="productDiv">
			<!-- 상품 고유 ID -->
			<input type="hidden" class="id" name="productId" value="p001">
			<!-- 상품코드 -->
			<input type="hidden" class="code" name="productCode" value="1">
			<label>
				상품명 : 
				<input type="text" class="name" name="productName" value="오렌지">
			</label><br>
			
			<label>
				수량 : 
				<input type="number" class="quantity" name="orderCnt" value="1" min="1">
			</label><br>
			
			<!-- 단가 -->
			<input type="number" class="unitPrice" name="oneProductPrice" value="100" style="display:none;" readonly>
			<label>
				상품금액 : 
				<input type="number" class="oneAmount" value="100" readonly>
			</label><br>
		</div>
		
		<!--########## 라면 상품 ##########-->
		<div class="productDiv">
			<!-- 상품 고유 ID -->
			<input type="hidden" class="id" name="productId" value="p002">
			<!-- 상품코드 -->
			<input type="hidden" class="code" name="productCode" value="2">
			<label>
				상품명 : 
				<input type="text" class="name" name="productName" value="라면">
			</label><br>
			
			<label>
				수량 : 
				<input type="number" class="quantity" name="orderCnt" value="1" min="1">
			</label><br>
			
			<!-- 단가 -->
			<input type="number" class="unitPrice" name="oneProductPrice" value="100" style="display:none;" readonly>
			<label>
				상품금액 : 
				<input type="number" class="oneAmount" value="100" readonly>
			</label><br>
		</div>
		
		<!--########## 생수 상품 ##########-->
		<div class="productDiv">
			<!-- 상품 고유 ID -->
			<input type="hidden" class="id" name="productId" value="p003">
			<!-- 상품코드 -->
			<input type="hidden" class="code" name="productCode" value="3">
			<label>
				상품명 : 
				<input type="text" class="name" name="productName" value="생수">
			</label><br>
			
			<label>
				수량 : 
				<input type="number" class="quantity" name="orderCnt" value="1" min="1">
			</label><br>
			
			<!-- 단가 -->
			<input type="number" class="unitPrice" name="oneProductPrice" value="100" style="display:none;" readonly>
			<label>
				상품금액 : 
				<input type="number" class="oneAmount" value="100" readonly>
			</label><br>
		</div>
		
		<script>
			//총금액 계산하는 스크립트
			function calcAmount(){
				let totalAmount = 0;
				let allOnePriceArr = document.querySelectorAll("input.oneAmount");
				
				allOnePriceArr.forEach(function(obj, idx){
					totalAmount += parseInt( $(obj).val() );
				});
				$("#amount").val(totalAmount);
			}
		
			$(function(){
				calcAmount();  //총금액 계산
				
				//수량 변경 시 마다 처리되는 스크립트
				$("div.productDiv").on("keyup change","input.quantity", function(){
					let $oneCnt = $(this).val();
					let $onePrice = $(this).closest("div.productDiv").children(".unitPrice").val();
					if( !($oneCnt=='' || $oneCnt ==null) ){
						$(this).closest("div.productDiv").children().children(".oneAmount").val($oneCnt*$onePrice);
					}
					calcAmount();
				});
				
				
			});
		
		</script>
		
		<br><hr>
		<!-- 포트원으로 전송할 주문내역의 총 금액 -->
		<label>
			총 결제 금액 : 
			<input type="number" id="amount" name="totalAmount" value="100" readonly>
		</label><br><br>
		<button type="button" onclick="payFnc()">결제하기</button>
	</form>
	</div>
	<script>
	
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/cartpay.css">
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<%@ include file="../view/header.jsp"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<body>
	<%@ include file="../view/menu.jsp"%>
	<script src="${pageContext.request.contextPath}/resources/js/cartjs.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
	<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
	<script>

    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var roadAddr = data.roadAddress;
                var extraRoadAddr = '';

                if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                    extraRoadAddr += data.bname;
                }
                if (data.buildingName !== '' && data.apartment === 'Y') {
                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if (extraRoadAddr !== '') {
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

                if (roadAddr !== '') {
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                if (data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';
                } else if (data.autoJibunAddress) {
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

    function setFullAddress() {
        const postcode = $('#sample4_postcode').val();
        const roadAddress = $('#sample4_roadAddress').val();
        const jibunAddress = $('#sample4_jibunAddress').val();
        const detailAddress = $('#sample4_detailAddress').val();
        const extraAddress = $('#sample4_extraAddress').val();

        let fullAddress = roadAddress + detailAddress + extraAddress;
        if (!roadAddress) {
            fullAddress = jibunAddress + detailAddress + extraAddress;
        }
        return fullAddress;
    }

    
    let currentRestriction = null; // 현재 적용 중인 제한 (한글만 또는 영문만)

 // 내국인/외국인 선택에 따른 입력 제한 설정
 function setInputRestriction() {
     const koreanChecked = document.getElementById("korean").checked;
     const foreignerChecked = document.getElementById("foreigner").checked;

     if (koreanChecked) {
         currentRestriction = "korean"; // 한글만 입력 가능
         disableOrderFields(false); // 필드 활성화
     } else if (foreignerChecked) {
         currentRestriction = "english"; // 영문만 입력 가능
         disableOrderFields(false); // 필드 활성화
     } else {
         currentRestriction = null; // 제한 없음
         disableOrderFields(true); // 필드 비활성화
     }
 }

 // 주문자 관련 입력 필드 활성화/비활성화 함수
 function disableOrderFields(disable) {
     const fields = ["buyer_name", "buyer_email", "receive_name", "buyer_tel"];
     fields.forEach(fieldId => {
         document.getElementById(fieldId).disabled = disable;
     });
 }

//한글 또는 영문 입력 제한 (compositionend 이벤트 사용)
 function applyRestriction(input) {
     input.addEventListener("compositionend", () => {
         if (currentRestriction === "korean") {
             // 한글, 공백만 허용
             input.value = input.value.replace(/[^가-힣\s]/g, '');
         } else if (currentRestriction === "english") {
             // 영문, 공백만 허용
             input.value = input.value.replace(/[^a-zA-Z\s]/g, '');
         }
     });
 }

 // 필드에 이벤트 리스너 추가
 function addInputRestrictions() {
     const restrictedFields = ["buyer_name"];
     restrictedFields.forEach(fieldId => {
         const field = document.getElementById(fieldId);
         if (field) {
             applyRestriction(field);
         }
     });
 }

 // 전화번호 자동 하이픈 추가 함수
 function formatPhoneNumber(input) {
     let value = input.value.replace(/\D/g, ''); // 숫자 외의 문자 제거
     if (value.length > 3 && value.length <= 7) {
         input.value = value.slice(0, 3) + '-' + value.slice(3);
     } else if (value.length > 7) {
         input.value = value.slice(0, 3) + '-' + value.slice(3, 7) + '-' + value.slice(7, 11);
     } else {
         input.value = value;
     }
 }

 // 이메일 형식 확인 및 영문과 숫자만 허용하는 함수
 function validateEmail(input) {
     // 영문, 숫자, @, . 만 허용
     input.value = input.value.replace(/[^a-zA-Z0-9@.]/g, '');
     
     // 이메일 형식 확인
     const emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
     if (!emailPattern.test(input.value)) {
         input.setCustomValidity("올바른 이메일 형식이 아닙니다.");
     } else {
         input.setCustomValidity("");
     }
 }

//페이지 로드 시 필드 비활성화 및 제한 적용
 window.onload = function() {
     disableOrderFields(true); // 처음 로드 시 필드 비활성화
     addInputRestrictions(); // 입력 제한 이벤트 리스너 추가
 };
    
//     윈도우 결제
    IMP.init("${portOneNeeds.impCode}");
    function payFnc() {
        const fullAddress = setFullAddress();
        const firstname = $("tr[name='cart_List']:eq(0) input[name='p_name']").val();
        const rowCount = $("tr[name='cart_List']").length;
        const nm = rowCount > 1 ? `${firstname} 외 ${rowCount - 1}개` : firstname;

        $("#orderName").val(nm);

        const productArr = $("tr[name='cart_List']").map(function () {
            return {
                id: $(this).find("input[name='p_no']").val(),
                img: $(this).find("input[name='p_img']").val(),
                name: $(this).find("input[name='p_name']").val(),
                code: $(this).find("input[name='c_no']").val(),
               	price: $(this).find("input[name='p_price']").val(),
                unitPrice: parseInt($(this).find(".p_total").text().replace(/,/g, ''), 10),
                quantity: parseInt($(this).find("input[name='p_count']").val(), 10)
            
            };
        }); 
        
        
       
        
        console.log("productArr: ",productArr);

        IMP.request_pay({
            channelKey: "${portOneNeeds.channelKey}",
            pay_method: "card",
            merchant_uid: `payment-` + new Date().getTime(),
            name: nm,
            amount: $("#totalAmount").val(),
            buyer_name: $("#buyer_name").val(),
            buyer_tel: $("#buyer_tel").val(),
            buyer_addr: fullAddress,
            buyer_email: $("#buyer_email").val(),
            products: productArr
        }, async function (response) { 
        	
        	console.log("response: ",response);
        	
            if (response.error_code != null) {
                alert(`결제에 실패하였습니다. 에러 내용: ${response.error_msg}`);
                return;
            }

            const frmData = {
                pvo: response,
                mydata: JSON.stringify($("#payForm").serializeArray())
            };

            await fetch('preparcartList.do', {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(frmData)
            });
            location.reload();
        });
    }
    
//     모바일결제
    function MobilepayFnc() {
        const fullAddress = setFullAddress();
        const firstname = $("tr[name='cart_List']:eq(0) input[name='p_name']").val();
        const rowCount = $("tr[name='cart_List']").length;
        const nm = rowCount > 1 ? `${firstname} 외 ${rowCount - 1}개` : firstname;

        $("#orderName").val(nm);

        const productArr = $("tr[name='cart_List']").map(function () {
            return {
                id: $(this).find("input[name='p_no']").val(),
                img: $(this).find("input[name='p_img']").val(),
                name: $(this).find("input[name='p_name']").val(),
                code: $(this).find("input[name='c_no']").val(),
               	price: $(this).find("input[name='p_price']").val(),
                unitPrice: parseInt($(this).find(".p_total").text().replace(/,/g, ''), 10),
                quantity: parseInt($(this).find("input[name='p_count']").val(), 10)
            
            };
        }); 
        
        
       
        
        console.log("productArr: ",productArr);

        IMP.request_pay({
            channelKey: "channel-key-816ec3e5-9e11-449f-856b-2ea72dd01600",
            pay_method: "card",
            merchant_uid: `payment-` + new Date().getTime(),
            name: nm,
            amount: $("#totalAmount").val(),
            buyer_name: $("#buyer_name").val(),
            buyer_tel: $("#buyer_tel").val(),
            buyer_addr: fullAddress,
            buyer_email: $("#buyer_email").val(),
            products: productArr ,
            m_redirect_url:"preparcartList"
        }, async function (response) { 
        	
        	console.log("response: ",response);
        	
            if (response.error_code != null) {
                alert(`결제에 실패하였습니다. 에러 내용: ${response.error_msg}`);
                return;
            }

            const frmData = {
                pvo: response,
                mydata: JSON.stringify($("#payForm").serializeArray())
            };

            await fetch('preparcartList.do', {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(frmData)
            });
            location.reload();
        });
    }

    
    function validateForm() {
        const buyerName = document.getElementById('buyer_name');
        const buyerEmail = document.getElementById('buyer_email');
        const receiveName = document.getElementById('receive_name');
        const buyerTel = document.getElementById('buyer_tel');
        const postcode = document.getElementById('sample4_postcode');
        const roadAddress = document.getElementById('sample4_roadAddress');
        const jibunAddress = document.getElementById('sample4_jibunAddress');

        if (!buyerName.value.trim()) {
            alert("주문자명을 입력하세요.");
            buyerName.focus();
            return false;
        }
        if (!buyerEmail.value.trim()) {
            alert("이메일을 입력하세요.");
            buyerEmail.focus();
            return false;
        }
        if (!receiveName.value.trim()) {
            alert("수취인 이름을 입력하세요.");
            receiveName.focus();
            return false;
        }
        if (!buyerTel.value.trim()) {
            alert("연락처를 입력하세요.");
            buyerTel.focus();
            return false;
        }
        if (!postcode.value.trim()) {
            alert("우편번호를 입력하세요.");
            postcode.focus();
            return false;
        }
        if (!roadAddress.value.trim() && !jibunAddress.value.trim()) {
            alert("주소를 입력하세요.");
            roadAddress.focus();
            return false;
        }
        
        // 모든 필드가 유효하면 결제 함수 호출
        payFnc();
    }
    function mobilevalidateForm() {
        const buyerName = document.getElementById('buyer_name');
        const buyerEmail = document.getElementById('buyer_email');
        const receiveName = document.getElementById('receive_name');
        const buyerTel = document.getElementById('buyer_tel');
        const postcode = document.getElementById('sample4_postcode');
        const roadAddress = document.getElementById('sample4_roadAddress');
        const jibunAddress = document.getElementById('sample4_jibunAddress');

        if (!buyerName.value.trim()) {
            alert("주문자명을 입력하세요.");
            buyerName.focus();
            return false;
        }
        if (!buyerEmail.value.trim()) {
            alert("이메일을 입력하세요.");
            buyerEmail.focus();
            return false;
        }
        if (!receiveName.value.trim()) {
            alert("수취인 이름을 입력하세요.");
            receiveName.focus();
            return false;
        }
        if (!buyerTel.value.trim()) {
            alert("연락처를 입력하세요.");
            buyerTel.focus();
            return false;
        }
        if (!postcode.value.trim()) {
            alert("우편번호를 입력하세요.");
            postcode.focus();
            return false;
        }
        if (!roadAddress.value.trim() && !jibunAddress.value.trim()) {
            alert("주소를 입력하세요.");
            roadAddress.focus();
            return false;
        }
        
        // 모든 필드가 유효하면 결제 함수 호출
        MobilepayFnc();
    }
    
    
    
    
    </script>

		<main>
		<section>
			
			<div class="pcdiv">
				<form id="payForm" name="payForm">
					<input type="hidden" name="u_id" value="${userId}"> <input
						type="hidden" name="c_payment" value="${c_payment}">
					<div class="cart-container">
						<table class="cart-table">
							<thead>
								<tr>
									<th>취소</th>
									<th class="mocount">번호</th>
									<th>이미지</th>
									<th>상품명</th>
									<th>수량</th>
									<th class="mocount">상품금액</th>
									<th>합계</th>
								</tr>
							</thead>
							<tbody>
								<c:set var="counter" value="1" scope="page" />
								<c:forEach items="${paymentcartList}" var="cvo">
									<tr class="cart_List" name="cart_List">
										<th><input type="button" name="c_noarr" value="취소"
											onclick="deletePayCart(${cvo.c_no}, ${cvo.p_no}, '${userId}')">
											<input type="hidden" name="p_no" value="${cvo.p_no}">
											<input type="hidden" name="c_no" value="${cvo.c_no}">
											<input type="hidden" name="u_id" value="${userId}"> <input
											type="hidden" name="p_name" value="${cvo.p_name}"> <input
											type="hidden" name="p_img" value="${cvo.p_img}"> <input
											type="hidden" name="p_price" value="${cvo.p_price}">
										</th>
										<td class="tdCenter mocount">${counter}</td>
										<c:set var="counter" value="${counter + 1}" />
										<td class="tdCenter" onclick="cart_imglink(${cvo.p_no})">
											<img style="width: 100px"
											src="${pageContext.request.contextPath}/resources/img/product/${cvo.p_img}"
											alt="${cvo.p_img}">
										</td>
										<td class="tdCenter" name="p_name">${cvo.p_name}</td>
										<td class="tdCenter"><input type="number" name="p_count"
											value="${cvo.p_count}" data-price="${cvo.p_price}"
											data-cno="${cvo.c_no}" data-pno="${cvo.p_no}"
											data-uid="${cvo.u_id}" data-payment="${cvo.c_payment}"
											min="1" max="50" oninput="validateNumberInput(this)">
										</td>
										<td class="tdCenter mocount"><fmt:formatNumber
												value="${cvo.p_price}" type="number" groupingUsed="true" />원</td>
										<td class="tdCenter p_total" id="total_${cvo.c_no}"><fmt:formatNumber
												value="${cvo.p_total}" type="number" groupingUsed="true" />원</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					
					
					<div id="payDiv" class="payment-form">
						<h2>결제 정보</h2>

						<div class="form-group">
							<label>내국인/외국인 선택:</label><input type="radio" id="korean"
								name="nationality" value="내국인" onchange="setInputRestriction()">
							내국인 <input type="radio" id="foreigner" name="nationality"
								value="외국인" onchange="setInputRestriction()"> 외국인
						</div>

						<input type="hidden" id="orderUserId" name="orderUserId" value="">
						<div class="form-group">
							<label for="buyer_name">주문자명:</label> <input type="text"
								id="buyer_name" name="orderUsername" placeholder="주문자 이름을 입력하세요"
								required maxlength="20" oninput="applyRestriction(this)">
						</div>
						    <div class="form-group">
        <label for="buyer_email">이메일:</label>
        <input type="text" id="buyer_email" name="orderUserEmail" placeholder="이메일을 입력하세요" maxlength="50" oninput="validateEmail(this)">
    </div>
						<div class="form-group">
							<label for="receive_name">수취인 이름:</label> <input type="text"
								id="receive_name" name="orderReceiveName"
								placeholder="수취인 이름을 입력하세요" required maxlength="20"
								>
						</div>

						<div class="form-group">
							<label for="buyer_tel">연락처:</label> <input type="text"
								id="buyer_tel" name="orderReceiveTel" placeholder="연락처를 입력하세요"
								required oninput="formatPhoneNumber(this)">
						</div>
						<div class="form-group">
							<div class="address-fields">
								<label for="address">배송 주소: <br></label>
								<input class="addressbtn" type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"> 
								<input type="text" id="sample4_postcode" placeholder="우편번호"> 
									<input type="text"
									id="sample4_roadAddress" placeholder="도로명주소"> <input
									type="text" id="sample4_jibunAddress" placeholder="지번주소">
								<input type="text" id="sample4_detailAddress" placeholder="상세주소">
								<input type="text" id="sample4_extraAddress" placeholder="참고항목">
								<span id="guide" style="color: #999; display: none"></span>
							</div>
						</div>
						<!-- 약관 동의 버튼 -->
						<div class="form-group">
							<button type="button" onclick="openTermsModal()" id="agreeButton"
								class="btn btn-secondary">약관 보기 및 동의</button>
							<input type="checkbox" id="termsCheckbox" style="display: none;"
								required>
						</div>

						<div class="form-group">
							<label for="amount">총 결제 금액:</label> <input type="hidden"
								id="totalAmount" name="totalAmount" value="${paymenttotal}"
								readonly> <span class="total-price" id="carttotal">
								<fmt:formatNumber value="${paymenttotal}" type="number"
									groupingUsed="true" />원
							</span>
						</div>
						<!-- 결제하기 버튼 -->
						<div class="form-group text-center">
							<button type="button" onclick="validateForm()"
								class="btn btn-primary" id="payButton" disabled>결제하기</button>
							<button type="button" onclick="mobilevalidateForm()"
								class="btn btn-primary" id="mobilepayButton"  disabled>결제하기</button>
						</div>
						</div>
					</div>

					<!-- 약관 모달 -->
					<div id="termsModal" class="modal" style="display: none;">
						<div class="modal-content">
							<span class="close" onclick="closeTermsModal()">&times;</span>
							<h3>약관 및 정책</h3>
							<div class="terms-text"
								style="max-height: 300px; overflow-y: auto; margin-bottom: 20px;">
								<p>본 약관은 결제 및 주문에 관한 규정을 포함하고 있습니다. 결제를 진행하기 전에 아래의 내용을
									숙지하시고, 동의 후 결제를 진행해 주세요.</p>
								<ul>
									<li>모든 상품은 주문 후 교환 및 부분환불이 불가합니다.</li>
									<li>개인정보는 안전하게 보호되며, 결제 및 배송 목적으로만 사용됩니다.</li>
									<li>결제 금액에는 부가세가 포함되어 있으며, 추가 요금이 발생하지 않습니다.</li>
									<li>이 약관은 법적 구속력이 있으며, 사용자가 동의하는 것으로 간주됩니다.</li>
								</ul>
							</div>
							<button type="button" onclick="agreeToTerms()"
								class="btn btn-primary">동의합니다</button>
						</div>
					</div>

				</form>
			</div>
	</section>
		</main>

	<script>
				function openTermsModal() {
				    document.getElementById('termsModal').style.display = 'block';
				}
				
				function closeTermsModal() {
				    document.getElementById('termsModal').style.display = 'none';
				}
				
				function agreeToTerms() {
				    document.getElementById('termsCheckbox').checked = true;
				    document.getElementById('payButton').disabled = false;
				    document.getElementById('mobilepayButton').disabled = false;
				    
				    const agreeButton = document.getElementById('agreeButton');
				    if (agreeButton) { // agreeButton이 존재할 때만 classList 수정
				        agreeButton.classList.add('agreed'); // 동의 후 버튼 색상 변경
				        agreeButton.innerText = "동의 완료"; // 버튼 텍스트 변경
				    }

				    closeTermsModal(); // 모달 창 닫기
				}
				// 모달 외부 클릭 시 닫기
				window.onclick = function(event) {
				    const modal = document.getElementById('termsModal');
				    if (event.target === modal) {
				        modal.style.display = "none";
				    }
				}
</script>


</body>
</html>

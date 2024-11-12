<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header.jsp"%>
<!-- 현재 페이지 위치 기준으로 수정 -->
<style>
    
    .mp_page-container {
        display: flex;
        justify-content: center;
        gap: 20px; 
    }

    .mp_form-container {
        flex: 1; 
        width: 100%; 
        max-width: 800px; 
        margin: auto; 
    }
</style>
<body>
    <%@ include file="/menu.jsp"%>
    <div class="mp_page-container" >

        <div class="mp_form-container"  >
            <form name="mp_updateForm" onsubmit="return goValidateForm(event)"  style="width: 700px; margin-top: 50px; margin: auto;" action="setNewMypage.do" method="post">
                <div class="form-floating mb-3">
                    <input type="hidden" name="u_id" value="${mypageDetail.u_id}">
                    <input type="text" class="form-control" id="floatingId" name="u_id" value="${mypageDetail.u_id}" style="width: 700px; height: 70px;" disabled readonly>
                </div>
                <div class="form-floating mb-3">
                    <input type="hidden" name="u_name" value="${mypageDetail.u_name}">
                    <input type="text" class="form-control" id=floatingName name="u_nickname" value="${mypageDetail.u_name}" style="width: 700px; height: 70px;" disabled readonly>
                </div>
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="floatingNickname" name="u_nickname" value="${mypageDetail.u_nickname}" style="width: 700px; height: 70px;" placeholder="닉네임">
                    <div id="nickError" style="color:red; font-size:12px; margin-top: 5px;"></div>
                </div>
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="floatingEmail" name="u_email" value="${mypageDetail.u_email}" style="width: 700px; height: 70px;" placeholder="이메일">
                    <div id="emailError" style="color:red; font-size:12px; margin-top: 5px;"></div>
                </div>
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="floatingPhone" name="u_pno" value="${mypageDetail.u_pno}" style="width: 700px; height: 70px;" placeholder="휴대전화번호"> 
                    <div id="phError" style="color:red; font-size:12px; margin-top: 5px;"></div>
                </div>
                <div class="form-floating mb-3">
                    <input type="hidden" id="u_address" name="u_address" value="${mypageDetail.u_address}">
                        
                    <div class="form-floating mb-3" style="display: flex; gap: 10px; width: 700px;">
                        <input type="text" class="form-control" id="sample4_postcode" placeholder="우편번호" style="flex: 4; height: 70px;" readonly>
                        <input type="button" class="btn" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" style="flex: 1; height: 70px; background-color: #DDAF9C;" >
                    </div>
                    
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="sample4_roadAddress" name="roadAddress"  placeholder="도로명주소" style="width: 700px; height: 70px;" readonly>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="hidden" id="sample4_jibunAddress" placeholder="지번주소">
                        <input type="text" class="form-control" id="sample4_detailAddress" name="detailAddress" placeholder="상세주소" style="width: 700px; height: 70px;">
                    </div>
                    <div class="form-floating mb-3">
                        <input type="hidden" class="form-control" id="sample4_extraAddress" placeholder="참고항목" style="width: 700px; height: 70px;" readonly>
                    </div>
                    <div id="addrError" style="color:red; font-size:12px; margin-top: 5px;"></div>
                    
                    <div class="text-end">
                        <button type="submit" class="btn" style="width: 700px; height: 70px; background-color: #DDAF9C;">수정</button>
                    </div>
                    <div class="text-end">
                        <button type="button" onclick="confirmTaltae()" class="del-btn" style="width: 700px; height: 70px; margin-top: 20px; border: none;">회원탈퇴</button>
                    </div>
			     <script>
			        <c:if test="${not empty sessionScope.alertMessage}">
			            alert("${sessionScope.alertMessage}");
			            <c:remove var="alertMessage" scope="session" />
			        </c:if>
			        
			        

			        const uAddress = "${mypageDetail != null && mypageDetail.u_address != null ? mypageDetail.u_address : ''}";
			        document.addEventListener("DOMContentLoaded", function() {
			            if (uAddress) {
			                const { roadAddress, detailAddress } = splitAddress(uAddress);
			                document.getElementById("sample4_roadAddress").value = roadAddress;
			                document.getElementById("sample4_detailAddress").value = detailAddress;
			            }
			        });

			        function splitAddress(fullAddress) {
			            const roadAddressPattern = /^.+?\d+(?:-\d+)?/;
			            const detailAddressPattern = /(\d+동.*|\(.*\))/;

			            const roadAddress = fullAddress.match(roadAddressPattern)?.[0] || "";
			            const detailAddress = fullAddress.replace(roadAddress, "").trim();

			            return {
			                roadAddress,
			                detailAddress
			            };
			        }
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

			                    var fullAddress = roadAddr + ' ' + extraRoadAddr; 
			                    
			                    document.getElementById('sample4_postcode').value = data.zonecode;
			                    document.getElementById("sample4_roadAddress").value = roadAddr;
			                    document.getElementById("sample4_detailAddress").value = ''; 
			                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;

			                    document.getElementById("u_address").value = fullAddress + ' ' + document.getElementById("sample4_detailAddress").value;
			                }
			            }).open();
			        }
			        
			        document.querySelector("form[name='mp_updateForm']").addEventListener("submit", function() {
			            const roadAddress = document.getElementById("sample4_roadAddress").value;
			            const detailAddress = document.getElementById("sample4_detailAddress").value;
			            document.getElementById("u_address").value = roadAddress + " " + detailAddress;
			        });
			    </script>
				
            </form>
        </div>
    </div>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>
  <script src="${pageContext.request.contextPath}/resources/js/mypage_info.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/mypage.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</html>

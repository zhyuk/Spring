<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../view/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
    .mp_page-container {
        width: 60%;
        margin: 0 auto;
        gap: 30px;
    }

    .order-item {
        background-color: #f1f1f1;
        border-radius: 8px;
        display: flex;
        align-items: center;
        gap: 20px;
        padding: 15px;
        margin-bottom: 20px;
        position: relative;
        border: 1px solid #ddd;
        width: 100%;
    }

    .order-item img {
        width: 150px;
        height: 150px;
        object-fit: cover;
    }

    .order-item .buy_contents {
        flex-grow: 1;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: flex-start;
    }

    .order-item p {
        font-size: 14px;
        color: #333;
        margin: 3px 0;
    }

    div .order-details {
        background-color: #f8f8f8;
        border-radius: 8px;
   	    padding: 15px;	
        padding-left: 20px;
        margin-bottom: 17px;
        border: 1px solid #ddd;
        position: relative;
        font-size: 18px
    }

    .order-details p {
        margin-bottom: 5px;
    }

    /* 모달 기본 스타일 */
.modal {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 600px;
	background-color: rgba(0, 0, 0, 0.4);
}


    .cancelpaymodel {
	margin-top: 20px;
	margin-right: 10px;
	background: darkgray;
        color: white;
        border: none;
        padding: 10px 15px;
        border-radius: 5px;
        cursor: pointer;
	position: absolute;
	right: 0;
	top: 0;
    }

    .cancelpaydiv input {
	width: calc(100% - 15px);
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 5px;
    }
.modaldiv{
    background-color: #fff;
        margin: 10% auto;
        padding: 20px;
        border: 1px solid #ddd;
        width: 80%;
        max-width: 500px;
        border-radius: 8px;
        position: relative;
    }

    .cancelpaydiv button {
        margin-top: 10px;
        background-color: #928788b4;
        color: white;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        cursor: pointer;
    }
    
    .cancelpaydiv button:hover{
    background-color:#61595a;
    }
    
    button#returnbtn{
    background-color:#007bff; 
    }
    
    button#returnbtn:hover{
    background-color: #00aaff;
    }

    strong {
        margin-right: 10px;
    }

	.buy_contents {
	    flex-grow: 1;
	    display: flex;
	    flex-direction: row;
	    justify-content: space-between;
	    align-items: center;
	}
	
	.buy_contents p {
	    font-size: 18px;
	    color: #333;
	    margin: 0;
	    flex-grow: 1;
	}

	.review-btn {
	    margin: 0;
	    background-color: #FFD26E !important;
	    color: black;
	    border: none;
	    padding: 10px 15px;
	    border-radius: 3px;
	    cursor: pointer;
	    font-size: 18px !important;
	}
	
    .price-review {
        display: flex;
        justify-content: space-between;
        align-items: center; 
        width: 100%;
    }





    @media screen and (max-width: 425px) {
      	.mp_page-container {
            width: 100%;
            padding: 0 10px;
            margin-top: 95px;
        }

		.mp_form-container{
			margin-top: 15px !important;
		}
			
		.order-item {
		    display: flex;
		    align-items: center;
		    gap: 20px;
		    background-color: #f1f1f1;
		    border-radius: 8px;
		    padding: 15px;
		    margin-bottom: 20px;
		    position: relative;
		    border: 1px solid #ddd;
		    width: 100%;
		}	
		
			
		.order-item img {
		    width: 150px;
		    height: 150px;
		    object-fit: cover;
		}
		
		.product-link {
		    display: block;
		}
        
        .order-details{
       	    margin-top: 10px;
       	    margin-bottom: -1px;
   	        padding-left: 20px;
        }
        
        .order-item p {
            font-size: 16px !important;
        }
        
        p strong{
       	    margin-right: 5px;
        }
        

        .price-review {
            flex-direction: column;
            align-items: flex-start; 
        }

        .review-btn {
            align-self: flex-end;
            width: 100%;
    		margin: 0 auto;
            margin-top: 10px !important;
        }
        
        .delivery{
        	display: block;
        	width: 100%;
        	margin-bottom: 2px;
        }
        .content_hr{
   	        margin: 15px 1px;
        	margin-bottom: 20px;
        }
	    
    	.buy_contents p b{
		    margin-right: 5px !important;
		}
		
		.cancelpaymodel{
			margin-top: 270px;
		}
    }
</style>

<body>
    <%@ include file="../view/menu.jsp"%>

    <div class="mp_page-container">
        <div class="order-details">
            <c:choose>
                <c:when test="${empty buyListDetail}">
                    <p>조회된 데이터가 없습니다.</p>
                </c:when>
                <c:otherwise>
                    <c:set var="item" value="${buyListDetail[0]}" />
                    <p><strong>주문일자 :</strong> ${item.o_input_date}</p>
                    <c:if test="${item.o_cancel_yn == '결제완료'}">
	                    <button class="cancelpaymodel" onclick="toggleCancelPay()">결제 취소</button>
                    </c:if>
                    <p><strong>주문번호 :</strong> ${item.merchant_uid}</p>
                    <hr class="content_hr">
                    <p><strong>수령인 :</strong> ${item.o_receiver}</p>
                    <p><strong>수령인 연락처 :</strong> ${item.o_receiver_contact}</p>
                    <p><strong class="delivery">배송지 :</strong> ${item.o_address}</p>
                    <p><strong>총 금액 :</strong> ${item.o_total_price}원</p>
                    <p><strong>결제방식 :</strong> ${item.o_pay_type}</p>
                    <p><strong>결제상태 :</strong> ${item.o_cancel_yn}</p>
                </c:otherwise>
            </c:choose>
        </div>
		<hr class="content_hr">
        <c:forEach items="${buyListDetail}" var="product">
		<div class="order-item">
		    <a href="/detail.do?p_no=${product.p_no}" class="product-link">
		        <img src="${pageContext.request.contextPath}/resources/img/product/${product.p_img}" alt="상품 이미지">
		    </a>
		    <div class="buy_contents">
			        <p><b>상품명 :</b> ${product.p_name}</p>
		        <p><b>구매 수량 :</b> ${product.p_count}개</p>
		        <div class="price-review">
			        <p class=""><b>금액 :</b> ${product.p_total}원</p>
	    		    <c:if test="${product.p_review_yn == 'N'}">
			            <button type="button" class="review-btn" onclick="location.href='/detail.do?p_no=${product.p_no}'">리뷰 쓰기</button>
			        </c:if>
		        </div>

		    </div>
		</div>
        </c:forEach>

		<div class="cancelpaydiv modal">
			<div class="modaldiv">
            <form>
                취소할 주문번호 입력: <input type="text" id="merchant_uid" name="merchant_uid"><br>
                <button type="button" onclick="cancelPay()">결제 취소</button>
					<button type="button" id="returnbtn" onclick="toggleCancelPay()">돌아가기</button>
            </form>
			</div>
        </div>
    </div>

    <script>
        function toggleCancelPay() {
            const cancelPayDiv = document.querySelector('.cancelpaydiv');
            cancelPayDiv.style.display = cancelPayDiv.style.display === 'none' ? 'block' : 'none';
        }

        function cancelPay() {
            $.ajax({
                url: "/payCancel",
                type: "post",
                data: { "merchant_uid": $("#merchant_uid").val() },
                cache: false,
                async: false,
                success: function(res) {
                    location.reload();
                },
                error: function(err) {
                    console.log('err: ', err);
                }
            });
        }
    </script>
</body>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
</html>

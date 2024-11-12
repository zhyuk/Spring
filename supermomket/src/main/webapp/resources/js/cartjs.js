$(document).ready(function() {
			$("#cart_allChk").click(function() {
				if($("#cart_allChk").is(":checked")) $("input[name=c_noarr]").prop("checked", true);
				else $("input[name=c_noarr]").prop("checked", false);
			});
			
			
			$("input[name=c_noarr]").click(function() {
				var total = $("input[name=c_noarr]").length;
				var checked = $("input[name=c_noarr]:checked").length;
				
				if(total != checked) $("#cart_allChk").prop("checked", false);
				else $("#cart_allChk").prop("checked", true); 
			});
			$("button[name=cart_allNonChk]").click(function() {
				$("input[name=c_noarr]").prop("checked", false);
				$("input[id=cart_allChk]").prop("checked", false);
			});
		});


function cart_imglink(val) {
    // 예: cartList 페이지로 이동
    window.location.href = "detail.do?p_no="+val;
}

$(function() {
    $("input[name=p_count]").on('change', function() {
        const c_no = $(this).data("cno");
        const p_no = $(this).data("pno");
        const u_id = $(this).data("uid");
        const c_payment = $(this).data("payment");
        const p_price = $(this).data("price");
        let newCount = parseInt($(this).val(), 10);

        if (newCount > 50) {
            newCount = 50;
            alert("최대 50개까지만 가능합니다.");
            $(this).val(newCount); // 입력 값을 50으로 설정
        }
        if(isNaN(newCount) || String(newCount).trim() === ""){
			newCount=1;
            $(this).val(newCount);
		}
		if (newCount < 0) {
            newCount = 1;
            $(this).val(newCount); // 입력값을 1로설정
        }
        $.ajax({
            url: "p_countup.do",
            method: "POST",
            contentType: "application/json",
            data: JSON.stringify({
                c_no: c_no,
                p_count: newCount,
                p_price: p_price,
                p_no: p_no,
                u_id: u_id,
                c_payment: c_payment
            }),
            success: function(response) {
                $(`#total_${c_no}`).text(response.newTotal.toLocaleString());
                $(`#carttotal`).text(response.carttotal.toLocaleString());
                	location.reload();
            },
            error: function(error) {
                alert("수량 업데이트에 실패했습니다.");
            }
        });
    });
});

function validateNumberInput(input) {
	let value = input.value;

	// 숫자가 아닌 입력이 있을 경우
	if (isNaN(value) || value.trim() === "") {
		input.value = ""; // 입력된 값을 지웁니다.
	} else {
		// 숫자로 변환하여 최소, 최대 범위에 맞추기
		const min = parseInt(input.getAttribute("min"));
		const max = parseInt(input.getAttribute("max"));
		value = parseInt(value, 10);

		if (value < min) {
			input.value = min;
		} else if (value > max) {
			input.value = max;
		}
	}
}

 function cartsubmit(val) {
	let cartselect = document.cartList;
	console.log("val="+val);
	console.log("cartselect: ", cartselect);
	if(val ==1){
		console.log('1번 구역');
		cartselect.c_payment.value = "ready";
		cartselect.action = "deletcart.do";
		cartselect.method = "GET" ;
	}
	else if(val ==2){
		console.log('2번 구역');
		cartselect.c_payment.value = "preparation";
		cartselect.action = "preparinsertcart.do";
		cartselect.method = "GET" ;
	}else{
        // 모든 체크박스를 선택 상태로 설정
        $("input[name='c_noarr']").prop("checked", true);
        
        // `c_payment` 값을 "preparation"으로 설정
        cartselect.c_payment.value = "preparation";

        // URL 및 메서드 설정
        cartselect.action = "preparallinsertcart.do";
        cartselect.method = "POST";
    	cartselect.submit();
	}
    cartselect.submit();
}
function deletePayCart(c_no, p_no, u_id) {
    $.ajax({
        url: "deletpaycart.do", // 요청할 서버 엔드포인트
        type: "POST",
        contentType: "application/json",
        data: JSON.stringify({
            c_no: c_no,
            p_no: p_no,
            u_id: u_id // u_id 추가
        }),
        success: function(response) {
            console.log("삭제 성공:", response);
            location.reload(); // 페이지 새로고침
        },
        error: function(error) {
            console.error("삭제 실패:", error);
            alert("삭제에 실패했습니다.");
        }
    });
}
function openModal() {
    if (window.innerWidth <= 685) { // 모바일 화면에서 모달 열기
        document.getElementById('payDiv').style.display = 'block';
        document.getElementById('modalOverlay').style.display = 'block';
    } else {
        // 데스크탑에서는 바로 결제 함수 실행
        payFnc();
    }
}

function closeModal() {
    document.getElementById('payDiv').style.display = 'none';
    document.getElementById('modalOverlay').style.display = 'none';
}


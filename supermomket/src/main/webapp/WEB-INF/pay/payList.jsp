<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 제이쿼리 사용하기 위한 CDN -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
</head>
<body>
	<form>
		<h1>지정한 주문번호 한 건만 조회</h1>
		조회할 주문번호 입력(imp_uid) : <input type="text" name="imp_uid"><br>
		<button type="button" onclick="oneCheck(1)" id="oneCheckBtn">단건조회</button>
	</form>	
	<hr><br>
	<form id="payCheckFrm">
		<h1>지정한 주문번호들만 조회(결제내역 복수조회 API)</h1>
		조회할 주문번호 입력(imp_uid) : <input type="text" name="impUidArr" value="imp_506021783010"><br>
		조회할 주문번호 입력(imp_uid) : <input type="text" name="impUidArr" value="imp_124917844606"><br>
		조회할 주문번호 입력(imp_uid) : <input type="text" name="impUidArr" value="imp_980498071218"><br>
		조회할 주문번호 입력(imp_uid) : <input type="text" name="impUidArr" value="imp_895683284462"><br>
		조회할 주문번호 입력(imp_uid) : <input type="text" name="impUidArr" value="imp_672907576801"><br>
		조회할 주문번호 입력(merchant_uid) : <input type="text" name="MerchantUidArr" value="payment-1730284111100"><br>
		<button type="button" onclick="oneCheck(2)" id="oneCheckBtn">지정건조회</button>
		<hr><br>
	
	<form>
		취소할 주문번호 입력(imp_uid) : <input type="text" id="imp_uid" name="imp_uid"><br>
		<h1>결제 취소</h1>
		<button type="button" onclick="cancelPay()" id="cancelBtn">결제 취소</button>
	</form>
	
	<script>
	
	//결제내역 복수조회 API
	function oneCheck(val){
		if(val==1){
			$.ajax({
				url : "/payDetail",
				data : {imp_uid : $("input[name=imp_uid]").val()},
				method : "post",
				cache :  false,
				async : false,
				success : function(res){
					console.log('res: ', res);
				},
				error : function(err){
					console.log('err: ', err);
				}
			});
		}else{
			
			var queryString = $("#payCheckFrm").serialize();
			$.ajax({
				url : "/paySelList",
				type : "post",
				data : queryString,
				cache :  false,
				async : false,
				success : function(res){
					console.log('res: ', res);
				},
				error : function(err){
					console.log('err: ', err);
				}
			});
		}
	}
	
	//결제 취소하기
	function cancelPay(){
		$.ajax({
			url : "/payCancel",
			type : "post",
			data : { "imp_uid": $("#imp_uid").val()},
			cache :  false,
			async : false,
			success : function(res){
				console.log('res: ', res);
			},
			error : function(err){
				console.log('err: ', err);
			}
		});
	}
	</script>
</body>
</html>
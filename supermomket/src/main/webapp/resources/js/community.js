$(document).ready(function(){ 
	$( window ).resize(function() {
		var windowWidth = $( window ).width();
		if(windowWidth >= 978) {
			$("#subNavMenu").hide();
		}
	});
	
	$("#yookaList").click(function(){
			document.hideFrm.action="/getCommunity_yookaList.do";
			document.hideFrm.method="post";
			document.hideFrm.submit();
		});
	$("#noriterList").click(function(){
			document.hideFrm.action="/getCommunity_noriterList.do";
			document.hideFrm.method="post";
			document.hideFrm.submit();
		});
	$("#shoppingList").click(function(){
			document.hideFrm.action="/getCommunity_shoppingList.do";
			document.hideFrm.method="post";
			document.hideFrm.submit();
		});
		
	$("#conDelYooka").click(function(){
		let con_test = confirm("정말로 삭제하시겠습니까?");
		if(con_test == true){
			let s = document.fm.cm_no.value;
			let w = document.fm.cm_writer.value;
			
			location.href = "/deleteYooka.do?cm_no="+s+"&cm_writer="+w;
		}
		else if(con_test == false){
		  	return false;
		}
	});
	$("#conDelNoriter").click(function(){
		let con_test = confirm("정말로 삭제하시겠습니까?");
		if(con_test == true){
			let s = document.fm.cm_no.value;
			let w = document.fm.cm_writer.value;
			
			location.href = "/deleteNoriter.do?cm_no="+s+"&cm_writer="+w;
		}
		else if(con_test == false){
		  	return false;
		}
	});
	$("#conDelShopping").click(function(){
		let con_test = confirm("정말로 삭제하시겠습니까?");
		if(con_test == true){
			let s = document.fm.cm_no.value;
			let w = document.fm.cm_writer.value;
			
			location.href = "/deleteShopping.do?cm_no="+s+"&cm_writer="+w;
		}
		else if(con_test == false){
		  	return false;
		}
	});
	
	$("#conWrite").click(function(){
		location.href = "insertCommunity.do";
	});
	
	$("#conList").click(function(){
		window.history.back();
	});
});	
	
	
	function yookaList(val,val2,val3, nowpage){
	location.href = "/getYooka.do?cm_no="+ val + "&searchCondition=" +val2+ "&searchKeyword="+val3+"&nowPage="+nowpage;
	}
	
	function noriterList(val,val2,val3, nowpage){
	location.href = "/getNoriter.do?cm_no="+val+'&searchCondition='+val2+'&searchKeyword='+val3+'&nowPage='+nowpage;
	}
	
	function shoppingList(val,val2,val3, nowpage){
	location.href = "/getShopping.do?cm_no="+val+'&searchCondition='+val2+'&searchKeyword='+val3+'&nowPage='+nowpage;
	}
	
	
	// 댓글 삭제
	function delCommentYooka(cm_no, co_no, co_writer, co_content){
	const con = confirm('정말삭제하시겠습니까?');
	if(con == true){
		location.href="/deleteCommentYooka.do?cm_no=" + cm_no +"&co_no=" + co_no + "&co_writer=" + co_writer + "&co_content=" + co_content;
	} else if(con == false){
		return false;
	}
}
	function delCommentNoriter(cm_no, co_no, co_writer,co_content){
	const con = confirm('정말삭제하시겠습니까?');
	if(con == true){
		location.href="/deleteCommentNoriter.do?cm_no=" + cm_no +"&co_no=" + co_no + "&co_writer=" + co_writer+ "&co_content=" + co_content;
	} else if(con == false){
		return false;
	}
}
	function delCommentShopping(cm_no, co_no, co_writer ,co_content){
	const con = confirm('정말삭제하시겠습니까?');
	if(con == true){
		location.href="/deleteCommentShopping.do?cm_no=" + cm_no +"&co_no=" + co_no + "&co_writer=" + co_writer + "&co_content=" + co_content;
	} else if(con == false){
		return false;
	}
}
	//대댓글 삭제
	function delReplyYooka(cm_no, co_no, co_writer, co_content){
	const conR = confirm('정말삭제하시겠습니까?');
	if(conR == true){
		location.href="/deleteReplyYooka.do?cm_no=" + cm_no +"&co_no=" + co_no + "&co_writer=" + co_writer+"&co_content=" + co_content;
	} else if(conR == false){
		return false;
	}
}
	function delReplyNoriter(cm_no, co_no, co_writer, co_content){
	const conR = confirm('정말삭제하시겠습니까?');
	if(conR == true){
		location.href="/deleteReplyNoriter.do?cm_no=" + cm_no +"&co_no=" + co_no + "&co_writer=" + co_writer+"&co_content=" + co_content;
	} else if(conR == false){
		return false;
	}
}
	function delReplyShopping(cm_no, co_no, co_writer){
	const conR = confirm('정말삭제하시겠습니까?');
	if(conR == true){
		location.href="/deleteReplyShopping.do?cm_no=" + cm_no +"&co_no=" + co_no + "&co_writer=" + co_writer;
	} else if(conR == false){
		return false;
	}
}

	function replyYookabtn(co_no){
		let className = ".replyForm" + co_no;
		$(className).toggle();
	}
	
	function replyNoriterbtn(co_no){
		let className = ".replyFormNoriter" + co_no;
		$(className).toggle();
	}
	
	function replyShoppingbtn(co_no){
		let className = ".replyFormShopping" + co_no;
		$(className).toggle();
	}
	
	
	
	
	function replyToggleYooka(co_no){
		let repToggle = ".repTogYooka" + co_no;
		$(repToggle).toggle();
	}
	function replyToggleNoriter(co_no){
		let repToggleNoriter = ".repTogNoriter" + co_no;
		$(repToggleNoriter).toggle();
	}
	function replyToggleShopping(co_no){
		let repToggle = ".repTogShopping" + co_no;
		$(repToggle).toggle();
	}
	
	
	function yookaList(val, val2, val3, nowpage){
	let url = "/getYooka.do?cm_no="+val + "&searchCondition=" + val2 + "&searchKeyword=" + val3 + "&nowPage=" + nowpage;
	location.href = url;
}
	function noriterList(val, val2, val3, nowpage){
	let url = "/getNoriter.do?cm_no="+val + "&searchCondition=" + val2 + "&searchKeyword=" + val3 + "&nowPage=" + nowpage;
	location.href = url;
}
	function shoppingList(val, val2, val3, nowpage){
	let url = "/getShopping.do?cm_no="+val + "&searchCondition=" + val2 + "&searchKeyword=" + val3 + "&nowPage=" + nowpage;
	location.href = url;
}


	function UpDownStsYooka(cm_no, cm_updownstatus) {
	console.log(cm_no, cm_updownstatus);
    $.ajax({
        url: "/likeYooka.do",   // 요청할 URL
        type: 'POST',  // 요청 방식 
        data: {
        	cm_no: cm_no,
        	cm_updownstatus : cm_updownstatus
        },
        cache : false,
        success: function(data) {
        	console.log(data);
        	$("ul.upDown li.likeUp p").text(data[0]);
        	$("ul.upDown li.hateDown p").text(data[1]);
        },
        error : function(error){
        	alert("로그인이 필요합니다!!");
        }
    });
}
	function UpDownStsNoriter(cm_no, cm_updownstatus) {
	console.log(cm_no, cm_updownstatus);
    $.ajax({
        url: "/likeNoriter.do",   // 요청할 URL
        type: 'POST',  // 요청 방식 
        data: {
        	cm_no: cm_no,
        	cm_updownstatus : cm_updownstatus
        },
        cache : false,
        success: function(data) {
        	console.log(data);
        	$("ul.upDown li.likeUp p").text(data[0]);
        	$("ul.upDown li.hateDown p").text(data[1]);
        },
        error : function(error){
        	alert("로그인이 필요합니다!!");
        }
    });
}
	function UpDownStsShopping(cm_no, cm_updownstatus) {
	console.log(cm_no, cm_updownstatus);
    $.ajax({
        url: "/likeShopping.do",   // 요청할 URL
        type: 'POST',  // 요청 방식 
        data: {
        	cm_no: cm_no,
        	cm_updownstatus : cm_updownstatus
        },
        cache : false,
        success: function(data) {
        	console.log(data);
        	$("ul.upDown li.likeUp p").text(data[0]);
        	$("ul.upDown li.hateDown p").text(data[1]);
        },
        error : function(error){
        	alert("로그인이 필요합니다!!");
        }
    });
}






	
	
	
	
	
	
	
	
	
	
	
	
	
	

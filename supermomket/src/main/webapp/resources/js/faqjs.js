
//FAQ 유저 분류 버튼
   function faqbtn(val) {
            let faq = document.frm;
            if (val == 1) {
                faq.faq_class.value = "결제";
            } else if (val == 2) {
                faq.faq_class.value = "거래";
            } else if(val == 3){
                faq.faq_class.value = "이용방법";
            }else {
           
            faq.action = "searchfaq.do";
            faq.submit();
            }
            faq.action = "searchfaq.do";
            faq.submit();
        }


//FAQ 유저 리스트 js
document.addEventListener('DOMContentLoaded', function() {
    const faqRows = document.querySelectorAll('.faq-row');

    faqRows.forEach(row => {
        row.addEventListener('click', function() {
            // 이미 답변 행이 있는지 확인
            const answerRow = this.nextElementSibling;
            if (answerRow && answerRow.classList.contains('answer-row')) {
                // 'open' 클래스를 토글하여 애니메이션 효과 적용
                if (answerRow.style.display === 'none') {
                    answerRow.style.display = 'table-row';
                    setTimeout(() => {
                        answerRow.classList.add('open');
                    }, 10); // display 전환 후 class 추가를 위해 약간의 지연 시간 설정
                } else {
                    answerRow.classList.remove('open');
                    setTimeout(() => {
                        answerRow.style.display = 'none';
                    }, 300); // 애니메이션 시간 이후에 display를 'none'으로 설정
                }
            }
        });
    });
});


//FAQ 관리자 상세글 보기
function faqselTr(val){
	location.href = "getFaq.do?faq_no="+val;
}




 // FAQ 어드민 삭제 
$(document).ready(function(){ 
	var modal = $("#confirmModal"); // 모달
	var confirmBtn = $("#confirmDeleteBtn"); // 확인 버튼
	var cancelBtn = $("#cancelDeleteBtn"); // 취소 버튼
	var closeBtn = $(".close"); // 모달 닫기 버튼
  

	
	$("#faq_conList").click(function(){
		location.href = "getFaqAdminList.do";
	});
	
	// 삭제 버튼 클릭 시 모달 띄우기
  $("#faq_conDel").click(function(e){
    e.preventDefault(); // 기본 동작인 링크 이동을 막음
    
    // 모달을 띄움
    modal.show();
    
    // 확인 버튼 클릭 시 삭제 처리
    confirmBtn.click(function(){
      let v = document.fm.faq_no.value; // faq_no 값 가져오기
      location.href = "deletefaq.do?faq_no=" + v; // 삭제 요청
    });
    
    // 취소 버튼 클릭 시 모달 닫기
    cancelBtn.click(function(){
      modal.hide(); // 모달 숨기기
    });

    // 모달 닫기 버튼 클릭 시 모달 숨기기
    closeBtn.click(function(){
      modal.hide();
    });
    
  });
});
	function insertbtn(){
	location.href = "insertfaq.do";
}
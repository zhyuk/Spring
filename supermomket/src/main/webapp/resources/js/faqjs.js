
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
function insertbtn(){
	location.href = "insertfaq.do";
}
function listbtn(){
	location.href = "getFaqAdminList.do";
}





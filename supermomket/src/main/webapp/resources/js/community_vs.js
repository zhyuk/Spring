window.onload = function () {
};

function writeBoard() {
    location.href = "/vs_write.do";
}


function selBoard(seq) {
    location.href = "/vs_info.do?vs_no=" + seq;
}

function BoardIndex() {
    location.href = "/vs_index.do";
}

function updateBoard(seq) {
    location.href = "/vs_update.do?vs_no=" + seq;
}

function deleteBoard(seq) {
    if (confirm("정말 삭제하시겠습니까?")) {
        location.href = "/vs_delete.do?vs_no=" + seq;
    }
}

// 왼쪽 사진 투표 기능
function leftAjax(seq) {
    console.log("왼쪽 사진 누름")
    $.ajax({
        type: "POST",
        url: "/vs_vote.do", // 서버에서 처리할 URL (서블릿이나 JSP 파일 경로)
        data: {
        vs_no : seq,
        v_no : 1
        },
        cache: false,
        success: function (response) {},
        error: function (error) {}
    });
}

// 오른쪽 사진 투표 기능
function rightAjax(seq) {
    console.log("오른쪽 사진 누름");
}
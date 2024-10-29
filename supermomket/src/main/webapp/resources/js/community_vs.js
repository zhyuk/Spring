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
    if (confirm("1번에 투표하시겠습니까?")) {
        $.ajax({
            type: "POST",
            url: "/vs_vote.do",
            data: {
                vs_no: seq,
                v_no: 1
            },
            cache: false,
            success: function (data) {
                if (data > 0) {
                    alert("수정되었습니다.");
                    location.reload();
                }
            },
            error: function (error) { }
        });
    }

}

// 오른쪽 사진 투표 기능
function rightAjax(seq) {
    console.log("오른쪽 사진 누름");
    if (confirm("2번에 투표하시겠습니까?")) {
        $.ajax({
            type: "POST",
            url: "/vs_vote.do",
            data: {
                vs_no: seq,
                v_no: 2
            },
            cache: false,
            success: function (data) {
                if (data > 0) {
                    alert("수정되었습니다.");
                    location.reload();
                }
            },
            error: function (error) { }
        });
    }
}

// 댓글 작성
function insertComment() {
    let vs_no = $("input[name=vs_no]").val();
    // console.log(vs_no);
    let vs_comment = $("input[name=vs_comment]").val();
    // console.log(vs_comment);

    if (vs_no != "" && vs_comment != "") {
        $.ajax({
            type: "POST",
            url: "/vs_comment_insert.do",
            data: {
                vs_no: vs_no,
                vs_comment: vs_comment
            },
            cache: false,
            success: function (data) {
                if (data == "OK") {
                    console.log("ajax 댓글 작성 성공");
                }
            },
            error: function (error) {
            }
        });
    }


}

// 댓글 수정
function updateComment(vs_no, vs_cno) {
    // console.log(vs_no);
    // console.log(vs_cno);

    $('input[name="vs_comment"]').toggle();
    // console.log($("#vs_comment").css("display"));

    if ($("#vs_comment").css("display") == "none") {
        if (confirm("댓글을 수정하시겠습니까?")) {
            $.ajax({
                type: "POST",
                url: "vs_comment_update.do",
                data: {
                    vs_no: vs_no,
                    vs_cno: vs_cno,
                    vs_comment: $("#vs_comment").val()
                },
                cache: false,
                success: function (data) {
                    if (data > 0) {
                        location.reload();
                    }
                },
            });
        }
    }

}

// 댓글 삭제
function deleteComment(vs_no, vs_cno) {
    if (confirm("댓글을 삭제하시겠습니까?")) {
        $.ajax({
            type: "POST",
            url: "vs_comment_delete.do", // 서버에서 처리할 URL (서블릿이나 JSP 파일 경로)
            data: {
                vs_no: vs_no,
                vs_cno: vs_cno
            },
            cache: false,
            success: function (data) {
                if (data > 0) {
                    location.reload();
                }
            },
        });
    }

}
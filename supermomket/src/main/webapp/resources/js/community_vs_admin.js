// === 스크롤 탑 ===
$(function () {
    // ScrollTop
    function scrollToTop() {
        window.scrollTo({
            top: 0,
            behavior: 'smooth'
        });
    }
    // 버튼 클릭 시 화면 맨 위로 스크롤하는 이벤트 핸들러
    var button = document.getElementById('ScrollTop');
    button.addEventListener('click', scrollToTop);
});

// === 전체선택 ====
$("#all_check").click(function () {
    let result = false;
    // 							console.log($(".check"));
    $(".check").each(function (index, item) {
        // 								console.log($(item).prop("checked"));
        if ($(item).prop("checked") == true) {
            result = true;
        }

        if (result == false) {
            $(item).prop("checked", true);
        } else {
            $(item).prop("checked", false);
        }
    })
});

// === 세부정보 열고닫기 ===
function showContentInfo(seq) {
    let content_info = ".content_info" + seq;
    let img_info = ".img_info" + seq;
    // console.log(content_info);
    // console.log(img_info);

    $(content_info).toggle();
    $(img_info).toggle();
}

// === 모달창 열기 ===
function showCommentInfo(seq) {
    $.ajax({
        type: "POST",
        url: "/vs_admin_getComment.do",
        data: {
            vs_no: seq
        },
        cache: false,
        success: function (data) {
            console.log("성공");
            console.log(data);
            console.log(data.length);

            $("#modal").text("");

            let content = '<button id="modalClose" class="close" onclick="closeCommentInfo()">X</button>'
            content += '<div class="inner">'
            content += '<h3>' + seq + '번 글의 댓글정보</h3>'
            content += '<table id="admin_comment_table">'
            if (data.length > 0) {
                content += '<thead><tr><th>작성자</th><th>댓글내용</th><th>작성일자</th><th>관리</th></tr></thead><tbody>'
                for (let i = 0; i < data.length; i++) {
                    content += '<tr><td>' + data[i].vs_writer + '</td><td>' + data[i].vs_comment + '</td>' + '<td>' + data[i].vs_date + '</td><td><button onclick="deleteComment(' + data[i].vs_no + ', ' + data[i].vs_cno + ')">삭제</button></td>'
                    content += '</tr>'
                }
            } else {
                content += '<tbody><tr><td colspan="3">작성된 댓글이 없습니다.</td>'
            }
            content += '</tbody></table></div>'

            $("#modal").append(content);
            $("#modal").show();
        },
        error: function (error) {
        }
    });
}

// === 모달창 닫기 ===
function closeCommentInfo() {
    $("#modal").hide();
}

// === 댓글 삭제 ===
function deleteComment(vs_no, vs_cno) {

    if (confirm("해당 댓글을 삭제하시겠습니까?")) {
        $.ajax({
            type: "POST",
            url: "/vs_admin_deleteComment.do",
            data: {
                vs_no: vs_no,
                vs_cno: vs_cno
            },
            cache: false,
            success: function (data) {
                console.log(data);

                $("#modal").text("");

                let content = '<button id="modalClose" class="close" onclick="closeCommentInfo()">X</button>'
                content += '<div class="inner">'
                content += '<h3>' + vs_no + '번 글의 댓글정보</h3>'
                content += '<table id="admin_comment_table">'

                if (data.length > 0) {
                    content += '<thead><tr><th>작성자</th><th>댓글내용</th><th>작성일자</th><th>관리</th></tr></thead><tbody>'
                    for (let i = 0; i < data.length; i++) {
                        content += '<tr><td>' + data[i].vs_writer + '</td><td>' + data[i].vs_comment + '</td>' + '<td>' + data[i].vs_date + '</td><td><button onclick="deleteComment(' + data[i].vs_no + ', ' + data[i].vs_cno + ')">삭제</button></td>'
                        content += '</tr>'
                    }
                } else {
                    content += '<tbody><tr><td colspan="3">작성된 댓글이 없습니다.</td>'
                }
                content += '</tbody></table></div>'

                $("#modal").append(content);
                $("#moadl").show();
            },
            error: function (error) { }
        });
    }
}

// === 글 수정 ===
const update_button = $("#update_button");
update_button.click(function () {
    $("input.check:checked").each(function () {
        let tr = $(this).closest("tr");
        let content_tr = $(tr).next("tr");
        let vs_no = $(tr).children("td").children("input[name='vs_no']").val();
        let vs_title = $(tr).children("td").children("input[name='vs_title']").val();
        let vs_content = $(content_tr).children("td").children("textarea[name='vs_content']").val();

        // console.log(vs_no);
        // console.log(vs_title);
        // console.log(vs_content);

        if (vs_title != '' && vs_content != '') {
            if (confirm("정말 수정하시겠습니까?")) {
                $.ajax({
                    type: "POST",
                    url: "/vs_admin_update.do",
                    data: {
                        vs_no: vs_no,
                        vs_title: vs_title,
                        vs_content: vs_content
                    },
                    cache: false,
                    success: function (data) {
                        console.log(data);
                        let content = "";

                        if (data.length > 0) {
                            $("tbody").text("");

                            for (let i = 0; i < data.length; i++) {
                                content += '<tr class="basic_info">'
                                content += '<td><input type="checkbox" class="check pointer" name="vs_check"></td>'
                                content += '<td><input type="text" name="vs_no" value="' + data[i].vs_no + '" readonly></td>'
                                content += '<td><input type="text" name="vs_title" value="' + data[i].vs_title + '"></td>'
                                content += '<td><input type="text" name="vs_writer" value="' + data[i].vs_writer + '" readonly></td>'
                                content += '<td><input type="text" name="vs_date" value="' + data[i].vs_date + '" readonly></td>'
                                content += '<td><button onclick="showContentInfo(' + data[i].vs_no + ')">상세보기</button>'
                                content += '<button onclick="showCommentInfo(' + data[i].vs_no + ')">댓글보기</button></td></tr>'
                                content += '<tr class="content_info' + data[i].vs_no + ' content_info">'
                                content += '<td></td><td></td>'
                                content += '<td colspan="4"><textarea id="content" class="inputData" name="vs_content">' + data[i].vs_content + '</textarea></td></tr>'
                                content += '<tr class="img_info' + data[i].vs_no + ' img_info"><td></td><td></td>'
                                content += '<td colspan="2"><img src="/resources/img/vs/' + data[i].vs_img1 + '" alt="투표에 사용된 이미지 1"></td>'
                                content += '<td colspan="2"><img src="/resources/img/vs/' + data[i].vs_img2 + '" alt="투표에 사용된 이미지 2"></td></tr>'
                            }
                            $("tbody").append(content);
                        }

                    },
                    error: function (error) { }
                });
            }
        } else {
            alert("제목과 글 내용은 필수로 입력해야합니다.");
        }
    });
    console.log("글 수정버튼 누름");
});

// === 글 삭제 === 
const delete_button = $("#delete_button");
delete_button.click(function () {
    $("input.check:checked").each(function () {
        let tr = $(this).closest("tr");
        let content_tr = $(tr).next("tr");
        let vs_no = $(tr).children("td").children("input[name='vs_no']").val();
        // console.log(vs_no);

        if (confirm("정말 삭제하시겠습니까?")) {
            $.ajax({
                type: "POST",
                url: "/vs_admin_delete.do",
                data: {
                    vs_no: vs_no
                },
                cache: false,
                success: function (data) {
                    console.log(data);
                    let content = "";

                    if (data.length > 0) {
                        $("tbody").text("");

                        for (let i = 0; i < data.length; i++) {
                            content += '<tr class="basic_info">'
                            content += '<td><input type="checkbox" class="check pointer" name="vs_check"></td>'
                            content += '<td><input type="text" name="vs_no" value="' + data[i].vs_no + '" readonly></td>'
                            content += '<td><input type="text" name="vs_title" value="' + data[i].vs_title + '"></td>'
                            content += '<td><input type="text" name="vs_writer" value="' + data[i].vs_writer + '" readonly></td>'
                            content += '<td><input type="text" name="vs_date" value="' + data[i].vs_date + '" readonly></td>'
                            content += '<td><button onclick="showContentInfo(' + data[i].vs_no + ')">상세보기</button>'
                            content += '<button onclick="showCommentInfo(' + data[i].vs_no + ')">댓글보기</button></td></tr>'
                            content += '<tr class="content_info' + data[i].vs_no + ' content_info">'
                            content += '<td></td><td></td>'
                            content += '<td colspan="4"><textarea id="content" class="inputData" name="vs_content">' + data[i].vs_content + '</textarea></td></tr>'
                            content += '<tr class="img_info' + data[i].vs_no + ' img_info"><td></td><td></td>'
                            content += '<td colspan="2"><img src="/resources/img/vs/' + data[i].vs_img1 + '" alt="투표에 사용된 이미지 1"></td>'
                            content += '<td colspan="2"><img src="/resources/img/vs/' + data[i].vs_img2 + '" alt="투표에 사용된 이미지 2"></td></tr>'
                        }
                    } else {
                        content += '<tr><td colspan="6">가져올 데이터가 없습니다.</td></tr>'
                    }
                    $("tbody").append(content);
                },
                error: function (error) { }
            });
        }
    });
    console.log("글 삭제버튼 누름");
});
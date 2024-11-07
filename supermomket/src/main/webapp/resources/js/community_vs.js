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

// 이미지 미리보기
function readURL(input) {
    //console.log(input.getAttribute("name"));
    if (input.getAttribute("name") == 'vs_img1_file' && input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            document.getElementById('img1_preview').src = e.target.result;
        };
        reader.readAsDataURL(input.files[0]);
    }

    if (input.getAttribute("name") == 'vs_img2_file' && input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            document.getElementById('img2_preview').src = e.target.result;
        };
        reader.readAsDataURL(input.files[0]);
    }
}

// 글 목록으로 이동
function BoardIndex() {
    document.hideFrm.action = "/vs_index.do";
    document.hideFrm.method = "post";
    document.hideFrm.submit();
    // location.href = "/vs_index.do";
}

// 상세 글 보기
function selBoard(seq, condition, keyword, nowpage) {
    location.href = "/vs_info.do?vs_no=" + seq + '&searchCondition=' + condition + '&searchKeyword=' + keyword + '&nowPage=' + nowpage;
}

// 글 작성
function writeBoard() {
    location.href = "/vs_write.do";
}

// 글 수정
function updateBoard(seq, condition, keyword, nowpage) {
    location.href = "/vs_update.do?vs_no=" + seq + '&searchCondition=' + condition + '&searchKeyword=' + keyword + '&nowPage=' + nowpage;
}

// 글 삭제
function deleteBoard(seq) {
    if (confirm("정말 삭제하시겠습니까?")) {
        document.hideFrm.action = "/vs_index.do";
        document.hideFrm.method = "post";
        document.hideFrm.submit();
        // location.href = "/vs_delete.do?vs_no=" + seq;
    }
}

// 투표 기능
function vote(seq, v_no) {
    // console.log("왼쪽 사진 누름")
    if (confirm(v_no + "번에 투표하시겠습니까?")) {
        $.ajax({
            type: "POST",
            url: "/vs_vote.do",
            data: {
                vs_no: seq,
                v_no: v_no
            },
            cache: false,
            success: function (data) {
                // console.log(data);

                $("li.leftResult").text("투표 수 : " + data[0]);
                $("li.rightResult").text("투표 수 : " + data[1]);
            },
            error: function (error) { }
        });
    }
}

// 댓글 작성
function insertComment() {
    let vs_no = $("input[name=vs_no]").val();
    // console.log(vs_no);
    let vs_comment = $("textarea[name=vs_comment]").val();
    // console.log(vs_comment);
    let vs_commentValue = $("textarea[name=vs_comment]").prop("disabled");
    // console.log($("textarea[name=vs_comment]").prop("disabled"));

    if (vs_comment == "" && !vs_commentValue) {
        alert("댓글을 입력하세요.");
    }

    if (vs_no != "" && vs_comment != "" && !vs_commentValue) {
        $.ajax({
            type: "POST",
            url: "/vs_comment_insert.do",
            data: {
                vs_no: vs_no,
                vs_comment: vs_comment
            },
            cache: false,
            success: function (res) {
                $("textarea[name=vs_comment]").val("");
                // console.log('res.userId: ', res.userId);
                let data = res.commentList;
                let recommentList = res.recommentList;
                // console.log(data.length);
                // console.log(recommentList);
                if (data.length > 0) {
                    $("#comment_area").html("");
                    for (let i = 0; i < data.length; i++) {
                        let commentBox = "";
                        let writer = data[i].vs_writer;
                        let recomment = data[i].vs_rcno;
                        let commentNum = data[i].vs_cno;
                        // console.log("data[i].vs_rcno: " + recomment);

                        if (recomment == 0) {
                            commentBox += "<div class='comment_box'>"
                            commentBox += "<div class='comment_info'>"
                            commentBox += "<p class='writer'>" + data[i].vs_writer + "</p>"
                            commentBox += "<button class='recomment_btn pointer' onclick='viewRecomment(" + data[i].vs_cno + ")'>답글보기</button>"
                            commentBox += "<p class='date'>" + data[i].vs_date + "</p>"
                            commentBox += "</div>"
                            commentBox += "<pre class='comment comment" + data[i].vs_cno + "'>" + data[i].vs_comment + "</pre>"
                            commentBox += "<textarea name='vs_comment' class='comment_input comment_input" + data[i].vs_cno + "'>" + data[i].vs_comment + '</textarea>'
                            // commentBox += "<input type='text' name='vs_comment' class='comment_input" + data[i].vs_cno + "' value='" + data[i].vs_comment + "'>";

                            if (res.userId != null && res.userId != '' && res.userId == writer) {
                                commentBox += "<div class='comment_btn'>"
                                    + "<button type='button' class='updateCommentButton pointer' onclick='updateComment(" + data[i].vs_no + "," + data[i].vs_cno + ")'>수정</button>"
                                    + "<button type='button' class='deleteCommentButton pointer' onclick='deleteComment(" + data[i].vs_no + "," + data[i].vs_cno + ")'>삭제</button>"
                                    + "<button type='button' class='updateCancelButton pointer' onclick='updateCommentCancel()'>취소</button>"
                                    + " </div>"
                            }

                            commentBox += '<div class="recomment_area' + data[i].vs_cno + ' recomment_area">'
                            commentBox += '<textarea name="vs_recomment" class="recomment_input recomment_input' + data[i].vs_cno + '" placeholder="답글 입력"></textarea>'
                            // commentBox += '<input type="text" name="vs_recomment" class="recomment_input recomment_input' + data[i].vs_cno + '" placeholder="답글 입력">'
                            commentBox += '<button class="pointer" onclick="insertRecomment(' + data[i].vs_no + ',' + data[i].vs_cno + ')">작성</button>'

                            for (let i = 0; i < recommentList.length; i++) {
                                if (commentNum == recommentList[i].vs_rcno) {
                                    commentBox += '<div class="recomment_info">'
                                    commentBox += '<p class="writer">' + recommentList[i].vs_writer + '</p>'
                                    commentBox += '<p class="date">' + recommentList[i].vs_date + '</p>'
                                    commentBox += '</div>'
                                    commentBox += '<pre class="comment comment' + recommentList[i].vs_cno + '">' + recommentList[i].vs_comment + '</pre>'
                                    commentBox += '<textarea name="vs_comment" class="comment_input comment_input' + recommentList.vs_cno + '">' + recommentList.vs_comment + '</textarea>'
                                    // commentBox += '<input type="text" name="vs_comment" class="comment_input' + recommentList[i].vs_cno + '" value="' + recommentList[i].vs_comment + '">'

                                    if (res.userId != null && res.userId != '' && res.userId == recommentList[i].vs_writer) {
                                        commentBox += '<div class="comment_btn">'
                                        commentBox += '<button type="button" class="updateCommentButton pointer" onclick="updateComment(' + data[i].vs_no + ',' + recommentList[i].vs_cno + ')">수정</button>'
                                        commentBox += '<button type="button" class="deleteCommentButton pointer" onclick="deleteComment(' + data[i].vs_no + ',' + recommentList[i].vs_cno + ')">삭제</button>'
                                        commentBox += '<button type="button" class="updateCancelButton pointer" onclick="updateCommentCancel()">취소</button>'
                                        commentBox += '</div>'
                                    }
                                }
                            }
                        }
                        commentBox += '</div></div>'
                        $("#comment_area").append(commentBox);
                    }
                } else {
                    $("#comment_area").html("");
                }
            }
        });
    }
}

// 댓글 수정
function updateComment(vs_no, vs_cno) {
    // console.log(vs_no);
    // console.log(vs_cno);
    // console.log($(event.target).closest('.comment_btn').siblings('.comment_input'));
    // console.log($(event.target).closest('.comment_btn').siblings('pre.comment'));

    let className = ".comment_input" + vs_cno
    let preName = ".comment" + vs_cno

    // $(event.target).closest('.comment_btn').siblings('.comment_input').toggle();
    // $(event.target).closest('.comment_btn').siblings('pre.comment').toggle();
    $(className).toggle();
    $(preName).toggle();
    $(event.target).closest('.comment_btn').children(".deleteCommentButton").hide();
    $(event.target).closest('.comment_btn').children(".updateCancelButton").show();
    // console.log($("#vs_comment").css("display"));

    // if ($(event.target).closest('.comment_btn').siblings('.comment_input').css("display") == "none") {
    if ($(className).css("display") == "none") {
        if (confirm("댓글을 수정하시겠습니까?")) {
            $.ajax({
                type: "POST",
                url: "vs_comment_update.do",
                data: {
                    vs_no: vs_no,
                    vs_cno: vs_cno,
                    vs_comment: $(className).val()
                },
                cache: false,
                success: function (res) {
                    // console.log('res.userId: ', res.userId);
                    let data = res.commentList;
                    let recommentList = res.recommentList;
                    // console.log(data.length);
                    // console.log(recommentList);

                    if (data.length > 0) {
                        $("#comment_area").html("");
                        for (let i = 0; i < data.length; i++) {
                            let commentBox = "";
                            let writer = data[i].vs_writer;
                            let recomment = data[i].vs_rcno;
                            let commentNum = data[i].vs_cno;
                            // console.log("data[i].vs_rcno: " + recomment);
    
                            if (recomment == 0) {
                                commentBox += "<div class='comment_box'>"
                                commentBox += "<div class='comment_info'>"
                                commentBox += "<p class='writer'>" + data[i].vs_writer + "</p>"
                                commentBox += "<button class='recomment_btn pointer' onclick='viewRecomment(" + data[i].vs_cno + ")'>답글보기</button>"
                                commentBox += "<p class='date'>" + data[i].vs_date + "</p>"
                                commentBox += "</div>"
                                commentBox += "<pre class='comment comment" + data[i].vs_cno + "'>" + data[i].vs_comment + "</pre>"
                                commentBox += "<textarea name='vs_comment' class='comment_input comment_input" + data[i].vs_cno + "'>" + data[i].vs_comment + '</textarea>'
                                // commentBox += "<input type='text' name='vs_comment' class='comment_input" + data[i].vs_cno + "' value='" + data[i].vs_comment + "'>";
    
                                if (res.userId != null && res.userId != '' && res.userId == writer) {
                                    commentBox += "<div class='comment_btn'>"
                                        + "<button type='button' class='updateCommentButton pointer' onclick='updateComment(" + data[i].vs_no + "," + data[i].vs_cno + ")'>수정</button>"
                                        + "<button type='button' class='deleteCommentButton pointer' onclick='deleteComment(" + data[i].vs_no + "," + data[i].vs_cno + ")'>삭제</button>"
                                        + "<button type='button' class='updateCancelButton pointer' onclick='updateCommentCancel()'>취소</button>"
                                        + " </div>"
                                }
    
                                commentBox += '<div class="recomment_area' + data[i].vs_cno + ' recomment_area">'
                                commentBox += '<textarea name="vs_recomment" class="recomment_input recomment_input' + data[i].vs_cno + '" placeholder="답글 입력"></textarea>'
                                // commentBox += '<input type="text" name="vs_recomment" class="recomment_input recomment_input' + data[i].vs_cno + '" placeholder="답글 입력">'
                                commentBox += '<button class="pointer" onclick="insertRecomment(' + data[i].vs_no + ',' + data[i].vs_cno + ')">작성</button>'
    
                                for (let i = 0; i < recommentList.length; i++) {
                                    if (commentNum == recommentList[i].vs_rcno) {
                                        commentBox += '<div class="recomment_info">'
                                        commentBox += '<p class="writer">' + recommentList[i].vs_writer + '</p>'
                                        commentBox += '<p class="date">' + recommentList[i].vs_date + '</p>'
                                        commentBox += '</div>'
                                        commentBox += '<pre class="comment comment' + recommentList[i].vs_cno + '">' + recommentList[i].vs_comment + '</pre>'
                                        commentBox += '<textarea name="vs_comment" class="comment_input comment_input' + recommentList.vs_cno + '">' + recommentList.vs_comment + '</textarea>'
                                        // commentBox += '<input type="text" name="vs_comment" class="comment_input' + recommentList[i].vs_cno + '" value="' + recommentList[i].vs_comment + '">'
    
                                        if (res.userId != null && res.userId != '' && res.userId == recommentList[i].vs_writer) {
                                            commentBox += '<div class="comment_btn">'
                                            commentBox += '<button type="button" class="updateCommentButton pointer" onclick="updateComment(' + data[i].vs_no + ',' + recommentList[i].vs_cno + ')">수정</button>'
                                            commentBox += '<button type="button" class="deleteCommentButton pointer" onclick="deleteComment(' + data[i].vs_no + ',' + recommentList[i].vs_cno + ')">삭제</button>'
                                            commentBox += '<button type="button" class="updateCancelButton pointer" onclick="updateCommentCancel()">취소</button>'
                                            commentBox += '</div>'
                                        }
                                    }
                                }
                            }
                            commentBox += '</div></div>'
                            $("#comment_area").append(commentBox);
                        }
                    } else {
                        $("#comment_area").html("");
                    }
                }
            });
        }
    }
}


// 댓글 수정 취소
function updateCommentCancel() {
    $(event.target).closest('.comment_btn').siblings('.comment_input').hide();
    $(event.target).closest('.comment_btn').siblings('pre.comment').show();
    $(event.target).closest('.comment_btn').children(".deleteCommentButton").show();
    $(event.target).closest('.comment_btn').children(".updateCancelButton").hide();
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
            success: function (res) {
                // console.log('res.userId: ', res.userId);
                let data = res.commentList;
                let recommentList = res.recommentList;
                // console.log(data.length);
                // console.log(recommentList);
                if (data.length > 0) {
                    $("#comment_area").html("");
                    for (let i = 0; i < data.length; i++) {
                        let commentBox = "";
                        let writer = data[i].vs_writer;
                        let recomment = data[i].vs_rcno;
                        let commentNum = data[i].vs_cno;
                        // console.log("data[i].vs_rcno: " + recomment);

                        if (recomment == 0) {
                            commentBox += "<div class='comment_box'>"
                            commentBox += "<div class='comment_info'>"
                            commentBox += "<p class='writer'>" + data[i].vs_writer + "</p>"
                            commentBox += "<button class='recomment_btn pointer' onclick='viewRecomment(" + data[i].vs_cno + ")'>답글보기</button>"
                            commentBox += "<p class='date'>" + data[i].vs_date + "</p>"
                            commentBox += "</div>"
                            commentBox += "<pre class='comment comment" + data[i].vs_cno + "'>" + data[i].vs_comment + "</pre>"
                            commentBox += "<textarea name='vs_comment' class='comment_input comment_input" + data[i].vs_cno + "'>" + data[i].vs_comment + '</textarea>'
                            // commentBox += "<input type='text' name='vs_comment' class='comment_input" + data[i].vs_cno + "' value='" + data[i].vs_comment + "'>";

                            if (res.userId != null && res.userId != '' && res.userId == writer) {
                                commentBox += "<div class='comment_btn'>"
                                    + "<button type='button' class='updateCommentButton pointer' onclick='updateComment(" + data[i].vs_no + "," + data[i].vs_cno + ")'>수정</button>"
                                    + "<button type='button' class='deleteCommentButton pointer' onclick='deleteComment(" + data[i].vs_no + "," + data[i].vs_cno + ")'>삭제</button>"
                                    + "<button type='button' class='updateCancelButton pointer' onclick='updateCommentCancel()'>취소</button>"
                                    + " </div>"
                            }

                            commentBox += '<div class="recomment_area' + data[i].vs_cno + ' recomment_area">'
                            commentBox += '<textarea name="vs_recomment" class="recomment_input recomment_input' + data[i].vs_cno + '" placeholder="답글 입력"></textarea>'
                            // commentBox += '<input type="text" name="vs_recomment" class="recomment_input recomment_input' + data[i].vs_cno + '" placeholder="답글 입력">'
                            commentBox += '<button class="pointer" onclick="insertRecomment(' + data[i].vs_no + ',' + data[i].vs_cno + ')">작성</button>'

                            for (let i = 0; i < recommentList.length; i++) {
                                if (commentNum == recommentList[i].vs_rcno) {
                                    commentBox += '<div class="recomment_info">'
                                    commentBox += '<p class="writer">' + recommentList[i].vs_writer + '</p>'
                                    commentBox += '<p class="date">' + recommentList[i].vs_date + '</p>'
                                    commentBox += '</div>'
                                    commentBox += '<pre class="comment comment' + recommentList[i].vs_cno + '">' + recommentList[i].vs_comment + '</pre>'
                                    commentBox += '<textarea name="vs_comment" class="comment_input comment_input' + recommentList.vs_cno + '">' + recommentList.vs_comment + '</textarea>'
                                    // commentBox += '<input type="text" name="vs_comment" class="comment_input' + recommentList[i].vs_cno + '" value="' + recommentList[i].vs_comment + '">'

                                    if (res.userId != null && res.userId != '' && res.userId == recommentList[i].vs_writer) {
                                        commentBox += '<div class="comment_btn">'
                                        commentBox += '<button type="button" class="updateCommentButton pointer" onclick="updateComment(' + data[i].vs_no + ',' + recommentList[i].vs_cno + ')">수정</button>'
                                        commentBox += '<button type="button" class="deleteCommentButton pointer" onclick="deleteComment(' + data[i].vs_no + ',' + recommentList[i].vs_cno + ')">삭제</button>'
                                        commentBox += '<button type="button" class="updateCancelButton pointer" onclick="updateCommentCancel()">취소</button>'
                                        commentBox += '</div>'
                                    }
                                }
                            }
                        }
                        commentBox += '</div></div>'
                        $("#comment_area").append(commentBox);
                    }
                } else {
                    $("#comment_area").html("");
                }
            }
        });
    }
}

// 답글 보기
function viewRecomment(seq) {
    let className = ".recomment_area" + seq;
    // console.log(className);

    $(className).toggle();
}

// 답글 작성
function insertRecomment(vs_no, vs_rcno) {
    let className = ".recomment_input" + vs_rcno;
    // console.log($(className).val());

    if ($(className).val() == null || $(className).val() == "") {
        alert("내용을 입력하세요.");
    } else {
        if (confirm("답글을 입력하시겠습니까?")) {
            $.ajax({
                type: "POST",
                url: "vs_recomment_insert.do",
                data: {
                    vs_no: vs_no,
                    vs_rcno: vs_rcno,
                    vs_comment: $(className).val()
                },
                cache: false,
                success: function (res) {
                    $(className).val("")
                    // console.log('res.userId: ', res.userId);
                    let data = res.commentList;
                    let recommentList = res.recommentList;
                    // console.log(data.length);
                    // console.log(recommentList);

                    $("#comment_area").html("");
                    if (data.length > 0) {
                        $("#comment_area").html("");
                        for (let i = 0; i < data.length; i++) {
                            let commentBox = "";
                            let writer = data[i].vs_writer;
                            let recomment = data[i].vs_rcno;
                            let commentNum = data[i].vs_cno;
                            // console.log("data[i].vs_rcno: " + recomment);
    
                            if (recomment == 0) {
                                commentBox += "<div class='comment_box'>"
                                commentBox += "<div class='comment_info'>"
                                commentBox += "<p class='writer'>" + data[i].vs_writer + "</p>"
                                commentBox += "<button class='recomment_btn pointer' onclick='viewRecomment(" + data[i].vs_cno + ")'>답글보기</button>"
                                commentBox += "<p class='date'>" + data[i].vs_date + "</p>"
                                commentBox += "</div>"
                                commentBox += "<pre class='comment comment" + data[i].vs_cno + "'>" + data[i].vs_comment + "</pre>"
                                commentBox += "<textarea name='vs_comment' class='comment_input comment_input" + data[i].vs_cno + "'>" + data[i].vs_comment + '</textarea>'
                                // commentBox += "<input type='text' name='vs_comment' class='comment_input" + data[i].vs_cno + "' value='" + data[i].vs_comment + "'>";
    
                                if (res.userId != null && res.userId != '' && res.userId == writer) {
                                    commentBox += "<div class='comment_btn'>"
                                        + "<button type='button' class='updateCommentButton pointer' onclick='updateComment(" + data[i].vs_no + "," + data[i].vs_cno + ")'>수정</button>"
                                        + "<button type='button' class='deleteCommentButton pointer' onclick='deleteComment(" + data[i].vs_no + "," + data[i].vs_cno + ")'>삭제</button>"
                                        + "<button type='button' class='updateCancelButton pointer' onclick='updateCommentCancel()'>취소</button>"
                                        + " </div>"
                                }
    
                                commentBox += '<div class="recomment_area' + data[i].vs_cno + ' recomment_area">'
                                commentBox += '<textarea name="vs_recomment" class="recomment_input recomment_input' + data[i].vs_cno + '" placeholder="답글 입력"></textarea>'
                                // commentBox += '<input type="text" name="vs_recomment" class="recomment_input recomment_input' + data[i].vs_cno + '" placeholder="답글 입력">'
                                commentBox += '<button class="pointer" onclick="insertRecomment(' + data[i].vs_no + ',' + data[i].vs_cno + ')">작성</button>'
    
                                for (let i = 0; i < recommentList.length; i++) {
                                    if (commentNum == recommentList[i].vs_rcno) {
                                        commentBox += '<div class="recomment_info">'
                                        commentBox += '<p class="writer">' + recommentList[i].vs_writer + '</p>'
                                        commentBox += '<p class="date">' + recommentList[i].vs_date + '</p>'
                                        commentBox += '</div>'
                                        commentBox += '<pre class="comment comment' + recommentList[i].vs_cno + '">' + recommentList[i].vs_comment + '</pre>'
                                        commentBox += '<textarea name="vs_comment" class="comment_input comment_input' + recommentList.vs_cno + '">' + recommentList.vs_comment + '</textarea>'
                                        // commentBox += '<input type="text" name="vs_comment" class="comment_input' + recommentList[i].vs_cno + '" value="' + recommentList[i].vs_comment + '">'
    
                                        if (res.userId != null && res.userId != '' && res.userId == recommentList[i].vs_writer) {
                                            commentBox += '<div class="comment_btn">'
                                            commentBox += '<button type="button" class="updateCommentButton pointer" onclick="updateComment(' + data[i].vs_no + ',' + recommentList[i].vs_cno + ')">수정</button>'
                                            commentBox += '<button type="button" class="deleteCommentButton pointer" onclick="deleteComment(' + data[i].vs_no + ',' + recommentList[i].vs_cno + ')">삭제</button>'
                                            commentBox += '<button type="button" class="updateCancelButton pointer" onclick="updateCommentCancel()">취소</button>'
                                            commentBox += '</div>'
                                        }
                                    }
                                }
                            }
                            commentBox += '</div></div>'
                            $("#comment_area").append(commentBox);
                        }
                    } else {
                        $("#comment_area").html("");
                    }
                }
            });
        }
    }
}
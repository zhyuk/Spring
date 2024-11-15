$(function () {
    console.log($(window).innerWidth());

    $("#ham-btn").click(function () {
        $("header #m-main-menu").toggle();
    });

    $("#m-main-menu .nav-community").click(function () {
        $(".m-sub-mp-menu").hide();
        $(".m-sub-cm-menu").toggle();
    });

    $("#m-main-menu .nav-mypage").click(function () {
        $(".m-sub-cm-menu").hide();
        $(".m-sub-mp-menu").toggle();
    });

    $(".main-menu .nav-community").click(function () {
        $(".sub-mp-menu").hide();
        $(".sub-cm-menu").toggle();
    });

    $(".main-menu .nav-mypage").click(function () {
        $(".sub-cm-menu").hide();
        $(".sub-mp-menu").toggle();
    });

    $(window).resize(function () {
        // 모바일 버전에서 적용
        if ($(window).innerWidth() < 426) {
            $(".sub-menu").hide();
        } else {
            // PC 버전에서 적용
            $("#m-main-menu").hide();
            $(".m-sub-menu").hide();
        }
    });
});
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <aside>
        <div class="logo-box">
            <a href="/admin_index.do"><img src="/resources/img/logo/admin_logo.png" alt="로고이미지"></a>
        </div>

        <nav class="pointer">
            <ul>
                <li class="main-menu"><a href="#">중고거래</a></li>
                <li class="main-menu"><a href="productsList.do">새상품</a></li>
                <li id="community_nav" class="main-menu">커뮤니티</li>
                <ul class="community_sub_nav sub-menu">
                    <li class="community_sub_menu"><a href="/adminYooka.do">육아정보</a></li>
                    <li class="community_sub_menu"><a href="#">놀이터</a></li>
                    <li class="community_sub_menu"><a href="#">쇼핑정보</a></li>
                    <li class="community_sub_menu"><a href="/vs_admin.do">고민거리</a></li>
                </ul>
                <li class="main-menu"><a href="getFaqAdminList.do">FAQ</a></li>
                <li class="main-menu"><a href="/userList.do">사용자관리</a></li>
                <li class="main-menu"><a href="/updateAdmin.do">관리자 비밀번호 변경</a></li>
            </ul>
        </nav>

        <button id="logout-btn"><a href="/admin_logout.do">로그아웃</a></button>


        <script>
            $("#community_nav").click(function () {
                $(".community_sub_nav").toggle();
            });
        </script>
    </aside>
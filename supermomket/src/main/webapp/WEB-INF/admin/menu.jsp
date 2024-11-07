<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <aside>
        <div class="logo-box">
            <a href="/admin_index.do"><img src="" alt="로고이미지"></a>
        </div>

        <nav class="pointer">
            <ul>
                <li class="main-menu"><a href="#">중고거래</a></li>
                <li class="main-menu"><a href="#">새상품</a></li>
                <li id="community_nav" class="main-menu">커뮤니티</li>
                <ul class="sub-menu">    
					<li class="community_sub_menu"><a href="#">육아정보</a></li>
					<li class="community_sub_menu"><a href="#">놀이터</a></li>
					<li class="community_sub_menu"><a href="#">쇼핑정보</a></li>
                    <li class="community_sub_menu"><a href="/vs_admin.do">고민거리</a></li>
                </ul>
                <li class="main-menu"><a href="#">FAQ</a></li>
                <li class="main-menu"><a href="#">마이페이지</a></li>
            </ul>
        </nav>

        <button><a href="/admin_logout.do">로그아웃</a></button>


        <script>
            $("#community_nav").click(function () {
                $(".sub-menu").toggle();
            });
        </script>
    </aside>
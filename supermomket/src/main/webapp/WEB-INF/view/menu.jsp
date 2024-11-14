<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<div id="wrap">
		<header>
			<div class="logo-box">
				<a href="/"><img src="/resources/img/logo/logo1.png" alt="로고"></a>

				<!-- PC버전 헤더 시작 -->
				<c:choose>
					<c:when test="${userId eq null }">
						<p class="login-btn m-hide">
							<a href="/login.do">로그인</a>
						</p>
					</c:when>
					<c:otherwise>
						<p class="logout-btn m-hide">
							<a href="/logout.do">로그아웃</a>
						</p>
					</c:otherwise>
				</c:choose>

				<div id="ham-btn" class="m-show">
					<span></span> <span></span><span></span>
				</div>
			</div>

			<nav>
				<ul class="main-menu">
					<li><a href="${pageContext.request.contextPath}/trade.do">중고거래</a></li>
					<li><a href="products.do">새상품</a></li>
					<li class="nav-community">커뮤니티
						<ul class="sub-cm-menu sub-menu">
							<li><a href="/getCommunity_yookaList.do">육아정보</a></li>
							<li><a href="/getCommunity_noriterList.do">놀이터</a></li>
							<li><a href="/getCommunity_shoppingList.do">쇼핑정보</a></li>
							<li><a href="/vs_index.do">고민거리</a></li>
						</ul>
					</li>
					<li><a href="getFaqUserList.do">FAQ</a></li>
					<li class="nav-mypage">마이페이지</a>
						<ul class="sub-mp-menu sub-menu">
							<li><a href="/buyList.do">주문 목록</a></li>
							<li><a href="/zzimList.do">찜 목록</a></li>
							<li><a href="/updateMypage.do">개인정보 수정</a></li>
							<li><a href="/updatePassword.do">비밀번호 수정</a></li>
						</ul>
					</li>
				</ul>

				<c:if test="${userId ne null }">
					<div class="userInfo-box m-hide">
						<p>
							<%=session.getAttribute("userNickname")%> 님
						</p>
						<button class="login-menu">
							<i class="fa-regular fa-envelope"></i>
						</button>
						<button class="login-menu">
							<a href="cartList.do?c_payment=ready">
								<i class="fa-solid fa-cart-shopping"></i>
							</a>
						</button>
					</div>
				</c:if>
			</nav>
			<!-- PC버전 헤더 종료 -->

			<!-- 모바일버전 헤더 시작 -->
			<nav class="m-show">
				<ul id="m-main-menu">
					<li><a href="${pageContext.request.contextPath}/trade.do">중고거래</a></li>
					<li><a href="products.do">새상품</a></li>
					<li class="nav-community">커뮤니티
						<ul class="m-sub-cm-menu m-sub-menu">
							<li><a href="/getCommunity_yookaList.do">육아정보</a></li>
							<li><a href="/getCommunity_noriterList.do">놀이터</a></li>
							<li><a href="/getCommunity_shoppingList.do">쇼핑정보</a></li>
							<li><a href="/vs_index.do">고민거리</a></li>
						</ul>
					</li>
					<li><a href="getFaqUserList.do">FAQ</a></li>
					<li class="nav-mypage">마이페이지</a>
						<ul class="m-sub-mp-menu m-sub-menu">
							<li><a href="/buyList.do">주문 목록</a></li>
							<li><a href="/zzimList.do">찜 목록</a></li>
							<li><a href="/updateMypage.do">개인정보 수정</a></li>
							<li><a href="/updatePassword.do">비밀번호 수정</a></li>
						</ul>
					</li>
				</ul>
			</nav>
			<!-- 모바일버전 헤더 종료 -->

			<div class="clear"></div>
		</header>
		<div class="clear"></div>

		<script>
			if (window.innerWidth > 425) {
				document.getElementsByClassName("nav-community")[0].addEventListener("click", function () {
					// console.log(window.getComputedStyle(document.getElementsByClassName("sub-menu")[0]).display);

					if (window.getComputedStyle(document.getElementsByClassName("sub-cm-menu")[0]).display == "none") {
						document.getElementsByClassName("sub-cm-menu")[0].style.display = "block";
					} else {
						document.getElementsByClassName("sub-cm-menu")[0].style.display = "none";
					}
				});
			} else {

			}

			if (window.innerWidth > 425) {
				document.getElementsByClassName("nav-mypage")[0].addEventListener("click", function () {
					// console.log(window.getComputedStyle(document.getElementsByClassName("sub-menu")[0]).display);

					if (window.getComputedStyle(document.getElementsByClassName("sub-mp-menu")[0]).display == "none") {
						document.getElementsByClassName("sub-mp-menu")[0].style.display = "block";
					} else {
						document.getElementsByClassName("sub-mp-menu")[0].style.display = "none";
					}
				});
			} else {

			}



		</script>
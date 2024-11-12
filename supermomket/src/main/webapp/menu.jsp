<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<div id="wrap">
		<header>
			<div class="logo-box">
				<a href="index.jsp"><img src="/resources/img/logo/logo1.png" alt="로고"></a>
			</div>

			<nav>
				<ul class="main-menu">
					<li><a href="${pageContext.request.contextPath}/trade.do">중고거래</a></li>
					<li><a href="products.do">새상품</a></li>
					<li class="nav-community">커뮤니티</li>
					<li><a href="getFaqUserList.do">FAQ</a></li>
					<li class="nav-mypage">마이페이지</a></li>
				</ul>

				<ul class="sub-menu">
					<li><a href="/getCommunity_yookaList.do">육아정보</a></li>
					<li><a href="/getCommunity_noriterList.do">놀이터</a></li>
					<li><a href="/getCommunity_shoppingList.do">쇼핑정보</a></li>
					<li><a href="/vs_index.do">고민거리</a></li>
				</ul>
				<ul class="sub-mp-menu">
					<li><a href="/buyList.do">주문 목록</a></li>
					<li><a href="/zzimList.do">찜 목록</a></li>
					<li><a href="/updateMypage.do">개인정보 수정</a></li>
					<li><a href="/updatePassword.do">비밀번호 수정</a></li>
				</ul>
			</nav>

			<div class="clear"></div>

			<div class="login-box">
				<c:choose>
					<c:when test="${userId eq null }">
						<p class="login-btn"><a href="/login.do">로그인</a></p>
					</c:when>

					<c:otherwise>
						<p>
							<%=session.getAttribute("userNickname")%>님
						</p>
						<c:if test="${not empty userId}">
							<a href="/logout.do">로그아웃</a>
						</c:if>
						<button>
							<i class="fa-regular fa-envelope"></i>
						</button>
						<button>
							<a href="cartList.do?c_payment=ready"><i class="fa-solid fa-cart-shopping"></i></a>
						</button>
					</c:otherwise>
				</c:choose>
			</div>

			<c:if test="${userId ne null }">
				<button class="m-menu login-menu">
					<i class="fa-regular fa-envelope"></i>
				</button>

				<button class="m-menu login-menu">
					<i class="fa-solid fa-cart-shopping"></i>
				</button>
			</c:if>
			<div class="clear"></div>

			<div class="ham-box m-menu">
				<span></span> <span></span> <span></span>
			</div>
		</header>
		<div class="clear"></div>

		<div id="m-nav" class="m-menu">
			<nav>
				<ul>
					<li class="main-menu"><a href="#">중고거래</a></li>
					<li class="main-menu"><a href="#">새상품</a></li>
					<li id="community_nav" class="main-menu">커뮤니티</li>
					<ul class="sub-menu">
						<li class="community_sub_menu"><a href="#">육아정보</a></li>
						<li class="community_sub_menu"><a href="#">놀이터</a></li>
						<li class="community_sub_menu"><a href="#">쇼핑정보</a></li>
						<li class="community_sub_menu"><a href="/vs_index.do">고민거리</a></li>
					</ul>
					<ul class="sub-mp-menu">
						<li class="mypage_sub_menu"><a href="/buyList.do">주문 목록</a></li>
						<li class="mypage_sub_menu"><a href="/zzimList.do">찜 목록</a></li>
						<li class="mypage_sub_menu"><a href="/updateMypage.do">개인정보 수정</a></li>
						<li class="mypage_sub_menu"><a href="/updatePassword.do">비밀번호 수정</a></li>
					</ul>
					<li><a href="getFaqUserList.do">FAQ</a></li>
					<li><a href="preparcartList.do?c_payment=preparation">결재페이지</a></li>
					<li>마이페이지</li>
				</ul>
				<c:choose>
					<c:when test="${userId eq null }">
						<p class="login-btn"><a href="login.jsp">로그인</a></p>
					</c:when>
					<c:otherwise>
						<div>
							<p>
								<%=session.getAttribute("userId")%>님
							</p>
							<p class="login-btn">
								<a href="/logout.do">로그아웃</a>
							</p>
						</div>
					</c:otherwise>

				</c:choose>
			</nav>
		</div>

		<script>

			window.addEventListener("resize", () => {
				let width = window.innerWidth;


			});

			if (window.innerWidth > 425) {
				document.getElementsByClassName("nav-community")[0].addEventListener("click", function () {
					// console.log(window.getComputedStyle(document.getElementsByClassName("sub-menu")[0]).display);

					if (window.getComputedStyle(document.getElementsByClassName("sub-menu")[0]).display == "none") {
						document.getElementsByClassName("sub-menu")[0].style.display = "flex";
					} else {
						document.getElementsByClassName("sub-menu")[0].style.display = "none";
					}
				});
			} else {

			}

			if (window.innerWidth > 425) {
				document.getElementsByClassName("nav-mypage")[0].addEventListener("click", function () {
					// console.log(window.getComputedStyle(document.getElementsByClassName("sub-menu")[0]).display);

					if (window.getComputedStyle(document.getElementsByClassName("sub-mp-menu")[0]).display == "none") {
						document.getElementsByClassName("sub-mp-menu")[0].style.display = "flex";
					} else {
						document.getElementsByClassName("sub-mp-menu")[0].style.display = "none";
					}
				});
			} else {

			}



		</script>
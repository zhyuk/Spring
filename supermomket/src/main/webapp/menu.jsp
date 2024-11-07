<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<div id="wrap">
		<header>
			<div class="logo-box">
				<a href="index.jsp"><img src="" alt="로고"></a>
			</div>

			<nav>
				<ul class="main-menu">
					<li>중고거래</li>
					<li>새상품</li>
					<li class="nav-community">커뮤니티</li>
					<li>FAQ</li>
					<li>마이페이지</li>
				</ul>

				<ul class="sub-menu">
					<li>육아정보</li>
					<li>놀이터</li>
					<li>쇼핑정보</li>
					<li><a href="/vs_index.do">고민거리</a></li>
				</ul>
			</nav>

			<div class="clear"></div>

			<div class="login-box">
				<c:choose>
					<c:when test="${userId eq null }">
						<p class="login-btn">
							<a href="login.jsp">로그인</a>
						</p>
					</c:when>

					<c:otherwise>
						<p>
							<%=session.getAttribute("userId")%>님
						</p>
						<p class="login-btn">
							<a href="/logout.do">로그아웃</a>
						</p>
						<button>
							<i class="fa-regular fa-envelope"></i>
						</button>
						<button>
							<i class="fa-solid fa-cart-shopping"></i>
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
					<li class="main-menu"><a href="#">FAQ</a></li>
					<li class="main-menu"><a href="#">마이페이지</a></li>
				</ul>
				<c:choose>
					<c:when test="${userId eq null }">
						<p class="login-btn">
							<a href="login.jsp">로그인</a>
						</p>
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



		</script>
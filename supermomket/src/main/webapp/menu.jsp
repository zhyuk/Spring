<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="wrap">
		<header>
			<div class="logo-box">
				<img src="" alt="로고">
			</div>

			<nav>
				<ul class="main-menu">
					<li>중고거래</li>
					<li>새상품</li>
					<li class="nav-community">커뮤니티</li>
					<li>FAQ</li>
					<li>마이페이지</li>
					<li><a href="/vs_admin.do">관리자 로그인</a></li>
				</ul>
				
				<ul class="sub-menu">
					<li>육아정보</li>
					<li>놀이터</li>
					<li>쇼핑정보</li>
					<li><a href="/vs_index.do">VS</a></li>
				</ul>
			</nav>

			<div class="clear"></div>

			<div class="login-box">
				<c:choose>
					<c:when test="${userid eq null }">
						<p>로그인</p>
					</c:when>

					<c:otherwise>
						<p><%=session.getAttribute("username")%>님
						</p>
						<p>로그아웃</p>
						<button>
							<i class="fa-regular fa-envelope"></i>
						</button>
						<button>
							<i class="fa-solid fa-cart-shopping"></i>
						</button>
					</c:otherwise>
				</c:choose>
			</div>

			<c:if test="${userid ne null }">
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
					<li>중고거래</li>
					<li>새상품</li>
					<li>커뮤니티</li>
					<li>FAQ</li>
					<li>마이페이지</li>
				</ul>
				<c:choose>
					<c:when test="${userid eq null }">
						<button class="login-btn">로그인</button>
					</c:when>
					<c:otherwise>
						<div>
							<p><%=session.getAttribute("username")%>님
							</p>
							<button>로그아웃</button>
						</div>
					</c:otherwise>

				</c:choose>
			</nav>
		</div>
		
		<script>
	    document.getElementsByClassName("nav-community")[0].addEventListener("mouseover", function () {
	        console.log("마우스 올림");
	        document.getElementsByClassName("sub-menu")[0].style.display = "flex";
	    });

	    document.getElementsByClassName("nav-community")[0].addEventListener("mouseout", function () {
	        console.log("마우스 내림");
	        document.getElementsByClassName("sub-menu")[0].style.display = "none";
	    });

	    document.getElementsByClassName("sub-menu")[0].addEventListener("mouseover", function () {
	        document.getElementsByClassName("sub-menu")[0].style.display = "flex";
	    });

	    document.getElementsByClassName("sub-menu")[0].addEventListener("mouseout", function () {
	        document.getElementsByClassName("sub-menu")[0].style.display = "none";
	    });
		</script>
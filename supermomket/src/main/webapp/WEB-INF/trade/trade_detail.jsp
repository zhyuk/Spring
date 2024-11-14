<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../view/header.jsp" %>

<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <title>${trade.t_product} - 상세 정보</title>
    <style>
    
    :root {
    
    --primary: #BE8168;
    --primary-light: #DDAF9C;
    --primary-dark: #A66D54;
    
    
    --secondary-light: #F5E6E0;
    --secondary: #E8D5CC;
    --secondary-dark: #D4BEB3;
 
    --accent: #4A3831;
    --accent-light: #7D6158;
}
    
.container {
    max-width: 420px;
    margin: 0 auto;
    padding: 16px;
    min-height: 100vh; /* 전체 높이 설정 */
    position: relative; /* 버튼 위치 기준점 */
    padding-bottom: 70px; /* 버튼 높이만큼 여백 추가 */
       margin-top:50px;
}


/* 이미지 슬라이더 컨테이너 */
.slider-container {
    position: relative;
    width: 100%;
    max-width: 420px;
    margin: 0 auto;
    height: 420px; /* 1:1 비율 유지 */
    background-color: #f8f9fa;
    overflow: hidden;
}

.slider-wrapper {
    position: relative;
    width: 100%;
    height: 420px;
 
}

.slider-image {
    position: absolute;
    width: 100%;
    height: 420px;
    object-fit: contain;
    opacity: 0;
    transition: opacity 0.5s ease-in-out;
    display: none;
}



.slider-image.active {
    opacity: 1;
    display: block;
   
}

 .slider-button {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    background: rgba(0, 0, 0, 0.5);
    color: white;
    padding: 10px 15px;
    border: none;
    cursor: pointer;
    z-index: 2;
    border-radius: 50%;
}

 .slider-button.left { left: 10px; }
 .slider-button.right { right: 10px; }

 .slider-dots {
    position: absolute;
    bottom: 20px;
    left: 50%;
    transform: translateX(-50%);
    display: flex;
    gap: 8px;
    z-index: 2;
}


.dot {
    width: 8px;
    height: 8px;
    border-radius: 50%;
    background-color: rgba(255, 255, 255, 0.5);
    cursor: pointer;
    transition: background-color 0.3s ease;
}


.dot.active {
    background-color: white;
}


.product-info {
    padding: 20px;
}

.product-title {
    font-size: 20px;
    font-weight: bold;
    margin-bottom: 15px;
    line-height: 1.4;
}

.post-time {
    color: #868e96;
    font-size: 14px;
    margin-bottom: 15px;
}

.product-price {
    font-size: 18px;
     color: var(--primary-dark);
    font-weight: bold;
    margin: 10px 0;
}



.product-tags {
    display: flex;
    gap: 5px;
    margin: 10px 0;
}

.tag {
    background-color: var(--secondary-light);
    color: var(--accent);
    padding: 4px 8px;
    border-radius: 4px;
}

.product-content {
    font-size: 16px;
    line-height: 1.6;
    color: #212529;
    margin: 20px 0;
    white-space: pre-line;
}

.seller-info {
    display: flex;
    align-items: center;
    margin: 15px 0;
    color: #212529;
    font-size: 14px;
}

.buttons {
    position: fixed;
    bottom: 0;
    left: 0;
    right: 0;
    padding: 12px 16px;
    background-color: white;
    border-top: 1px solid #e9ecef;
    display: flex;
    gap: 8px; /* 버튼 사이 간격 추가 */
    justify-content: flex-end; /* 오른쪽 정렬 */
    align-items: center;
    z-index: 1000;
    max-width: 420px;
    margin: 0 auto;
}


.button {
    background-color: var(--primary);
    color: white;
    border: none;
    border-radius: 4px;
    padding: 8px 16px;
    font-size: 14px;
    font-weight: bold;
    cursor: pointer;
    min-width: 80px;
    margin: 0 4px;
}

.button:last-child {
    margin-right: 0;
}

.button:first-child {
    margin-left: 0;
}

.button:hover {
    background-color: var(--primary-dark);
}

@media screen and (max-width: 420px) {
    .container {
        padding: 0;
        width: 100%;
    }
    
    .slider-container,
    .slider-wrapper,
    .slider-image {
        height: 100vw; /* 화면 너비에 맞춰 정사각형 유지 */
        max-height: 420px;
    }
    
    .buttons {
        width: 100%;
        padding: 10px;
    }
    
    .product-info {
        padding: 16px;
    }
}
    </style>
</head>
<body>
   
<%@ include file="../view/menu.jsp"%>
    <div class="container">
        <div class="slider-container">
            <div class="slider-wrapper">
                <c:forEach var="image" items="${imageList}" varStatus="status">
                    <img src="${pageContext.request.contextPath}/resources/img/trade/${image}" 
                         alt="상품 이미지 ${status.index + 1}" 
                         class="slider-image ${status.index == 0 ? 'active' : ''}" 
                         data-index="${status.index}">
                </c:forEach>
            </div>
            
            <c:if test="${fn:length(imageList) > 1}">
                <button class="slider-button left" onclick="changeImage(-1)"><i class="fas fa-chevron-left"></i></button>
                <button class="slider-button right" onclick="changeImage(1)"><i class="fas fa-chevron-right"></i></button>
                
                <div class="slider-dots">
                    <c:forEach var="image" items="${imageList}" varStatus="status">
                        <span class="dot ${status.index == 0 ? 'active' : ''}" 
                              onclick="showImage(${status.index})"></span>
                    </c:forEach>
                </div>
            </c:if>
        </div>
    
         <div class="product-info">
        <div class="item">
            <div class="product-title">${trade.t_product}</div>
            <div class="product-price">
                <fmt:formatNumber type="number" value="${trade.t_price}" pattern="#,###"/>원
            </div>
            <div class="post-time" data-date="${trade.t_date}"></div>
            <div class="product-tags">
                <span class="tag">${trade.t_condition}</span>
                <span class="tag">${trade.t_class}</span>
            </div>
            <div class="product-content">${trade.t_content}</div>
            <div class="seller-info">
                판매자: ${writerNickname}
            </div>
        </div>
    </div>
</div>

   
<div class="buttons" style="display: flex; justify-content: flex-end;">
    <c:choose>
        <c:when test="${sessionScope.userId eq trade.t_writer}">
            <button class="button" onclick="location.href='trade_modify.do?t_no=${trade.t_no}'">수정</button>
            <button class="button" onclick="deleteTrade(${trade.t_no})">삭제</button>
            <button class="button" onclick="location.href='${pageContext.request.contextPath}/chat/rooms.do'">채팅목록</button>
        </c:when>
        <c:otherwise>
            <button type="button" class="button" onclick="startChat()">채팅하기</button>
        </c:otherwise>
    </c:choose>
</div>

    <script>
        let userId = '${sessionScope.userId}';
        let currentIndex = 0;
        const images = document.querySelectorAll('.slider-image');
        const dots = document.querySelectorAll('.dot');
        const totalImages = images.length;

        function showImage(index) {
            if (totalImages === 0) return;
            
            // 현재 활성화된 이미지와 점의 클래스 제거
            images[currentIndex].classList.remove('active');
            if (dots.length > 0) {
                dots[currentIndex].classList.remove('active');
            }
            
            // 새로운 인덱스 설정
            currentIndex = index;
            
            // 인덱스가 범위를 벗어나면 조정
            if (currentIndex >= totalImages) currentIndex = 0;
            if (currentIndex < 0) currentIndex = totalImages - 1;
            
            // 새로운 이미지와 점 활성화
            images[currentIndex].classList.add('active');
            if (dots.length > 0) {
                dots[currentIndex].classList.add('active');
            }
        }

        function changeImage(direction) {
            showImage(currentIndex + direction);
        }

        // 키보드 이벤트 처리
        document.addEventListener('keydown', function(e) {
            if (e.key === 'ArrowLeft') {
                changeImage(-1);
            } else if (e.key === 'ArrowRight') {
                changeImage(1);
            }
        });

        function deleteTrade(t_no) {
            if (confirm('정말로 이 게시글을 삭제하시겠습니까?')) {
                location.href = 'deleteTrade.do?t_no=' + t_no;
            }
        }

        function getTimeAgo(dateString) {
            try {
                const date = new Date(dateString);
                const now = new Date();
                const diffInMillies = Math.max(0, now - date);
                const minute_ms = 60 * 1000;
                const hour_ms = 60 * minute_ms;
                const day_ms = 24 * hour_ms;

                if (diffInMillies < minute_ms) {
                    return '방금 전';
                } else if (diffInMillies < hour_ms) {
                    const minutes = Math.floor(diffInMillies / minute_ms);
                    return minutes + '분 전';  
                } else if (diffInMillies < day_ms) {
                    const hours = Math.floor(diffInMillies / hour_ms);
                    return hours + '시간 전';
                } else {
                    const days = Math.floor(diffInMillies / day_ms);
                    return days + '일 전';
                }
            } catch (error) {
                console.error('시간 계산 중 오류:', error);
                return '시간 계산 오류';
            }
        }

        document.addEventListener('DOMContentLoaded', function() {
            const postTimeEl = document.querySelector('.post-time');
            if (postTimeEl) {
                const dateString = postTimeEl.getAttribute('data-date');
                if (dateString && dateString.trim() !== '') {
                    const timeAgoText = getTimeAgo(dateString);
                    postTimeEl.textContent = timeAgoText;
                }
            }
        });

        function isLoggedIn() {
            return ${sessionScope.userId != null};
        }

        function startChat() {
            const sellerId = '${trade.t_writer}';
            const tNo = ${trade.t_no};
            const buyerId = '${sessionScope.userId}';
            
            if (!buyerId || buyerId === '') {
                alert('로그인이 필요합니다.');
                location.href = '/login.do';
                return;
            }
            
            if (sellerId === buyerId) {
                alert('자신의 상품입니다.');
                return;
            }
            
            location.href = '${pageContext.request.contextPath}/chat/createRoom.do?sellerId=' + 
                           encodeURIComponent(sellerId) + 
                           '&buyerId=' + encodeURIComponent(buyerId) + 
                           '&tNo=' + tNo;
        }
    </script>
</body>
</html>
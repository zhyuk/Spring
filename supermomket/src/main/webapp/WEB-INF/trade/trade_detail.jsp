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

.left-section {
    position: relative;
    width: 542px;
}


.container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 16px;
    display: flex;
    gap: 40px;
    margin-top: 0;
}

.navigation-path {
    padding: 16px;
    margin-top: 50px;
    margin-bottom: 8px;
    font-size: 14px;
    color: #868e96;
    max-width: 1200px;
    margin-left: auto;
    margin-right: auto;
}

 .navigation-path a {
    color: #868e96;
    text-decoration: none;
}

 .navigation-path a:hover {
    text-decoration: underline;
}

.navigation-path span {
    margin: 0 3px;
    color: #868e96;
}

 .current-page {
    color: #212529;
    font-weight: bold;
}
.slider-container {
    position: relative;
    width: 542px;
    height: 542px;
    background-color: #f8f9fa;
    overflow: hidden;
    flex-shrink: 0;
}

.slider-wrapper {
    position: relative;
    width: 100%;
    height: 100%;
}


.slider-image {
    position: absolute;
    width: 100%;
    height: 100%;
    object-fit: cover;
    opacity: 0;
    transition: opacity 0.5s ease-in-out;
    display: none;
    background-color: #f8f9fa;
  
}

 .stat-item {
 
 	COLOR:#868E96;
 
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
    background-color: black;
    cursor: pointer;
    transition: background-color 0.3s ease;
}


.dot.active {
    background-color: #FAECBF;
}


.product-info {
    flex: 1;
    padding: 0;
    min-width: 400px;
    margin-left:10px;
}

.product-title {
    font-size: 24px;
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
    font-size: 20px;
    
    font-weight: bold;
    margin: 10px 0;
}



.product-tags {
    display: flex;
    gap: 5px;
    margin: 10px 0;
}

.tag {
    background-color: #FAECBF;
    color: var(--accent);
    padding: 4px 8px;
    border-radius: 4px;
}

.product-content {
    font-size: 18px;
    line-height: 1.6;
    color: #212529;
    margin: 20px 0;
    white-space: pre-line;
}

.seller-info {
    margin-top: 12px;
    padding: 8px 12px;
    display: flex;
    flex-direction: column;
    gap: 4px;
}

.seller-name {
    font-weight: bold;
    font-size: 20px;
    color: #212529;
}


.seller-location {
    color: #868e96;
    font-size: 16px;
}



.buttons {
    position: relative;
    padding: 12px 16px;
    background-color: white;
    border-top: 1px solid #e9ecef;
    display: flex;
    gap: 8px;
    justify-content: flex-end;
    align-items: center;
    max-width: 420px;
    margin: 0 auto 20px auto;
}


select.button {
    appearance: none;
    -webkit-appearance: none;
    -moz-appearance: none;
    background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='white'%3e%3cpath d='M7 10l5 5 5-5z'/%3e%3c/svg%3e");
    background-repeat: no-repeat;
    background-position: right 8px center;
    background-size: 16px;
    padding-right: 32px;
    cursor: pointer;
}

select.button option {
    background-color: white;
    color: var(--accent);
}

.button {
    background-color: BLACK;
    color: white;
    border: none;
    border-radius: 4px;
    padding: 8px 8px;
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
    background-color: white;
    color:black;
    border:2px solid;
}

.status-badge {
    display: inline-block;
    padding: 6px 12px;
    border-radius: 4px;
    font-size: 14px;
    font-weight: bold;
    margin-bottom: 12px;
}

.status-badge.SELLING {
    background-color: #22C55E;
    color: white;
}

.status-badge.RESERVED {
    background-color: #EAB308;
    color: white;
}

.status-badge.COMPLETED {
    background-color: #94A3B8;
    color: white;
}

@media screen and (max-width: 1200px) {
    .container {
        padding: 16px;
        margin: 0 16px;
    }

    .navigation-path {
        margin: 50px 16px 8px 16px;
    }
}

@media screen and (max-width: 425px) {
    .navigation-path {
        padding: 12px 16px;
        margin-top: 0;
        margin-left: 0;
        margin-right: 0;
        font-size: 12px;
    }

    .container {
        flex-direction: column;
        padding: 0;
        gap: 0;
        width: 100%;
        margin: 0;
    }

    .left-section {
        width: 100%;
    }

    .slider-container {
             width: 100%;
        height: auto;
        aspect-ratio: 1 / 1;
        overflow: hidden;
        touch-action: pan-x;
    }

      .slider-wrapper {
        width: 100%;
        height: 100%;
    }

    .slider-image {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    .slider-button {
        display: none;
    }

   

    .product-info {
        min-width: unset;
        padding: 16px;
        width: 100%;
        margin-left: 0;
    }

    .product-title {
        font-size: 18px;
        margin-bottom: 12px;
    }

    .product-price {
        font-size: 18px;
        margin: 8px 0;
    }

    .post-time {
        font-size: 12px;
        margin-bottom: 12px;
    }

    .product-tags {
        gap: 4px;
        margin: 8px 0;
    }

    .tag {
        font-size: 12px;
        padding: 3px 6px;
    }

    .product-content {
        font-size: 14px;
        line-height: 1.5;
        margin: 16px 0 20px 0;
    }

    .status-badge {
        padding: 4px 8px;
        font-size: 12px;
        margin-bottom: 8px;
    }

    .stat-item {
        font-size: 12px;
    }

    .seller-info {
        padding: 12px 16px;
        margin-top: 0;
    }

    .seller-name {
        font-size: 16px;
    }

    .seller-location {
        font-size: 14px;
    }

    .buttons {
        width: 100%;
        max-width: 100%;
        padding: 12px 16px;
        gap: 4px;
        margin: 0;
        flex-wrap: wrap; 
        justify-content: center; 
    }

        select.button {
        flex: 0 1 auto; 
        min-width: auto;
        width: calc(50% - 4px); 
    }

    .button {
        padding: 8px 8px;
        font-size: 12px; 
        width: calc(50% - 4px); 
        min-width: unset; 
        margin: 2px; 
        white-space: nowrap; 
    }

    .slider-dots {
        bottom: 16px;
    }

    .dot {
        width: 6px;
        height: 6px;
    }
}
    </style>
   

</head>
<body>
    <%@ include file="../view/menu.jsp"%>
    <div class="navigation-path">
        <a href="${pageContext.request.contextPath}/index.jsp">홈</a>
        <span>></span>
        <a href="${pageContext.request.contextPath}/trade.do">중고거래</a>
        <span>></span>
        <span class="current-page">${trade.t_product}</span>
    </div>
    <div class="container">
        <div class="left-section">
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
            <div class="seller-info">
                <span class="seller-name">${writerNickname}</span>
                <span class="seller-location">${fn:split(userLocation, ' ')[0]}</span>
            </div>
        </div>
        <div class="product-info">
            <div class="item">
                <div class="status-badge ${not empty trade.t_status ? trade.t_status : 'SELLING'}" id="statusBadge">
                    ${trade.t_status eq 'SELLING' ? '판매중' : 
                      trade.t_status eq 'RESERVED' ? '예약중' : 
                      trade.t_status eq 'COMPLETED' ? '거래완료' : '판매중'}
                </div>
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
                <div class="post-stats">
                    <div class="stat-item">
                        <i class="fas fa-eye"></i>
                        <span>조회 ${trade.t_cnt}</span>
                        <i class="fas fa-comments"></i>
                        <span>채팅 ${chatRoomCount}</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="buttons">
        <c:choose>
            <c:when test="${sessionScope.userId eq trade.t_writer}">
                <select class="button" id="statusSelect">
                    <option value="SELLING" ${empty trade.t_status or trade.t_status eq 'SELLING' ? 'selected' : ''}>판매중</option>
                    <option value="RESERVED" ${trade.t_status eq 'RESERVED' ? 'selected' : ''}>예약중</option>
                    <option value="COMPLETED" ${trade.t_status eq 'COMPLETED' ? 'selected' : ''}>거래완료</option>
                </select>
                <button class="button" onclick="location.href='trade_modify.do?t_no=${trade.t_no}'">수정</button>
                <button class="button" onclick="deleteTrade('${trade.t_no}')">삭제</button>
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

        let touchStartX = 0;
        let touchEndX = 0;

        function showImage(index) {
            if (totalImages === 0) return;

            images[currentIndex].classList.remove('active');
            if (dots.length > 0) {
                dots[currentIndex].classList.remove('active');
            }

            currentIndex = index;

            if (currentIndex >= totalImages) currentIndex = 0;
            if (currentIndex < 0) currentIndex = totalImages - 1;

            images[currentIndex].classList.add('active');
            if (dots.length > 0) {
                dots[currentIndex].classList.add('active');
            }
        }

        document.addEventListener('DOMContentLoaded', function() {
            const sliderContainer = document.querySelector('.slider-container');

            const statusSelect = document.getElementById('statusSelect');
            if (statusSelect) {
                statusSelect.addEventListener('change', function() {
                    updateStatus(this.value);
                });
            }

            const postTimeEl = document.querySelector('.post-time');
            if (postTimeEl) {
                const dateString = postTimeEl.getAttribute('data-date');
                if (dateString && dateString.trim() !== '') {
                    const timeAgoText = getTimeAgo(dateString);
                    postTimeEl.textContent = timeAgoText;
                }
            }

            if (sliderContainer) {
                sliderContainer.addEventListener('touchstart', function(e) {
                    touchStartX = e.touches[0].clientX;
                });

                sliderContainer.addEventListener('touchend', function(e) {
                    touchEndX = e.changedTouches[0].clientX;
                    handleSwipe();
                });
            }
        });

        function handleSwipe() {
            const difference = touchStartX - touchEndX;
            if (Math.abs(difference) > 50) {
                if (difference > 0) {
                    changeImage(1);
                } else {
                    changeImage(-1);
                }
            }
        }

        function updateStatus(status) {
            if (!confirm('거래 상태를 변경하시겠습니까?')) {
                document.getElementById('statusSelect').value = '${trade.t_status}';
                return;
            }

            const formData = new FormData();
            formData.append('t_no', '${trade.t_no}');
            formData.append('status', status);

            fetch('updateTradeStatus.do', {
                method: 'POST',
                body: formData
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    const statusBadge = document.getElementById('statusBadge');
                    statusBadge.classList.remove('SELLING', 'RESERVED', 'COMPLETED');
                    statusBadge.classList.add('status-badge', status);

                    let statusText = '판매중';
                    if (status === 'RESERVED') statusText = '예약중';
                    else if (status === 'COMPLETED') statusText = '거래완료';

                    statusBadge.textContent = statusText;
                    document.getElementById('statusSelect').value = status;

                    console.log('상태 업데이트 성공:', status);
                } else {
                    throw new Error(data.message || '상태 변경에 실패했습니다.');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('상태 변경 중 오류가 발생했습니다.');
                document.getElementById('statusSelect').value = '${trade.t_status}';
            });
        }

        function changeImage(direction) {
            showImage(currentIndex + direction);
        }

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

        function isLoggedIn() {
            return '${sessionScope.userId}' !== 'null';
        }

        function startChat() {
            const sellerId = '${trade.t_writer}';
            const tNo = '${trade.t_no}';
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
    <%@ include file="../view/footer.jsp" %>
</body>
</html>
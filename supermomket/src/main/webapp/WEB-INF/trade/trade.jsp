<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
   <%@ include file="../../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고거래</title>
<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

.container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 20px;
}


.content-wrapper {
    display: flex;
    gap: 30px;
}


.filter-section {
    width: 200px;
    flex-shrink: 0;
    position: sticky;
    top: 20px;
    height: fit-content;
    margin-top:20px;
}

.filter-title {
    font-size: 16px;
    font-weight: bold;
    margin-bottom: 15px;
}

.filter-options {
    display: flex;
    flex-direction: column;
    gap: 12px;
}

.filter-option {
    cursor: pointer;
    padding: 8px 0;
    color: #868e96;
}

.filter-option.active {
    color: #DDAF9C;
    font-weight: bold;
}


.main-content {
    flex: 1;
    min-width: 0;
    margin-top:20px;
}

.search-input-wrapper {
    position: relative;
    width: 100%;
    margin-bottom: 20px;
}

.search-input {
    width: 100%;
    padding: 12px 40px 12px 15px;
    border: 1px solid #e9ecef;
    border-radius: 8px;
    font-size: 16px;
}

.search-button {
    position: absolute;
    right: 10px;
    top: 50%;
    transform: translateY(-50%);
    background: none;
    border: none;
    cursor: pointer;
}

.header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 20px;
}

.write-btn {
    background-color: #DDAF9C;
    color: black;
    border: none;
    padding: 10px 20px;
    border-radius: 8px;
    cursor: pointer;
    text-decoration: none;
    font-weight: bold;
}


.grid {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 20px;
}
.item {
    width: 100%;
    border: 1px solid #eee;
    border-radius: 8px;
    overflow: hidden;
    transition: transform 0.2s;
    height: 320px; /* 고정 높이 설정 */
}


.item:hover {
    transform: translateY(-4px);
    box-shadow: 0 4px 10px rgba(0,0,0,0.1);
}

.item img {
    width: 100%;
    height: 220px;
    object-fit: cover;
}


.item-info {
    padding: 12px;
    height: 100px;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
}


.item-title {
    font-size: 16px;
    line-height: 1.3;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    margin-bottom: 4px;
}

.item-price {
    font-weight: bold;
    font-size: 18px;
    color: #212529;
    margin-bottom: 4px;
}
 .post-time {
    font-size: 13px;
    color: #868e96;
}


.category-filter {
    margin-top: 30px;
}

.item-link {
    text-decoration: none;
    color: inherit;
}

.category-title {
    font-size: 16px;
    font-weight: bold;
    margin-bottom: 15px;
}

.category-list {
    list-style: none;
    padding: 0;
}

.category-option {
    display: flex;
    align-items: center;
    padding: 8px 0;
    cursor: pointer;
    color: #4d4d4d;
    font-size: 14px;
}

.category-option input[type="checkbox"] {
    margin-right: 10px;
    width: 18px;
    height: 18px;
    border: 1px solid #ddd;
    border-radius: 50%;
    appearance: none;
    cursor: pointer;
}

.category-option input[type="checkbox"]:checked {
    background-color: #DDAF9C;
    border-color: #DDAF9C;
}

.category-option:hover {
    color: #DDAF9C;
}

@media (max-width: 1024px) {
    .grid {
        grid-template-columns: repeat(2, 1fr);
    }
}

@media (max-width: 768px) {
    .content-wrapper {
        flex-direction: column;
    }
    
    .filter-section {
        width: 100%;
        position: relative;
    }
    
    .grid {
        grid-template-columns: repeat(1, 1fr);
    }
}
</style>
</head>
<body>
<%@ include file="../../menu.jsp"%>
    <div class="container">
        <form id="filterForm" action="${pageContext.request.contextPath}/trade.do" method="post">
            <input type="hidden" name="sortCondition" value="${param.sortCondition}">
            <input type="hidden" name="categories" value="${selectedCategories}">
            
            <div class="content-wrapper">
               
                <div class="filter-section">
                    <h3 class="filter-title">필터</h3>
                    <div class="filter-options">
                        <span class="filter-option ${param.sortCondition == 'latest' || param.sortCondition == null ? 'active' : ''}" 
                              data-sort="latest">최신순</span>
                        <span class="filter-option ${param.sortCondition == 'lowPrice' ? 'active' : ''}" 
                              data-sort="lowPrice">낮은가격순</span>
                        <span class="filter-option ${param.sortCondition == 'highPrice' ? 'active' : ''}" 
                              data-sort="highPrice">높은가격순</span>
                    </div>

                   <div class="category-filter">
    <h3 class="category-title">카테고리</h3>
    <ul class="category-list">
        <li class="category-option">
            <input type="checkbox" id="motorcycle" name="category" value="오토바이"
                   ${selectedCategories.contains('오토바이') ? 'checked' : ''}>
            <label for="motorcycle">오토바이</label>
        </li>
        <li class="category-option">
            <input type="checkbox" id="electronics" name="category" value="전자기기"
                   ${selectedCategories.contains('전자기기') ? 'checked' : ''}>
            <label for="electronics">전자기기</label>
        </li>
        <li class="category-option">
            <input type="checkbox" id="clothing" name="category" value="의류"
                   ${selectedCategories.contains('의류') ? 'checked' : ''}>
            <label for="clothing">의류</label>
        </li>
        <li class="category-option">
            <input type="checkbox" id="accessories" name="category" value="잡화"
                   ${selectedCategories.contains('잡화') ? 'checked' : ''}>
            <label for="accessories">잡화</label>
        </li>
        <li class="category-option">
            <input type="checkbox" id="furniture" name="category" value="가구/인테리어"
                   ${selectedCategories.contains('가구/인테리어') ? 'checked' : ''}>
            <label for="furniture">가구/인테리어</label>
        </li>
        <li class="category-option">
            <input type="checkbox" id="baby" name="category" value="출산/유아동"
                   ${selectedCategories.contains('출산/유아동') ? 'checked' : ''}>
            <label for="baby">출산/유아동</label>
        </li>
        <li class="category-option">
            <input type="checkbox" id="sports" name="category" value="스포츠/레저"
                   ${selectedCategories.contains('스포츠/레저') ? 'checked' : ''}>
            <label for="sports">스포츠/레저</label>
        </li>
        <li class="category-option">
            <input type="checkbox" id="beauty" name="category" value="뷰티/미용"
                   ${selectedCategories.contains('뷰티/미용') ? 'checked' : ''}>
            <label for="beauty">뷰티/미용</label>
        </li>
    </ul>
</div>
</div>

               
                <div class="main-content">
                    <div class="search-input-wrapper">
                        <input class="search-input" type="text" name="searchKeyword" 
                               placeholder="어떤 상품을 찾으시나요?" value="${param.searchKeyword}">
                        <button type="submit" class="search-button">🔍</button>
                    </div>

                    <div class="header">
                        <h2>방금 등록된 상품</h2>
                        <c:choose>
                            <c:when test="${empty userId}">
                                <a class="write-btn" href="${pageContext.request.contextPath}/login.do" 
                                   onclick="alert('로그인이 필요한 서비스입니다.')">글쓰기</a>
                            </c:when>
                            <c:otherwise>
                                <a class="write-btn" href="${pageContext.request.contextPath}/trade_write.do">글쓰기</a>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <div class="grid">
                        <c:forEach var="trade" items="${tradeList}">
                            <a href="${pageContext.request.contextPath}/trade_detail.do?t_no=${trade.t_no}" 
                               class="item-link">
                                <div class="item">
                                    <c:set var="firstImage" value="${trade.t_img.split(',')[0]}" />
                                    <img src="${pageContext.request.contextPath}/resources/img/trade/${firstImage}" 
                                         alt="상품 이미지">
                                    <div class="item-info">
                                        <div class="item-title">${trade.t_product}</div>
                                        <div class="item-price">
                                            <fmt:formatNumber value="${trade.t_price}" pattern="#,###"/>원
                                        </div>
                                        <div class="post-time" data-date="${trade.t_date}"></div>
                                    </div>
                                </div>
                            </a>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <script>
    document.addEventListener('DOMContentLoaded', function() {
        const form = document.getElementById('filterForm');
        const categoryCheckboxes = document.querySelectorAll('.category-option input[type="checkbox"]');
        const filterOptions = document.querySelectorAll('.filter-option');
        const sortInput = form.querySelector('input[name="sortCondition"]');

        // 카테고리 체크박스 이벤트
        categoryCheckboxes.forEach(checkbox => {
            checkbox.addEventListener('change', function() {
                const selectedCategories = Array.from(categoryCheckboxes)
                    .filter(cb => cb.checked)
                    .map(cb => cb.value);

                form.querySelector('input[name="categories"]').value = selectedCategories.join(',');
                form.submit();
            });
        });

        // 정렬 옵션 이벤트
        filterOptions.forEach(option => {
            option.addEventListener('click', function() {
                filterOptions.forEach(opt => opt.classList.remove('active'));
                this.classList.add('active');
                sortInput.value = this.getAttribute('data-sort');
                form.submit();
            });
        });

        // 시간 표시 처리
        const items = document.querySelectorAll('.item');
        items.forEach(item => {
            const dateString = item.querySelector('.post-time').getAttribute('data-date');
            if (dateString) {
                const timeAgoText = getTimeAgo(dateString);
                item.querySelector('.post-time').textContent = timeAgoText;
            }
        });
    });

    function getTimeAgo(dateString) {
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
    }
    
   
    </script>
</body>
</html>

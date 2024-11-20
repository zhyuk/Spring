<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
  <%@ include file="../view/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<meta charset="UTF-8">
<title>중고거래</title>
<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
/*     font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif; */
}

body {
    background-color: #f8f9fa;
    color: #333;
}

.container {
    max-width: 1280px;
    margin: 0 auto;
    padding: 32px 24px;
}

.content-wrapper {
    display: flex;
    gap: 40px;
    width: 100%;
}


.image-container.COMPLETED {
    position: relative;
}

.image-container.COMPLETED::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.4); /* 어두운 오버레이 */
    z-index: 1;
}

.image-container.COMPLETED img {
    filter: grayscale(100%); /* 흑백 처리 */
}

.COMPLETED .status-overlay {
    background-color: rgba(0, 0, 0, 0.8);
    color: white;
    font-weight: bold;
    padding: 10px 20px;
    border-radius: 8px;
    font-size: 15px;
    z-index: 2;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
}


.filter-section {
    width: 240px;
    flex-shrink: 0;
    position: sticky;
    top: 32px;
    height: fit-content;
    background: white;
    padding: 24px;
    border-radius: 16px;
    box-shadow: 0 2px 12px rgba(0,0,0,0.04);
}

.filter-title, .category-title {
    font-size: 18px;
    font-weight: 600;
    margin-bottom: 20px;
    color: #111;
}

.filter-options {
    display: flex;
    flex-direction: column;
    gap: 8px;
}

.status-filter {
    margin-top: 32px;
    border-top: 1px solid #eee;
    padding-top: 24px;
}

.filter-options {
    display: flex;
    flex-direction: column;
    gap: 8px;
}

.filter-option {
     padding: 10px 8px;
    border-radius: 8px;
    cursor: pointer;
    color: #666;
    transition: all 0.2s ease;
    font-size: 14px;
}

.filter-option:hover {
  background-color: #f5f5f5;
    color: #111;
}

.filter-option.active {
       background-color: #f5f5f5;
    color: #111;
    font-weight: 600;
}




.main-content {
    flex: 1;
    min-width: 0;
}


.search-input-wrapper {
    position: relative;
    margin-bottom: 32px;
}

.search-input {
    width: 100%;
    padding: 16px 48px 16px 20px;
    border: none;
    border-radius: 12px;
    font-size: 15px;
    background-color: white;
    box-shadow: 0 2px 8px rgba(0,0,0,0.04);
    transition: all 0.2s ease;
}

.search-input:focus {
    outline: none;
    box-shadow: 0 0 0 2px #111;
}

.search-button {
    position: absolute;
    right: 16px;
    top: 50%;
    transform: translateY(-50%);
    background: none;
    border: none;
    color: #666;
    cursor: pointer;
    padding: 8px;
    transition: color 0.2s ease;
}

.search-button:hover {
    color: #111;
}


.header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 32px;
}

.write-btn {
    display: inline-block;
    background-color: black;
    color: white !important;
    border: none;
    padding: 12px 24px;
    border-radius: 8px;
    cursor: pointer;
    text-decoration: none;
    font-weight: 500;
    font-size: 15px;
    transition: all 0.2s ease;
}

.write-btn:hover {
     background-color: #333;
    transform: translateY(-2px);
}


.grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
    gap: 24px;
    margin-bottom: 48px;
}


.item {
    height: auto;
    border: none;
    border-radius: 16px;
    overflow: hidden;
    background-color: white;
    box-shadow: 0 2px 12px rgba(0,0,0,0.04);
    transition: all 0.3s ease;
}

.image-container {
    position: relative;
    padding-top: 100%;
}

.image-container img {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    object-fit: cover;
    transition: transform 0.3s ease;
}

.status-overlay {
    position: absolute;
    top: 12px;
    left: 12px;
    padding: 8px 16px;
    border-radius: 8px;
    font-size: 14px;
    font-weight: 600;
    z-index: 1;
    backdrop-filter: blur(4px);
}

.RESERVED .status-overlay {
    background-color: rgba(250, 204, 21, 0.9);
    color: #111;
}

.COMPLETED .status-overlay {
    background-color: rgba(107, 114, 128, 0.9);
    color: white;
}

.item-info {
    padding: 20px;
    height: 120px; /* 고정된 높이 설정 */
    display: flex;
    flex-direction: column;
}

.item-title {
    font-size: 15px;
    line-height: 1.5;
    margin-bottom: 12px;
    color: #111;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    overflow: hidden;
    flex: 1;
    word-break: break-word;
}

.item-price {
    font-size: 17px;
    font-weight: 700;
    color: #111;
    margin-bottom: 8px;
}

.post-time {
    font-size: 13px;
    color: #9ca3af;
}


.category-filter {
    margin-top: 32px;
}

.category-list {
    display: flex;
    flex-direction: column;
    gap: 8px;
}

.category-option {
    display: flex;
    align-items: center;
    padding: 8px 0;
    cursor: pointer;
    color: #4d4d4d;
    font-size: 14px;
}

.category-option:hover {
    color: black;
}

.category-option input[type="checkbox"] {
    margin-right: 10px;
    width: 18px;
    height: 18px;
    border: 1px solid #ddd;
    border-radius: 50%;
    appearance: none;
    cursor: pointer;
    transition: all 0.2s ease;
}

.category-option input[type="checkbox"]:checked {
    background-color: black;
    border-color: black;
    position: relative;
}


.category-option input[type="checkbox"]:checked::after {
    content: '';
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 8px;
    height: 8px;
    background-color: white;
    border-radius: 50%;
}


.pagination {
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 8px;
    margin: 48px 0;
}


.filter-toggle,
.filter-close {
    display: none;
}

.page-link {
    display: flex;
    align-items: center;
    justify-content: center;
    width: 40px;
    height: 40px;
    border-radius: 8px;
    color: #666;
    text-decoration: none;
    font-weight: 500;
    transition: all 0.2s ease;
}

.page-link:hover {
    background-color: #f8f9fa;
    color: #111;
}

.page-link.active {
    background-color: #111;
    color: white;
}



@media (max-width: 1024px) {
    .grid {
        grid-template-columns: repeat(2, 1fr);
    }
}

@media screen and (max-width: 425px) {


   .status-filter {
        margin-top: 24px;
        padding-top: 16px;
    }


   body.filter-active {
        overflow: hidden;
    }

   .pagination {
        gap: 4px;
        margin-top: 24px;
        margin-bottom: 24px;
    }

    .page-link {
        width: 32px;
        height: 32px;
        font-size: 13px;
    }

     .container {
        padding: 12px 8px;
    }

    .content-wrapper {
        flex-direction: column;
        gap: 16px;
    }

       .filter-section {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100vh;
        background: #fff;
        z-index: 999;
        padding: 20px;
        overflow-y: auto;
    }

   .filter-section.active {
        display: block !important;
    }


    /* 필터 토글 버튼 */
    .filter-toggle {
    display: block !important;
        top: 16px;
        right: 16px;
        z-index: 1000;
        background-color: #000;
        color: #fff;
        border: none;
        padding: 8px 12px;
        border-radius: 8px;
        cursor: pointer;
        font-size: 14px;
        box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        margin-top:150px;
    }
   .filter-close {
        display: block !important; /* !important로 강제 적용 */
        position: absolute;
        top: 16px;
        right: 16px;
        z-index: 1001;
        background: none;
        border: none;
        color: #000;
        font-size: 24px;
        cursor: pointer;
        padding: 8px;
    }

   
       .grid {
        gap: 8px;
        margin-bottom: 24px;
    }

      .item {
        height: auto;
        min-height: auto; /* min-height 제거 */
        margin-bottom: 12px;
        border-radius: 12px;
    }

      .image-container {
        height: 200px;
        margin-bottom: 0; /* 이미지 아래 마진 제거 */
    }

       .image-container img {
        height: 200px;
    }

   
    .search-input-wrapper {
        margin-top: 50px;
        margin-bottom: 16px;
    }

    .search-input {
        padding: 10px 35px 10px 12px;
        font-size: 14px;
    }

    .search-button {
        width: 30px;
        height: 30px;
        right: 8px;
        font-size: 14px;
    }

   
    .header {
        flex-direction: column;
        gap: 8px;
        align-items: flex-start;
        margin-bottom: 16px;
    }

    .header h2 {
        font-size: 18px;
    }

  
    .write-btn {
           width: 100%;
        text-align: center;
        padding: 10px;
        font-size: 14px;
    }

      .item-info {
        padding: 8px 10px;
        height: 100px;
    }

       .item-title {
        font-size: 14px;
        margin-bottom: 2px;
        line-height: 1.2;
    }
      .item-price {
        font-size: 16px;
        margin-bottom: 2px;
        line-height: 1.1;
    }

      .post-time {
        font-size: 12px;
        color: #999;
    }

    /* 상태 오버레이 */
    .status-overlay {
        padding: 6px 12px;
        font-size: 14px;
    }


    .filter-option {
     padding: 10px 14px;
        font-size: 13px;
    }

      .category-option input[type="checkbox"] {
        width: 16px;
        height: 16px;
    }

    .category-option input[type="checkbox"]:checked::after {
        width: 6px;
        height: 6px;
    }
    
      .COMPLETED .status-overlay {
        padding: 8px 16px;
        font-size: 14px;
    }
}
</style>
</head>
<body>
<%@ include file="../view/menu.jsp"%>
 <button class="filter-toggle" id="filterToggle">
        <i class="fas fa-filter"></i> 필터
    </button>

    <div class="container">
        <form id="filterForm" action="${pageContext.request.contextPath}/trade.do" method="post">
            <input type="hidden" name="sortCondition" value="${param.sortCondition}">
            <input type="hidden" name="categories" value="${selectedCategories}">
             <input type="hidden" name="status" value="${param.status}">
            <div class="content-wrapper">
               
                 <div class="filter-section" id="filterSection">
                 <button type="button" class="filter-close" id="filterClose">&times;</button>
                    <h3 class="filter-title">필터</h3>
                    <div class="filter-options">
                        <span class="filter-option ${param.sortCondition == 'latest' || param.sortCondition == null ? 'active' : ''}" 
                              data-sort="latest">최신순</span>
                        <span class="filter-option ${param.sortCondition == 'lowPrice' ? 'active' : ''}" 
                              data-sort="lowPrice">낮은가격순</span>
                        <span class="filter-option ${param.sortCondition == 'highPrice' ? 'active' : ''}" 
                              data-sort="highPrice">높은가격순</span>
                    </div>
                    
                   <div class="status-filter">
    <h3 class="filter-title">상태</h3>
    <div class="filter-options">
        <span class="filter-option ${param.status == null ? 'active' : ''}" 
              data-status="">전체</span>
        <span class="filter-option ${param.status == 'SELLING' ? 'active' : ''}" 
              data-status="SELLING">판매중</span>
        <span class="filter-option ${param.status == 'RESERVED' ? 'active' : ''}" 
              data-status="RESERVED">예약중</span>
        <span class="filter-option ${param.status == 'COMPLETED' ? 'active' : ''}" 
              data-status="COMPLETED">거래완료</span>
    </div>
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
    <div class="image-container ${trade.t_status}">
        <c:set var="firstImage" value="${trade.t_img.split(',')[0]}" />
        <img src="${pageContext.request.contextPath}/resources/img/trade/${firstImage}" 
             alt="상품 이미지">
        <c:if test="${trade.t_status eq 'RESERVED' or trade.t_status eq 'COMPLETED'}">
            <div class="status-overlay">
                ${trade.t_status eq 'RESERVED' ? '예약중' : '거래완료'}
            </div>
        </c:if>
    </div>
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
                    
          <div class="pagination">
    <c:if test="${currentPage > 1}">
        <a href="?page=${currentPage-1}&sortCondition=${param.sortCondition}&categories=${param.categories}&searchKeyword=${param.searchKeyword}&status=${param.status}" class="page-link">&lt;</a>
    </c:if>
    
    <c:forEach begin="1" end="${totalPages}" var="pageNum">
        <a href="?page=${pageNum}&sortCondition=${param.sortCondition}&categories=${param.categories}&searchKeyword=${param.searchKeyword}&status=${param.status}" 
           class="page-link ${currentPage == pageNum ? 'active' : ''}">${pageNum}</a>
    </c:forEach>
    
    <c:if test="${currentPage < totalPages}">
        <a href="?page=${currentPage+1}&sortCondition=${param.sortCondition}&categories=${param.categories}&searchKeyword=${param.searchKeyword}&status=${param.status}" class="page-link">&gt;</a>
    </c:if>
</div>
                    
                </div>
            </div>
        </form>
    </div>
    <script>


    function initializeFilters() {
        const form = document.getElementById('filterForm');
        const categoryCheckboxes = document.querySelectorAll('.category-option input[type="checkbox"]');
        const sortOptions = document.querySelectorAll('.filter-option[data-sort]');
        const statusOptions = document.querySelectorAll('.filter-option[data-status]');
        
     
        const sortInput = form.querySelector('input[name="sortCondition"]');
        const statusInput = form.querySelector('input[name="status"]');

       
        statusOptions.forEach(option => {
            option.addEventListener('click', function() {
                
                statusOptions.forEach(opt => opt.classList.remove('active'));
               
                this.classList.add('active');
             
                statusInput.value = this.getAttribute('data-status');
                
                form.submit();
            });
        });

   
        sortOptions.forEach(option => {
            option.addEventListener('click', function() {
                sortOptions.forEach(opt => opt.classList.remove('active'));
                this.classList.add('active');
                sortInput.value = this.getAttribute('data-sort');
                form.submit();
            });
        });

    
        categoryCheckboxes.forEach(checkbox => {
            checkbox.addEventListener('change', function() {
                const selectedCategories = Array.from(categoryCheckboxes)
                    .filter(cb => cb.checked)
                    .map(cb => cb.value);
                form.querySelector('input[name="categories"]').value = selectedCategories.join(',');
                form.submit();
            });
        });
    }
    
    document.addEventListener('DOMContentLoaded', function() {
        initializeFilters();
        initializeTimeDisplay();
        initializeMobileMenu();
        removeBootstrapResources();
    });

  
    function initializeTimeDisplay() {
        const items = document.querySelectorAll('.item');
        items.forEach(item => {
            const dateString = item.querySelector('.post-time').getAttribute('data-date');
            if (dateString) {
                const timeAgoText = getTimeAgo(dateString);
                item.querySelector('.post-time').textContent = timeAgoText;
            }
        });
    }

   
    function initializeMobileMenu() {
        const filterToggle = document.getElementById('filterToggle');
        const filterClose = document.getElementById('filterClose');
        const filterSection = document.getElementById('filterSection');

        if (filterToggle && filterClose && filterSection) {
            filterToggle.addEventListener('click', function() {
                filterSection.classList.add('active');
                document.body.style.overflow = 'hidden';
            });

            filterClose.addEventListener('click', function() {
                filterSection.classList.remove('active');
                document.body.style.overflow = '';
            });

            window.addEventListener('resize', function() {
                if (window.innerWidth > 420) {
                    filterSection.classList.remove('active');
                    document.body.style.overflow = '';
                }
            });
        }
    }

   
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

   
    function removeBootstrapResources() {
        $('link[href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"]').remove();
        $('link[href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"]').remove();
        $('script[src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"]').remove();
    }
    </script>
    <%@ include file="../view/footer.jsp" %>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>중고거래 관리자 페이지</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        .admin-container {
            max-width: 1300px;
            margin: 0 auto;
            padding: 20px;
        }

        .admin-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            padding-bottom: 20px;
            border-bottom: 2px solid #eee;
        }

        .admin-title {
            font-size: 24px;
            font-weight: bold;
        }

        .admin-controls {
            display: flex;
            gap: 15px;
            margin-bottom: 20px;
        }

        .admin-select {
            padding: 4px;
            border: 1px solid #ddd;
            border-radius: 4px;
            min-width: 150px;
        }

        .admin-btn {
            padding: 8px 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-weight: bold;
        }

        .delete-btn {
            background-color: #dc3545;
            color: white;
        }

        .refresh-btn {
            background-color: #0d6efd;
            color: white;
        }

        .trade-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .trade-table th,
        .trade-table td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #eee;
        }

        .trade-table th {
            background-color: #f8f9fa;
            font-weight: bold;
        }

        .trade-table tr:hover {
            background-color: #f8f9fa;
        }

        .status-badge {
            padding: 4px 8px;
            border-radius: 4px;
            font-size: 14px;
            font-weight: bold;
        }

        .status-selling { background-color: #20c997; color: white; }
        .status-reserved { background-color: #ffc107; color: black; }
        .status-completed { background-color: #6c757d; color: white; }

        .pagination {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 8px;
            margin-top: 40px;
            margin-bottom: 40px;
        }

        .page-btn {
            min-width: 36px;
            height: 36px;
            padding: 0 12px;
            border: 1px solid #dee2e6;
            border-radius: 4px;
            background-color: #fff;
            color: #212529;
            font-size: 14px;
            line-height: 34px;
            text-align: center;
            cursor: pointer;
            transition: all 0.2s;
        }

        .page-btn:hover {
            background-color: #f8f9fa;
            border-color: #dee2e6;
            color: #0d6efd;
        }

        .page-btn.active {
            background-color: #0d6efd;
            border-color: #0d6efd;
            color: #fff;
        }

        .page-btn.active:hover {
            background-color: #0b5ed7;
            border-color: #0a58ca;
            color: #fff;
        }

        .search-section {
            margin-bottom: 20px;
        }

        .search-input {
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            width: 300px;
            margin-right: 10px;
        }
        
        .detail-btn {
    writing-mode: horizontal-tb;  
    text-orientation: mixed;      
    width: auto;              
    white-space: nowrap;        
}
.trade-table td.a {  
    max-width: 200px; 
    white-space: nowrap;
    overflow: hidden; 
    text-overflow: ellipsis;
}

.trade-table td.b {
    max-width: 110px;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}


    </style>
</head>
<body>
<%@ include file="menu.jsp" %>
    <div class="admin-container">
        <div class="admin-header">
            <h1 class="admin-title">중고거래 관리</h1>
            <div>
                <button class="admin-btn refresh-btn" onclick="location.reload()">새로고침</button>
                <button class="admin-btn" onclick="location.href='${pageContext.request.contextPath}/admin_index.do'">관리자 홈</button>
            </div>
        </div>

       <%--  <div class="admin-controls">
            <select class="admin-select" id="t_status" name="t_status">
                <option value="">전체 상태</option>
                <option value="판매중" ${status == '판매중' ? 'selected' : ''}>판매중</option>
                <option value="예약중" ${status == '예약중' ? 'selected' : ''}>예약중</option>
                <option value="거래완료" ${status == '거래완료' ? 'selected' : ''}>거래완료</option>
            </select>
            <select class="admin-select" id="t_condition" name="t_condition">
                <option value="latest" ${sort == 'latest' ? 'selected' : ''}>최신순</option>
                <option value="oldest" ${sort == 'oldest' ? 'selected' : ''}>오래된순</option>
                <option value="priceHigh" ${sort == 'priceHigh' ? 'selected' : ''}>가격높은순</option>
                <option value="priceLow" ${sort == 'priceLow' ? 'selected' : ''}>가격낮은순</option>
            </select>
        </div> --%>

        <div class="search-section">
            <select class="admin-select" id="searchCondition" name="searchCondition">
                <option value="t_product" ${searchCondition == 't_product' ? 'selected' : ''}>제품명</option>
                <option value="t_writer" ${searchCondition == 't_writer' ? 'selected' : ''}>작성자</option>
                <option value="t_class" ${searchCondition == 't_class' ? 'selected' : ''}>카테고리</option>
            </select>
            <input type="text" class="search-input" id="searchKeyword" name="searchKeyword" 
                   value="${searchKeyword}" placeholder="검색어를 입력하세요">
            <button class="admin-btn" onclick="searchTrades()">검색</button>
            <button class="admin-btn delete-btn" onclick="deleteSelectedItems()">선택 삭제</button>
        </div>

        <table class="trade-table">
            <thead>
                <tr>
                    <th><input type="checkbox" id="selectAll"></th>
                    <th>번호</th>
                    <th>이미지</th>
                    <th>제목</th>
                    <th>가격</th>
                    <th>판매자</th>
                    <th>카테고리</th>
                    <th>상태</th>
                    <th>등록일</th>
                    <th>조회수</th>
                    <th>관리</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="trade" items="${trades}">
                    <tr>
                        <td><input type="checkbox" class="trade-checkbox" value="${trade.t_no}"></td>
                        <td>${trade.t_no}</td>
                        <td>
                            <c:set var="firstImage" value="${fn:split(trade.t_img, ',')[0]}" />
                            <img src="${pageContext.request.contextPath}/resources/img/trade/${firstImage}" 
                                 alt="상품이미지" 
                                 style="width: 50px; height: 50px; object-fit: cover;">
                        </td>
                        <td class="a">${trade.t_product}</td>
                        <td><fmt:formatNumber value="${trade.t_price}" pattern="#,###"/>원</td>
                        <td>${trade.t_writer}</td>
                        <td>${trade.t_class}</td>
                        <td>
  <span class="status-badge status-${trade.t_status.toLowerCase()}">${trade.t_status}</span>
</td>
                        <td class="b">${trade.t_date}</td>
                        <td>${trade.t_cnt}</td>
                        <td>
                            <button class="admin-btn detail-btn" onclick="viewDetail(${trade.t_no})">상세</button>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

      <div class="pagination">
    <!-- 이전 페이지 -->
    <c:if test="${currentPage > 1}">
        <button class="page-btn" onclick="goToPage(${currentPage - 1})">&lt;</button>
    </c:if>
    
    <!-- 페이지 번호 -->
    <c:set var="startPage" value="${currentPage - 2 > 1 ? currentPage - 2 : 1}" />
    <c:set var="endPage" value="${currentPage + 2 < totalPages ? currentPage + 2 : totalPages}" />
    
    <c:forEach var="i" begin="${startPage}" end="${endPage}">
        <button class="page-btn ${currentPage == i ? 'active' : ''}" 
                onclick="goToPage(${i})">${i}</button>
    </c:forEach>
    
    <!-- 다음 페이지 -->
    <c:if test="${currentPage < totalPages}">
        <button class="page-btn" onclick="goToPage(${currentPage + 1})">&gt;</button>
    </c:if>
</div>

    <script>
        // 전체 선택 체크박스
        document.getElementById('selectAll').addEventListener('change', function() {
            const checkboxes = document.querySelectorAll('.trade-checkbox');
            checkboxes.forEach(checkbox => checkbox.checked = this.checked);
        });

        // 상태 필터링
        document.getElementById('t_status').addEventListener('change', function() {
            applyFilters();
        });

        // 정렬 변경
        document.getElementById('t_condition').addEventListener('change', function() {
            applyFilters();
        });

        // 필터 적용
        function applyFilters() {
            const status = document.getElementById('t_status').value;
            const sort = document.getElementById('t_condition').value;
            location.href = `${pageContext.request.contextPath}/admin/trade?status=${status}&sort=${sort}`;
        }

        // 선택 항목 삭제
        function deleteSelectedItems() {
            const selected = document.querySelectorAll('.trade-checkbox:checked');
            if (selected.length === 0) {
                alert('삭제할 항목을 선택해주세요.');
                return;
            }

            if (confirm('선택한 항목을 삭제하시겠습니까?')) {
                const ids = Array.from(selected).map(cb => cb.value);
                fetch('${pageContext.request.contextPath}/admin/trade/delete', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify({ ids: ids })
                })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        alert('삭제되었습니다.');
                        location.reload();
                    } else {
                        alert('삭제 실패: ' + data.message);
                    }
                });
            }
        }

        function viewDetail(tradeId) {
            if (!tradeId) {
                alert('잘못된 접근입니다.');
                return;
            }
            window.open('${pageContext.request.contextPath}/trade_detail.do?t_no=' + tradeId, '_blank');
        }

        // 검색
        function searchTrades() {
            var searchCondition = document.getElementById('searchCondition').value;
            var searchKeyword = document.getElementById('searchKeyword').value;
            var t_status = document.getElementById('t_status').value;
            var t_condition = document.getElementById('t_condition').value;
            
            var url = '${pageContext.request.contextPath}/admin/trade?'
                + 'searchCondition=' + encodeURIComponent(searchCondition)
                + '&searchKeyword=' + encodeURIComponent(searchKeyword)
                + '&t_status=' + encodeURIComponent(t_status)
                + '&t_condition=' + encodeURIComponent(t_condition);
            
            window.location.href = url;
        }

        function goToPage(page) {
            const currentUrl = new URL(window.location.href);
            currentUrl.searchParams.set('page', page);
            window.location.href = currentUrl.toString();
        }
    </script>
</body>
</html>
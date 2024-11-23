<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고거래 관리자 페이지</title>
<style>
* {
	font-size: 18px !important;
}

button {
	background-color: black !important;
	height: 40px !important;
	color: white !important;
	border: none !important;
	border-radius: 5px !important;
	font-size: 16px !important;
	cursor: pointer;
	font-weight: normal !important;
}

button:hover {
	background-color: #c0c0c0 !important; /* 버튼에 마우스를 올렸을 때 배경색 변경 */
}

h1 {
	font-size: 23px !important;
}

.container {
	width: calc(100% - 250px) !important;
	margin-left: 250px;
}

.admin-container {
	width: 1300px;
	margin: 0 auto;
	padding: 20px 10px;
	position: relative;
}

.admin-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 30px;
	padding-bottom: 20px;
	border-bottom: 2px solid #eee;
}

/* 검색 폼을 감싸는 .search-section 스타일 */
.search-section {
	display: flex;
	align-items: center; /* 수평 정렬 */
	gap: 10px; /* 각 요소 간 간격 */
	margin-bottom: 10px; /* 테이블과의 간격 */
	justify-content: flex-end; /* 오른쪽 정렬 */
}

/* 드롭다운 메뉴(검색 조건) 스타일 */
.search-section .admin-select {
	padding: 8px 12px;
	font-size: 14px;
	border: 1px solid #000;
	border-radius: 5px;
	background-color: #fff;
	color: #333;
	cursor: pointer;
	height: 40px;
}

.search-section .admin-select:focus {
	outline: none;
}

/* 검색어 입력창 스타일 */
.search-section .search-input {
	padding: 8px 12px;
	font-size: 14px;
	border: 1px solid #000;
	border-radius: 5px;
	width: 200px; /* 입력창 고정 너비 */
	height: 40px;
	background-color: #fff;
	color: #333;
}

/* 검색 버튼 스타일 */
.search-section .admin-btn {
	padding: 8px 15px;
	font-size: 14px;
	background-color: #000;
	color: #fff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

.search-section .admin-btn:hover {
	background-color: #333; /* 호버 시 배경 색상 */
}

/* 선택 삭제 버튼 스타일 */
.search-section .delete-btn {
	padding: 8px 15px;
	font-size: 14px;
	background-color: black; /* 빨간색 */
	color: #fff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

.search-section .delete-btn:hover {
	background-color: #d32f2f; /* 빨간색 호버 */
}

table {
	width: 100%;
	border-collapse: collapse;
	table-layout: fixed;
}

th, td {
	padding: 12px;
	border: 1px solid #ddd;
	text-align: center;
	overflow: hidden;
	white-space: nowrap;
}

th {
	background-color: #f4f4f4;
	height: 20px;
}

td {
	height: 30px;
}

th:nth-child(1), td:nth-child(1) {
	width: 3%;
}

th:nth-child(2), td:nth-child(2) {
	width: 5%;
}

th:nth-child(3), td:nth-child(3) {
	width: 6%;
}

th:nth-child(4), td:nth-child(4) {
	width: 20%;
}

th:nth-child(5), td:nth-child(5) {
	width: 10%;
}

th:nth-child(6), td:nth-child(6) {
	width: 10%;
}

th:nth-child(7), td:nth-child(7) {
	width: 12%;
}

th:nth-child(8), td:nth-child(8) {
	width: 11%;
}

th:nth-child(9), td:nth-child(9) {
	width: 15%;
}

th:nth-child(10), td:nth-child(10) {
	width: 6%;
}

th:nth-child(11), td:nth-child(11) {
	width: 7%;
}

.action-buttons button {
	padding: 6px 12px;
	cursor: pointer;
	border: none;
	border-radius: 4px;
}

.delete-button {
	background-color: #000000;
	color: #ffffff;
	border: 1px solid #000000;
	padding: 10px 20px;
	cursor: pointer;
	border-radius: 0;
}

.delete-button:hover {
	background-color: #c0c0c0;
}

.container a {
	color: #000000;
	text-decoration: none;
}

.container a:hover {
	color: #333333;
}

.pagination-container {
	display: flex;
	justify-content: center;
	align-items: center;
	margin-top: 20px;
}

.pagination a {
	margin: 0 5px;
	padding: 8px 16px;
	color: #333;
	text-decoration: none;
	border-radius: 4px;
}

.pagination a.active {
	background-color: #ffffff;
	color: #000000;
	border: 1px solid #ffffff;
	font-weight: bold;
	text-decoration: underline;
}

.pagination a:hover:not(.active) {
	font-weight: bold;
	background-color: #ddd;
}

.a { /* 텍스트가 한 줄로만 표시되도록 설정 */
	text-overflow: ellipsis; /* 넘친 부분에 '...'을 표시 */
	/* 블록 요소로 만들어 텍스트가 한 줄로 표시되도록 함 */
}

/* 상세 버튼 (검정색 배경, 흰색 글씨로 스타일링) */
.detail-btn {
	padding: 8px;
	font-size: 14px;
	background-color: #000000; /* 검정색 배경 */
	color: #ffffff; /* 흰색 글씨 */
	border: none;
	border-radius: 4px; /* 둥근 테두리 */
	cursor: pointer; /* 클릭할 수 있음을 표시 */
	transition: background-color 0.3s ease, color 0.3s ease;
	/* 부드러운 색상 변경 효과 */
}

/* 호버 시 버튼 배경 색상 변경 */
.detail-btn:hover {
	background-color: #444444; /* 어두운 회색으로 배경 색상 변경 */
	color: #ffffff; /* 흰색 글씨 유지 */
}

/* 클릭 시 버튼 색상 변경 (active 상태) */
.detail-btn:active {
	background-color: #333333; /* 더 어두운 회색 */
	color: #ffffff; /* 흰색 글씨 유지 */
}
</style>
</head>
<body>
	<%@ include file="menu.jsp"%>
	<div class="container">
		<div class="admin-container">
			<div class="admin-header">
				<h1 class="admin-title">중고거래 관리</h1>
			</div>

			<div class="search-section">
				<select class="admin-select" id="searchCondition"
					name="searchCondition">
					<option value="t_product"
						${searchCondition == 't_product' ? 'selected' : ''}>제품명</option>
					<option value="t_writer"
						${searchCondition == 't_writer' ? 'selected' : ''}>작성자</option>
					<option value="t_class"
						${searchCondition == 't_class' ? 'selected' : ''}>카테고리</option>
				</select> <input type="text" class="search-input" id="searchKeyword"
					name="searchKeyword" value="${searchKeyword}"
					placeholder="검색어를 입력하세요">
				<button class="admin-btn" onclick="searchTrades()">검색</button>
				<button class="admin-btn delete-btn" onclick="deleteSelectedItems()">선택
					삭제</button>
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
							<td><input type="checkbox" class="trade-checkbox"
								value="${trade.t_no}"></td>
							<td>${trade.t_no}</td>
							<td><c:set var="firstImage"
									value="${fn:split(trade.t_img, ',')[0]}" /> <img
								src="${pageContext.request.contextPath}/resources/img/trade/${firstImage}"
								alt="상품이미지"
								style="width: 33px; height: 33px; object-fit: cover;"></td>
							<td class="a">${trade.t_product}</td>
							<td><fmt:formatNumber value="${trade.t_price}"
									pattern="#,###" />원</td>
							<td>${trade.t_writer}</td>
							<td>${trade.t_class}</td>
							<td><span
								class="status-badge status-${trade.t_status.toLowerCase()}">${trade.t_status}</span>
							</td>
							<td class="b">${trade.t_date}</td>
							<td>${trade.t_cnt}</td>
							<td>
								<button class="admin-btn detail-btn"
									onclick="viewDetail(${trade.t_no})">상세</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<div class="pagination-container">
				<div class="pagination">
					<c:forEach var="i" begin="1" end="${totalPages}">
						<c:choose>
							<c:when test="${i == currentPage}">
								<a href="?page=${i}" class="active">${i}</a>
							</c:when>
							<c:otherwise>
								<a href="?page=${i}">${i}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</div>
			</div>
		</div>
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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../admin/header.jsp" %>
<%@ include file="../admin/menu.jsp" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminProductList.css">
<title>관리자 상품 관리 페이지</title>
</head>
<body>

    <div class="container">
    	<div class="container-inner">
	        <h1>상품 목록</h1>
	
	        <!-- 검색 폼 -->
	        <div class="search-container">
	            <form action="${pageContext.request.contextPath}/productsList.do" method="get">
	                <input type="text" name="searchQuery" placeholder="상품명을 입력하세요" value="${searchQuery}" />
	                <button type="submit">검색</button>
	            </form>
	        </div>
	
	        <table>
	            <thead>
	                <tr>
	                    <th>No</th>
	                    <th>상품코드</th>
	                    <th>상품명</th>
	                    <th>원가</th>
	                    <th>재고</th>
	                    <th>리뷰수</th>
	                    <th>평점</th>
	                    <th>관리</th>
	                </tr>
	            </thead>
	            <tbody>
	                <c:forEach var="product" items="${ProductList}">
	                    <tr>
	                        <td>${product.p_no}</td>
	                        <td>${product.p_callno}</td>
	                        <td>
	                            <a href="${pageContext.request.contextPath}/productsDetail.do?p_no=${product.p_no}">
	                                ${product.p_name}
	                            </a>
	                        </td>
	                        <td><fmt:formatNumber value="${product.p_price}" type="number"/> 원</td>
	                        <td>${product.p_stock}ea</td>
	                        <td>${product.reviewCount}개</td>
	                        <td>${product.review_avg}점</td>
	                        <td>
	                            <div class="action-buttons">
	                                <form action="/deleteProduct.do" method="post" onsubmit="return confirm('정말 삭제하시겠습니까?');">
									    <input type="hidden" name="p_no" value="${product.p_no}">
									    <button type="submit" class="delete-button">삭제</button>
									</form>
	                            </div>
	                        </td>
	                    </tr>
	                </c:forEach>
	            </tbody>
	        </table>
	
	        <!-- 페이징과 작성하기 버튼 -->
	        <div class="pagination-container">
	            <div class="pagination">
	                <c:forEach var="i" begin="1" end="${totalPages}">
	                    <c:choose>
	                        <c:when test="${i == currentPage}">
	                            <a href="?page=${i}&sortType=${sortType}&category=${category}&searchQuery=${searchQuery}" class="active">${i}</a>
	                        </c:when>
	                        <c:otherwise>
	                            <a href="?page=${i}&sortType=${sortType}&category=${category}&searchQuery=${searchQuery}">${i}</a>
	                        </c:otherwise>
	                    </c:choose>
	                </c:forEach>
	            </div>
	            <a href="${pageContext.request.contextPath}/productsWrite.do" class="write-button">작성하기</a>
	            
	        </div>
	    </div>
    </div>

    <script>
        
        $(document).ready(function () {
            // 서버에서 전달된 파라미터 값을 JavaScript 변수로 가져옴
            var status = "${param.status}";

            if (status === "success") {
                alert("글 등록이 완료되었습니다.");
                const url = window.location.origin + window.location.pathname;
                history.replaceState(null, null, url);
            } else if (status === "fail") {
                alert("글 등록이 실패하였습니다.");
                const url = window.location.origin + window.location.pathname;
                history.replaceState(null, null, url);
            }
            
            
        });
    </script>

</body>
</html>

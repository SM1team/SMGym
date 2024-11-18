<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="pagination-container">
    <c:if test="${totalBoardCount > 0}">
        <!-- 페이지 정보 (현재 페이지 / 전체 페이지) -->
        <div class="page-info">
            <span class="current-page">${currentPage}</span> / <span class="total-pages">${totalPages}</span>
        </div>

        <!-- 페이지 버튼들 -->
        <ul class="pagination">
            <!-- 첫 번째 페이지로 이동 버튼 -->
            <li class="<c:if test='${page == 1}'>disabled</c:if>">
                <a href="<c:url value='/board/list?page=1' />" aria-label="First">
                    <span aria-hidden="true">&laquo;&laquo;</span>
                </a>
            </li>

            <!-- 이전 페이지로 이동 버튼 -->
            <li class="<c:if test='${page == 1}'>disabled</c:if>">
                <a href="<c:url value='/board/list?page=${page - 1}' />" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>

            <!-- 페이지 번호 버튼들 -->
            <c:forEach begin="1" end="${totalPages}" var="i">
                <li class="pagination-item <c:if test='${i == page}'>active</c:if>">
                    <a href="<c:url value='/board/list?page=${i}' />">${i}</a>
                </li>
            </c:forEach>

            <!-- 다음 페이지로 이동 버튼 -->
            <li class="<c:if test='${page == totalPages}'>disabled</c:if>">
                <a href="<c:url value='/board/list?page=${page + 1}' />" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>

            <!-- 마지막 페이지로 이동 버튼 -->
            <li class="<c:if test='${page == totalPages}'>disabled</c:if>">
                <a href="<c:url value='/board/list?page=${totalPages}' />" aria-label="Last">
                    <span aria-hidden="true">&raquo;&raquo;</span>
                </a>
            </li>
        </ul>
    </c:if>
</div>

<!-- 페이지 내에서 CSS 스타일을 직접 작성 -->
<style>
    /* 전체 페이지 정보 및 버튼 컨테이너 */
    .pagination-container {
        text-align: center;
        margin-top: 20px;
    }

    /* 페이지 정보 스타일 */
    .page-info {
        font-family: 'Arial', sans-serif;
        font-size: 18px;
        font-weight: bold;
        color: #007bff;
        margin-bottom: 10px;
    }

    .page-info .current-page {
        color: #007bff;
    }

    .page-info .total-pages {
        color: #555;
    }

    /* pagination 스타일 */
    .pagination {
        list-style: none;
        padding: 0;
        display: inline-flex;
        justify-content: center;
        align-items: center;
    }

    .pagination li {
        margin: 0 5px;
    }

    .pagination a {
        display: block;
        padding: 5px 10px;
        text-decoration: none;
        color: #007bff;
        border: 1px solid #ddd;
        border-radius: 3px;
    }

    .pagination .active a {
        background-color: #007bff;  /* 현재 페이지 강조 색 */
        color: white;
        border-color: #007bff;
    }

    .pagination .disabled a {
        background-color: #f1f1f1;
        color: #ddd;
        border-color: #ddd;
    }

    .pagination a:hover {
        background-color: #f1f1f1;
        border-color: #ddd;
    }
</style>

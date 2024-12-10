<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    /* 다크 테마 기본 설정 */
    body {
        font-family: Arial, sans-serif;
        line-height: 1.5;
        color: #e0e0e0;
        background-color: #000000;
        margin: 0;
        padding: 0;
    }

    .board-container {
        max-width: 800px;
        margin: 20px auto;
        padding: 20px;
        border-radius: 8px;
        background-color: #000000;
    }

    .board-title {
        font-size: 1.8rem;
        margin-bottom: 20px;
        text-align: center;
        color: #ae00c7;
    }

    /* 버튼 스타일 */
    .action-buttons {
        display: flex;
        gap: 10px;
        margin-bottom: 20px;
        justify-content: center;
    }

    .btn {
        padding: 10px 15px;
        text-decoration: none;
        color: #e0e0e0;
        border-radius: 5px;
        text-align: center;
        font-size: 1rem;
        transition: background-color 0.3s ease, color 0.3s ease;
    }

    /* 게시물 작성 버튼 hover */
    .btn.primary-btn {
        background-color: #000000;!important; /* 배경 흰색 */
        color: #ffffff; !important;/* 텍스트 보라색 */
        border: 1px solid #ae00c7;

    }

    /* 내가 쓴 글 버튼 hover */
    .btn.secondary-btn {
        background-color: #000000;!important; /* 배경 흰색 */
        color: #ffffff; !important;/* 텍스트 보라색 */
        border: 1px solid #ae00c7;
    }

    /* 검색 버튼 hover */
    .btn.search-btn {
        background-color: #000000;!important; /* 배경 흰색 */
        color: #ffffff; !important;/* 텍스트 보라색 */
        border: 1px solid #ae00c7;
        margin-top: 10px;
    }

    /* 게시물 작성 버튼 hover */
    .btn.primary-btn:hover {
        background-color: #ae00c7; !important;/* 배경 보라색 */
        color: #ffffff; !important;/* 텍스트 흰색 */
        border-color: #ffffff;!important; /* 테두리 흰색 */
    }

    /* 내가 쓴 글 버튼 hover */
    .btn.secondary-btn:hover {
        background-color: #ae00c7; !important;/* 배경 보라색 */
        color: #ffffff; !important;/* 텍스트 흰색 */
        border-color: #ffffff;!important; /* 테두리 흰색 */
    }

    /* 검색 버튼 hover */
    .btn.search-btn:hover {
        background-color: #ae00c7; !important; /* 배경 보라색 */
        color: #ffffff;!important; /* 텍스트 흰색 */
        border-color: #ffffff; !important;/* 테두리 흰색 */
    }




    /* 검색 폼 */
    .search-form {
        text-align: center;
        width: 50%;
        margin: auto;
    }

    .search-input {
        padding: 8px 10px;
        width: 250px;
        border: 4px solid #ffffff;
        border-radius: 4px;
        background-color: #000000;
        color: #e0e0e0;
        font-size: 1rem;
    }

    .search-input::placeholder {
        color: #ae00c7;
        border-color: #ae00c7; /* 보라색 테두리 */
    }

    /* 검색 입력창에 마우스 올릴 때 테두리 색 변경 */
    .search-input:hover {
        border-color: #ae00c7; /* 보라색 테두리 */
    }

    /* 검색 입력창에 포커스 상태일 때 테두리 색 변경 */
    .search-input:focus {
        border-color: #ae00c7;
        box-shadow: 0 0 8px #ae00c7;
        color: #ffffff; /* 텍스트 흰색 */
        background-color: #000000; /* 입력 필드 배경색 검정 */
    }


    /* 테이블 스타일 */
    .board-table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
        text-align: left;
        background-color: #1E1E1E;
        color: #e0e0e0;
    }

    .board-table th,
    .board-table td {
        padding: 10px;
        border: 1px solid #ae00c7;
    }

    .board-table th {
        background-color: #333;
        font-weight: bold;
        color: #e0e0e0;
    }

    .board-table .board-title-link {
        color: #f1f1f1;
        text-decoration: none;
    }

    .board-table .board-title-link:hover {
        text-decoration: underline;
    }

    .board-image {
        height: 50px;
        width: 50px;
        object-fit: cover;
        border-radius: 4px;
        border: 1px solid #ae00c7;

    }


</style>
<!-- styles.css 파일을 링크로 추가 -->
<link rel="stylesheet" href="<c:url value='/css/styles.css' />">

<section class="board-container">
    <h2 class="board-title">게시판 목록</h2>

    <!-- 상단 버튼 컨테이너 -->
    <div class="action-buttons">
        <a href="<c:url value='/board/write' />" class="btn primary-btn" >게시물 작성</a>
        <a href="<c:url value='/board/myboards' />" class="btn secondary-btn" >내가 쓴 글</a>
    </div>

    <!-- 검색 폼 -->
    <form action="<c:url value='/board/search' />" method="get" class="search-form">
        <input
                type="text"
                name="searchKeyword"
                placeholder="제목으로 검색"
                class="form-control search-input"
                style="background-color:  #000000; color: #ffffff; border :1px solid #ae00c7;">
        <button type="submit" class="btn search-btn">검색</button>
    </form>


    <!-- 게시물 테이블 -->
    <table class="board-table">
        <thead>
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성자ID</th>
            <th>등록일</th>
            <th>이미지</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="board" items="${boardList}">
            <tr>
                <td>${board.noticeNo}</td>
                <td>
                    <a href="<c:url value='/board/detail?noticeNo=${board.noticeNo}' />" class="board-title-link">${board.noticeTitle}</a>
                </td>
                <td>${board.custId}</td>
                <td>${board.noticeDate}</td>
                <td>
                    <!-- 이미지 표시 -->
                    <c:if test="${not empty board.boardImg}">
                        <img src="<c:url value='/imgs/${board.boardImg}' />" alt="게시물 이미지" class="board-image" />
                    </c:if>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <!-- 페이지네이션 포함 -->
    <jsp:include page="/views/board/page.jsp" />
</section>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- styles.css 파일을 링크로 추가 -->
<link rel="stylesheet" href="<c:url value='/css/styles.css' />">

<!-- 다크 테마 스타일 -->
<style>
    /* 전체 바디 스타일 */
    body {
        font-family: Arial, sans-serif;
        color: #e0e0e0; /* 흰색 텍스트 */
        background-color: #000000; /* 검은색 배경 */
        margin: 0;
        padding: 0;
        display: flex;
        flex-direction: column;
        min-height: 100vh;
        justify-content: flex-start; /* 콘텐츠 상단 정렬 */
        align-items: center;
    }

    /* 제목 스타일 */
    h2 {
        color: #f1f1f1; /* 흰색 제목 */
        margin: auto;
    }

    /* 버튼 스타일 */
    .btn {
        padding: 10px 15px;
        font-size: 1rem;
        color: #e0e0e0;
        background-color: #000;
        border: 1px solid #ae00c7;
        border-radius: 5px;
        text-decoration: none;
        transition: background-color 0.3s ease, color 0.3s ease;
    }

    /* 버튼 hover 상태 */
    .btn:hover {
        background-color: #ae00c7; /* 보라색 배경 */
        color: #ffffff; /* 흰색 텍스트 */
        border-color: #ffffff; /* 테두리 흰색 */
    }

    /* 검색 폼 */
    .search-form {
        text-align: center;
        margin-bottom: 20px;
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

<h2>공지사항 목록</h2>

<!-- 게시물 작성 버튼과 내가 쓴 글 버튼을 추가 -->
<div style="margin-bottom: 20px; display: flex; gap: 10px;">
    <!-- 항상 게시물 작성 버튼과 내가 쓴 글 보기 버튼을 표시 -->
    <a href="<c:url value='/board/write' />" class="btn">게시물 작성</a>
    <a href="<c:url value='/board/myboards' />" class="btn">내가 쓴 글</a>
</div>

<!-- 검색 기능 추가 -->
<form action="<c:url value='/notice/search' />" method="get" class="search-form">
    <input type="text" name="searchKeyword" placeholder="제목으로 검색" class="search-input">
    <button type="submit" class="btn">검색</button>
</form>

<table class="board-table">
    <thead>
    <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th> <!-- 수정된 부분: ID 대신 이름을 출력 -->
        <th>등록일</th>
        <th>이미지</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="notice" items="${noticeList}">
        <tr>
            <td>${notice.noticeNo}</td>
            <td>
                <a href="<c:url value='/notice/detail?noticeNo=${notice.noticeNo}' />" class="board-title-link">${notice.noticeTitle}</a>
            </td>
            <!-- 작성자 표시 -->
            <td>${notice.trainerId}</td> <!-- 수정된 부분 -->
            <td>${notice.noticeDate}</td>
            <td>
                <!-- 이미지가 있을 때만 표시하도록 조건 추가 -->
                <c:if test="${not empty notice.noticeImg}">
                    <img src="<c:url value='/imgs/${notice.noticeImg}' />" alt="게시물 이미지" class="board-image"/>
                </c:if>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<!-- 페이지네이션 부분을 notice/page.jsp로 변경 -->
<jsp:include page="/views/notice/page.jsp" />

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판 목록</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
    <style>
        /* 다크 테마 기본 설정 */
        body {
            background-color: #000000; /* 배경 검정 */
            color: #ffffff; /* 기본 텍스트 흰색 */
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .board-container {
            max-width: 900px;
            margin: 80px auto;
            padding: 30px;
            background-color: #1a1a1a; /* 다크한 배경 */
            border-radius: 15px;
            box-shadow: 0 8px 12px rgba(0, 0, 0, 0.4);
            border: 2px solid #ae00c7;
        }

        .board-title {
            text-align: center;
            font-size: 2rem;
            color: #ae00c7; /* 포인트 색상 */
            margin-bottom: 20px;
        }

        /* 상단 버튼 스타일 */
        .action-buttons {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-bottom: 20px;
        }

        .btn {
            padding: 10px 20px;
            font-size: 1rem;
            text-align: center;
            border-radius: 10px;
            text-decoration: none;
            background-color: #1a1a1a;
            color: #ffffff;
            border: 2px solid #ae00c7;
            transition: all 0.3s ease;
        }

        .btn:hover {
            background-color: #ae00c7; /* 포인트 색상 */
            color: #ffffff;
            border-color: #ffffff; /* 강조된 테두리 */
        }

        /* 검색 폼 */
        .search-form {
            display: flex;
            justify-content: center;
            margin-bottom: 30px;
        }

        .search-input {
            width: 60%;
            padding: 10px;
            font-size: 1rem;
            color: #ffffff;
            background-color: #000000;
            border: 2px solid #ae00c7;
            border-radius: 10px;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        .search-input:focus {
            border-color: #ffffff; /* 강조된 테두리 */
            box-shadow: 0 0 8px #ae00c7;
            outline: none;
        }

        .search-btn {
            padding: 10px 20px;
            margin-left: 10px;
            font-size: 1rem;
            background-color: #000000;
            color: #ffffff;
            border: 2px solid #ae00c7;
            border-radius: 10px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .search-btn:hover {
            background-color: #ae00c7;
            color: #ffffff;
            border-color: #ffffff;
        }

        /* 게시물 테이블 */
        .board-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: #1e1e1e;
            color: #ffffff;
        }

        .board-table th,
        .board-table td {
            padding: 15px;
            border: 1px solid #ae00c7;
            text-align: center;
        }

        .board-table th {
            background-color: #333333;
            color: #ffffff;
            font-weight: bold;
        }

        .board-table a {
            color: #ffffff;
            text-decoration: none;
        }

        .board-table a:hover {
            text-decoration: underline;
            color: #ae00c7;
        }

        .board-image {
            height: 50px;
            width: 50px;
            object-fit: cover;
            border-radius: 5px;
            border: 1px solid #ae00c7;
        }
    </style>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            AOS.init({
                duration: 800,
                once: true,
            });
        });
    </script>
</head>
<body>
<section class="board-container" data-aos="fade-up">
    <h2 class="board-title">게시판 목록</h2>

    <!-- 상단 버튼 -->
    <div class="action-buttons">
        <a href="<c:url value='/board/write' />" class="btn">게시물 작성</a>
        <a href="<c:url value='/board/myboards' />" class="btn">내가 쓴 글</a>
    </div>

    <!-- 검색 폼 -->
    <form action="<c:url value='/board/search' />" method="get" class="search-form">
        <input type="text" name="searchKeyword" class="search-input" placeholder="제목으로 검색">
        <button type="submit" class="search-btn">검색</button>
    </form>

    <!-- 게시물 테이블 -->
    <table class="board-table">
        <thead>
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>등록일</th>
            <th>이미지</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="board" items="${boardList}">
            <tr>
                <td>${board.noticeNo}</td>
                <td>
                    <a href="<c:url value='/board/detail?noticeNo=${board.noticeNo}' />">${board.noticeTitle}</a>
                </td>
                <td>${board.custId}</td>
                <td>${board.noticeDate}</td>
                <td>
                    <c:if test="${not empty board.boardImg}">
                        <img src="<c:url value='/imgs/${board.boardImg}' />" alt="게시물 이미지" class="board-image" />
                    </c:if>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <!-- 페이지네이션 -->
    <jsp:include page="/views/board/page.jsp" />
</section>
</body>
</html>

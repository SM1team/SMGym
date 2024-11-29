<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>게시물 히스토리</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 8px 12px;
            border: 1px solid #ddd;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        .page-links {
            margin-top: 20px;
        }
        .page-links a {
            margin: 0 5px;
            text-decoration: none;
            color: blue;
        }
    </style>
</head>
<body>

<h1>내 게시물 히스토리</h1>

<!-- 게시물 목록 출력 -->
<table>
    <thead>
    <tr>
        <th>게시물 번호</th>
        <th>제목</th>
        <th>작성 날짜</th>
        <th>작성자</th>
        <th>이미지</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="board" items="${historyList}">
        <tr>
            <td>${board.noticeNo}</td>
            <td><a href="board/detail?noticeNo=${board.noticeNo}">${board.noticeTitle}</a></td>
            <td>${board.noticeDate}</td>
            <td>${board.custId}</td>
            <td><img src="${board.boardImg}" alt="이미지" width="50" height="50"></td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<!-- 페이지 네비게이션 -->
<div class="page-links">
    <c:if test="${currentPage > 1}">
        <a href="board/history?page=${currentPage - 1}&pageSize=${pageSize}">이전</a>
    </c:if>
    <c:forEach begin="1" end="${totalPages}" var="i">
        <a href="board/history?page=${i}&pageSize=${pageSize}">${i}</a>
    </c:forEach>
    <c:if test="${currentPage < totalPages}">
        <a href="board/history?page=${currentPage + 1}&pageSize=${pageSize}">다음</a>
    </c:if>
</div>

</body>
</html>

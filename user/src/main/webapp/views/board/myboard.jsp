<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  <!-- JSTL 사용을 위한 태그 라이브러리 선언 -->
<html>
<head>
    <title>게시판 목록</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
    </style>
</head>
<body>
<h1>게시판 목록</h1>

<!-- 게시물 리스트 테이블 -->
<table>
    <thead>
    <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일</th>
        <th>상세보기</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="board" items="${boardList}">
        <tr>
            <td>${board.noticeNo}</td>
            <td>${board.title}</td>
            <td>${board.writer}</td>
            <td>${board.createdDate}</td>
            <td>
                <a href="/board/detail?noticeNo=${board.noticeNo}">상세보기</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<!-- 페이지네이션 -->
<div>
    <c:if test="${totalPages > 1}">
        <ul style="list-style-type: none; padding: 0;">
            <c:forEach var="i" begin="1" end="${totalPages}">
                <li style="display: inline; margin-right: 10px;">
                    <a href="/board?page=${i}&pageSize=${pageSize}">${i}</a>
                </li>
            </c:forEach>
        </ul>
    </c:if>
</div>

<!-- 게시물 작성 버튼 -->
<div>
    <a href="/board/write">새 게시물 작성</a>
</div>
</body>
</html>

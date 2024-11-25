<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>게시물 검색 결과</title>
</head>
<body>
<h1>게시물 검색 222결과</h1>

<form action="<c:url value='/board/search' />" method="get" style="margin-bottom: 20px;">
    <input type="text" name="searchKeyword" placeholder="제목으로 검색" class="form-control" style="width: 300px; display: inline-block;" value="${param.searchKeyword}">
    <button type="submit" class="btn">검색</button>
</form>

<table border="1">
    <thead>
    <tr>
        <th>번호</th>
        <th>제목</th>
        <th>내용</th>
        <th>작성일</th>
        <th>이미지</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="board" items="${boardList}">
        <tr>
            <td>${board.noticeNo}</td>
            <td>${board.noticeTitle}</td>
            <td>${board.noticeContent}</td>
            <td>${board.noticeDate}</td>
            <td>
                <!-- boardImg 경로를 서버의 업로드 이미지 경로로 수정 -->
                <img src="<c:url value='${board.boardImg}' />" alt="게시물 이미지" width="50" height="50">
            </td>

        </tr>
    </c:forEach>
    </tbody>
</table>

<div>
    <!-- 페이지네이션 추가 -->
    <c:if test="${currentPage > 1}">
        <a href="<c:url value='/board/search' />?searchKeyword=${param.searchKeyword}&page=${currentPage - 1}&pageSize=${pageSize}">이전</a>
    </c:if>
    <c:if test="${currentPage < totalPages}">
        <a href="<c:url value='/board/search' />?searchKeyword=${param.searchKeyword}&page=${currentPage + 1}&pageSize=${pageSize}">다음</a>
    </c:if>
</div>
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- styles.css 파일을 링크로 추가 -->
<link rel="stylesheet" href="<c:url value='/css/styles.css' />">

<h2>게시판 목록</h2>

<!-- 게시물 작성 버튼과 내가 쓴 글 버튼을 추가 -->
<div style="margin-bottom: 20px; display: flex; gap: 10px;">
    <!-- 항상 게시물 작성 버튼과 내가 쓴 글 보기 버튼을 표시 -->
    <a href="<c:url value='/board/write' />" class="btn">게시물 작성</a>
    <a href="<c:url value='/board/myboards' />" class="btn">내가 쓴 글</a>
</div>

<!-- 검색 기능 추가 -->
<form action="<c:url value='/board/search' />" method="get" style="margin-bottom: 20px;">
    <input type="text" name="searchKeyword" placeholder="제목으로 검색" class="form-control" style="width: 300px; display: inline-block;">
    <button type="submit" class="btn">검색</button>
</form>

<table class="table table-striped">
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
                <a href="<c:url value='/board/detail?noticeNo=${board.noticeNo}' />" style="color: black;">${board.noticeTitle}</a>
            </td>
            <td>${board.custId}</td>
            <td>${board.noticeDate}</td>
            <td>
                <!-- 이미지가 있을 때만 표시하도록 조건 추가 -->
                <c:if test="${not empty board.boardImg}">
                    <img src="<c:url value='/imgs/${board.boardImg}' />" alt="게시물 이미지" height="50" width="50" />
                </c:if>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>


<!-- 페이지네이션 부분을 page.jsp로 분리 -->
<jsp:include page="/views/board/page.jsp" />

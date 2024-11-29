<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- styles.css 파일을 링크로 추가 -->
<link rel="stylesheet" href="<c:url value='/css/styles.css' />">

<h2>공지사항 목록</h2>

<!-- 게시물 작성 버튼과 내가 쓴 글 버튼을 추가 -->
<div style="margin-bottom: 20px; display: flex; gap: 10px;">
    <!-- 항상 게시물 작성 버튼과 내가 쓴 글 보기 버튼을 표시 -->
    <a href="<c:url value='/board/write' />" class="btn">게시물 작성</a>
    <a href="<c:url value='/board/myboards' />" class="btn">내가 쓴 글</a>
</div>

<!-- 검색 기능 추가 -->
<form action="<c:url value='/notice/search' />" method="get" style="margin-bottom: 20px;">
    <input type="text" name="searchKeyword" placeholder="제목으로 검색" class="form-control" style="width: 300px; display: inline-block;">
    <button type="submit" class="btn">검색</button>
</form>

<table class="table table-striped">
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
                <a href="<c:url value='/notice/detail?noticeNo=${notice.noticeNo}' />" style="color: black;">${notice.noticeTitle}</a>
            </td>
            <!-- 작성자 표시: notice.trainer.name으로 수정 -->
            <td>${notice.trainerId}</td> <!-- 수정된 부분 -->
            <td>${notice.noticeDate}</td>
            <td>
                <!-- 이미지가 있을 때만 표시하도록 조건 추가 -->
                <c:if test="${not empty notice.noticeImg}">
                    <img src="<c:url value='/imgs/${notice.noticeImg}' />" alt="게시물 이미지" height="50" width="50" />
                </c:if>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<!-- 페이지네이션 부분을 notice/page.jsp로 변경 -->
<jsp:include page="/views/notice/page.jsp" />

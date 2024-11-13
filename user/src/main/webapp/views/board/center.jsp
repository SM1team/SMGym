<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h2>게시판 목록</h2>

<table class="table table-striped">
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
      <td><a href="<c:url value='/board/detail?noticeNo=${board.noticeNo}' />">${board.noticeTitle}</a></td>
      <td>${board.custId}</td>
      <td>${board.noticeDate}</td>
      <td><img src="<c:url value='/assets/img/board/${board.boardImg}'/>" alt="게시물 이미지" width="50" height="50"></td>
    </tr>
  </c:forEach>
  </tbody>
</table>

<!-- 페이지네이션 -->
<div class="pagination">
  <c:if test="${totalBoardCount > 0}">
    <!-- 페이징 처리 버튼들을 여기에 추가할 수 있습니다. -->
    <span>현재 페이지: ${page}</span>
  </c:if>
</div>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- styles.css 파일을 링크로 추가 -->
<link rel="stylesheet" href="<c:url value='/css/styles.css' />">

<style>
  /* 다크 테마 기본 설정 */
  body {
    font-family: Arial, sans-serif;
    line-height: 1.5;
    color: #ffffff; /* 텍스트를 흰색으로 설정 */
    background-color: #000000;
    margin: 0;
    padding: 0;
    display: flex;
    flex-direction: column;
    min-height: 100vh;
    justify-content: center; /* 중앙 정렬 */
    align-items: center; /* 중앙 정렬 */
  }

  /* 콘텐츠 영역을 감싸는 컨테이너 */
  .container {
    width: 100%;
    max-width: 1200px; /* 최대 폭 제한 */
    padding: 20px; /* 내부 여백 추가 */
    box-sizing: border-box; /* 여백이 포함된 크기 계산 */
    text-align: center; /* 중앙 정렬 */
    color: #ffffff; /* 텍스트 색상 흰색으로 지정 */
  }

  /* 게시글 작성, 검색, 버튼 컨테이너 스타일 */
  .action-buttons,
  .search-container {
    display: flex;
    justify-content: center;
    gap: 10px;
    margin-bottom: 20px;
    color: #f1f1f1;
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
    color: #ffffff; /* 텍스트 흰색 */
    border-color: #ffffff; /* 테두리 흰색 */
  }

  /* 검색 폼 */
  .search-form {
    text-align: center;
    margin : auto;
  }

  .search-input {
    padding: 8px 10px;
    border: 1px solid #ffffff;
    border-radius: 4px;
    background-color: #000000;
    color: #e0e0e0;
    font-size: 1rem;
    width : 50%;
    margin: auto;
    margin-bottom: 20px;
  }

  .search-input::placeholder {
    color: #ae00c7; /* 보라색 텍스트 */
  }

  .search-input:hover,
  .search-input:focus {
    border-color: #ae00c7; /* 보라색 테두리 */
    background-color: #1a1a1a;
    color: #f1f1f1; /* 텍스트 흰색 */
  }

  /* 테이블 스타일 */
  .board-table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
    text-align: left;
    background-color: #1E1E1E;
    color: #ffffff; /* 테이블 텍스트 색상 흰색으로 지정 */
  }

  .board-table th,
  .board-table td {
    padding: 10px;
    border: 1px solid #ae00c7;
  }

  .board-table th {
    background-color: #333;
    font-weight: bold;
    color: #ffffff; /* 제목 색상 흰색 */
  }

  .board-table a {
    color: #f1f1f1; /* 링크 텍스트 색상 흰색 */
    text-decoration: none;
  }

  .board-table a:hover {
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
<!-- 콘텐츠 영역 -->
<div class="container">
  <h2 class="board-title">게시판 목록</h2>

  <!-- 상단 버튼 컨테이너 -->
  <div class="action-buttons">
    <a href="<c:url value='/board/write' />" class="btn primary-btn">게시물 작성</a>
    <a href="<c:url value='/board/myboards' />" class="btn secondary-btn">내가 쓴 글</a>
  </div>

  <!-- 검색 폼 -->
  <form action="<c:url value='/board/search' />" method="get" class="search-form">
    <input
            type="text"
            name="searchKeyword"
            placeholder="제목으로 검색"
            class="form-control search-input"
    >
    <button type="submit" class="btn search-btn">검색</button>
  </form>

  <!-- 게시판 목록 테이블 -->
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
    <c:forEach var="board" items="${myBoards}">
      <tr>
        <td>${board.noticeNo}</td>
        <td><a href="<c:url value='/board/detail?noticeNo=${board.noticeNo}&custId=${loginUser.custId}' />">${board.noticeTitle}</a></td>
        <td>${board.custId}</td>
        <td>${board.noticeDate}</td>
        <td>
          <img src="<c:url value='/imgs/${board.boardImg}' />" alt="게시물 이미지" />
        </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>


  <!-- 페이지네이션 부분을 page.jsp로 분리 -->
  <div class="pagination-container">
    <jsp:include page="/views/board/page.jsp" />
  </div>
</div>

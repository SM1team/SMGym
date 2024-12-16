<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- styles.css 파일을 링크로 추가 -->
<link rel="stylesheet" href="<c:url value='/css/styles.css' />">

<style>
  /* 다크 테마 기본 설정 */
  body {
    font-family: Arial, sans-serif;
    line-height: 1.5;
    color: #ffffff;
    background-color: #000000;
    margin: 0;
    padding: 0;
    display: flex;
    flex-direction: column;
    min-height: 100vh;
    justify-content: center;
    align-items: center;
  }

  /* 콘텐츠 컨테이너 */
  .container {
    width: 100%;
    max-width: 1200px;
    padding: 20px;
    box-sizing: border-box;
    text-align: center;
    color: #ffffff;
    background-color: #1a1a1a;
    border-radius: 10px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.5);
  }

  /* 상단 버튼 */
  .action-buttons {
    display: flex;
    justify-content: center;
    gap: 15px;
    margin-bottom: 20px;
  }

  .btn {
    padding: 12px 18px;
    font-size: 1rem;
    color: #e0e0e0;
    background-color: #000000;
    border: 1px solid #ae00c7;
    border-radius: 5px;
    text-decoration: none;
    transition: background-color 0.3s ease, color 0.3s ease;
  }

  .btn:hover {
    background-color: #ae00c7;
    color: #ffffff;
    border-color: #ffffff;
  }

  /* 검색 폼 */
  .search-form {
    margin: 20px auto;
    width: 100%;
    max-width: 600px;
  }

  .search-input {
    width: 80%;
    padding: 10px;
    font-size: 1rem;
    border: 1px solid #ffffff;
    border-radius: 5px;
    background-color: #000000;
    color: #ffffff;
  }

  .search-input::placeholder {
    color: #ae00c7;
  }

  .search-input:focus {
    outline: none;
    border-color: #ae00c7;
    box-shadow: 0 0 8px #ae00c7;
  }

  .search-btn {
    padding: 10px 15px;
    margin-left: 10px;
    font-size: 1rem;
    background-color: #000000;
    border: 1px solid #ae00c7;
    color: #ffffff;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease, color 0.3s ease;
  }

  .search-btn:hover {
    background-color: #ae00c7;
    color: #ffffff;
  }

  /* 게시판 테이블 */
  .board-table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
    background-color: #1e1e1e;
    color: #ffffff;
  }

  .board-table th,
  .board-table td {
    padding: 12px 15px;
    border: 1px solid #ae00c7;
  }

  .board-table th {
    background-color: #333333;
    font-weight: bold;
  }

  .board-table a {
    color: #ae00c7;
    text-decoration: none;
    transition: color 0.3s ease;
  }

  .board-table a:hover {
    color: #ffffff;
    text-decoration: underline;
  }

  .board-image {
    width: 50px;
    height: 50px;
    border-radius: 5px;
    border: 1px solid #ae00c7;
    object-fit: cover;
  }

  /* 페이지네이션 */
  .pagination-container {
    margin-top: 20px;
  }
</style>

<div class="container">
  <h2 class="board-title">게시판 목록</h2>

  <!-- 상단 버튼 -->
  <div class="action-buttons">
    <a href="<c:url value='/board/write' />" class="btn">게시물 작성</a>
    <a href="<c:url value='/board/myboards' />" class="btn">내가 쓴 글</a>
  </div>

  <!-- 검색 폼 -->
  <form action="<c:url value='/board/search' />" method="get" class="search-form">
    <input
            type="text"
            name="searchKeyword"
            placeholder="제목으로 검색"
            class="search-input"
    />
    <button type="submit" class="search-btn">검색</button>
  </form>

  <!-- 게시판 테이블 -->
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
        <td>
          <a href="<c:url value='/board/detail?noticeNo=${board.noticeNo}&custId=${loginUser.custId}' />">
              ${board.noticeTitle}
          </a>
        </td>
        <td>${board.custId}</td>
        <td>${board.noticeDate}</td>
        <td>
          <img src="<c:url value='/imgs/${board.boardImg}' />" alt="게시물 이미지" class="board-image" />
        </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>

  <!-- 페이지네이션 -->
  <div class="pagination-container">
    <jsp:include page="/views/board/page.jsp" />
  </div>
</div>

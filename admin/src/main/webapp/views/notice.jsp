<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="<c:url value='/css/styles.css' />">
<script src="<c:url value='/js/jquery.min.js' />"></script>

<h2>공지사항 목록 폴더밖에있는거</h2>

<!-- 게시물 작성 및 내가 쓴 글 버튼 -->
<div style="margin-bottom: 20px; display: flex; gap: 10px;">
  <a href="<c:url value='/board/write' />" class="btn">게시물 작성</a>
  <a href="<c:url value='/board/myboards' />" class="btn">내가 쓴 글</a>
</div>

<!-- 검색 폼 -->
<form id="searchForm" style="margin-bottom: 20px;">
  <input type="text" id="searchKeyword" placeholder="제목으로 검색" class="form-control" style="width: 300px; display: inline-block;">
  <button type="button" id="searchBtn" class="btn">검색</button>
</form>

<!-- 공지사항 테이블 -->
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
  <tbody id="noticeTableBody">
  <c:forEach var="notice" items="${noticeList}">
    <tr>
      <td>${notice.noticeNo}</td>
      <td>
        <a href="<c:url value='/notice/detail?noticeNo=${notice.noticeNo}' />" class="notice-title">${notice.noticeTitle}</a>
      </td>
      <td>${notice.trainerId}</td>
      <td>${notice.noticeDate}</td>
      <td>
        <c:if test="${not empty notice.noticeImg}">
          <img src="<c:url value='/imgs/${notice.noticeImg}' />" alt="게시물 이미지" height="50" width="50" />
        </c:if>
      </td>
    </tr>
  </c:forEach>
  </tbody>
</table>

<!-- 페이지네이션 -->
<jsp:include page="/views/notice/page.jsp" />

<script>
  // 검색 버튼 클릭 이벤트
  $(document).ready(function () {
    $('#searchBtn').on('click', function () {
      const keyword = $('#searchKeyword').val();
      if (keyword.trim() === '') {
        alert('검색어를 입력해주세요.');
        return;
      }

      // 검색 요청
      $.ajax({
        url: '<c:url value="/notice/search" />',
        method: 'GET',
        data: { searchKeyword: keyword },
        success: function (data) {
          // 공지사항 테이블 업데이트
          const tbody = $('#noticeTableBody');
          tbody.empty();

          if (data.length === 0) {
            tbody.append('<tr><td colspan="5">검색 결과가 없습니다.</td></tr>');
          } else {
            data.forEach(function (notice) {
              tbody.append(`
                                <tr>
                                    <td>${notice.noticeNo}</td>
                                    <td>
                                        <a href="/notice/detail?noticeNo=${notice.noticeNo}" class="notice-title">${notice.noticeTitle}</a>
                                    </td>
                                    <td>${notice.trainerId}</td>
                                    <td>${notice.noticeDate}</td>
                                    <td>
                                        ${notice.noticeImg ? `<img src="/imgs/${notice.noticeImg}" alt="게시물 이미지" height="50" width="50" />` : ''}
                                    </td>
                                </tr>
                            `);
            });
          }
        },
        error: function () {
          alert('검색에 실패했습니다. 다시 시도해주세요.');
        }
      });
    });
  });
</script>

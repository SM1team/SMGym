<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <title>공지사항 목록</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="<c:url value='/css/styles.css' />">
  <script>
    // 로그인 상태를 확인하는 함수
    function checkLoginStatus() {
      var loginId = "${loginid}";  // 로그인한 사용자의 아이디 (서버에서 설정한 변수)
      if (!loginId) {
        alert('로그인 후 게시물을 작성할 수 있습니다.');
        return false; // 로그인하지 않은 경우 작성 페이지로 이동하지 않음
      }
      return true; // 로그인한 경우 게시물 작성 페이지로 이동
    }
  </script>
</head>
<body>
<div class="col-sm-10">
  <h2>공지사항 목록</h2>

  <div style="margin-bottom: 20px; display: flex; gap: 10px;">
    <!-- 게시물 작성 버튼 클릭 시 로그인 여부를 체크 -->
    <a href="<c:url value='/notice/write' />" class="btn btn-primary" onclick="return checkLoginStatus();">새로운 공지사항 작성</a>
  </div>

  <form action="<c:url value='/notice/search' />" method="get" style="margin-bottom: 20px;">
    <input type="text" name="searchKeyword" placeholder="제목으로 검색" class="form-control" style="width: 300px; display: inline-block;">
    <button type="submit" class="btn btn-success">검색</button>
  </form>

  <table class="table table-striped">
    <thead>
    <tr>
      <th>번호</th>
      <th>제목</th>
      <th>작성자</th>
      <th>등록일</th>
      <th>이미지</th>
      <th>삭제</th> <!-- 삭제 버튼 추가 -->
    </tr>
    </thead>
    <tbody>
    <c:forEach var="notice" items="${noticeList}">
      <tr>
        <td>${notice.noticeNo}</td>
        <td><a href="<c:url value='/notice/detail?noticeNo=${notice.noticeNo}' />" style="color: black;">${notice.noticeTitle}</a></td>
        <td>${notice.trainerId}</td>
        <td>${notice.noticeDate}</td>
        <td>
          <c:if test="${not empty notice.noticeImg}">
            <img src="<c:url value='/imgs/${notice.noticeImg}' />" alt="게시물 이미지" height="50" width="50" />
          </c:if>
        </td>
        <td>
          <!-- 삭제 버튼: 현재 로그인한 사용자의 trainerId와 게시물의 trainerId가 같을 때만 삭제 버튼을 보이도록 함 -->
          <c:if test="${notice.trainerId == loginid.trainerId}">

            <a href="<c:url value='/notice/delete?noticeNo=${notice.noticeNo}' />"
               onclick="return confirm('정말 삭제하시겠습니까');" class="btn btn-danger btn-sm">삭제</a>
          </c:if>
        </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>

  <jsp:include page="/views/notice/page.jsp" />
</div>
</body>
</html>

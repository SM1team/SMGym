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
</head>
<body>
<div class="col-sm-10">
  <h2>공지사항 목록</h2>

  <div style="margin-bottom: 20px; display: flex; gap: 10px;">
    <a href="<c:url value='/notice/write' />" class="btn btn-primary">게시물 작성</a>
    <a href="<c:url value='/notice/myboards' />" class="btn btn-secondary">내가 쓴 글</a>
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
      </tr>
    </c:forEach>
    </tbody>
  </table>

  <jsp:include page="/views/notice/page.jsp" />
</div>
</body>
</html>

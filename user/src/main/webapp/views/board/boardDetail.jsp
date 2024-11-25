<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <title>게시물 상세보기</title>
  <!-- 스타일 및 기타 설정 추가 -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
  <h2>${board.noticeTitle}</h2>
  <p><strong>작성자:</strong> ${board.custId}</p>
  <p><strong>작성일:</strong> ${board.noticeDate}</p>
  <p><strong>내용:</strong> ${board.noticeContent}</p>
  <p><strong>이미지:</strong>   <img src="<c:url value="/imgs"/>${board.boardImg}">" alt="게시물 이미지" height="300" width="300" /></p>
  <a href="<c:url value='/board' />" class="btn btn-primary">목록으로 돌아가기</a>
</div>
</body>
</html>

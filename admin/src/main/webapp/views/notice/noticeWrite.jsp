<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <title>게시글 작성</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <style>
    #boardWriteForm {
      display: block;
    }
  </style>
</head>
<body>
<div class="container mt-5">
  <h2>게시글 작성</h2>

  <!-- 게시글 작성 폼 -->
  <form action="<c:url value='/notice/noticewriteimpl' />" method="post" enctype="multipart/form-data">
    <div class="form-group">
      <label for="title">제목</label>
      <input type="text" id="title" name="title" class="form-control" required placeholder="공지사항 제목을 입력하세요">
    </div>

    <div class="form-group">
      <label for="content">내용</label>
      <textarea id="content" name="content" class="form-control" rows="5" required placeholder="공지사항 내용을 입력하세요"></textarea>
    </div>

    <div class="form-group">
      <label for="boardImg">이미지 업로드 (선택)</label>
      <input type="file" id="boardImg" name="noticeImg" class="form-control-file">
    </div>

    <button type="submit" class="btn btn-primary">작성 완료</button>
    <a href="<c:url value='/notice' />" class="btn btn-secondary" style="margin-left: 10px;">취소</a>
  </form>

  <!-- 게시판 목록으로 돌아가기 -->
  <div style="margin-top: 20px;">
    <a href="<c:url value='/notice' />" class="btn btn-secondary">게시판으로 돌아가기</a>
  </div>
</div>
</body>
</html>

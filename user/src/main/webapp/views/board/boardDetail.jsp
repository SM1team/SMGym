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
  <title>게시물 상세보기</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <style>
    #commentForm {
      display: none;
    }
  </style>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script>
    $(document).ready(function () {
      $("#commentToggleBtn").click(function () {
        $("#commentForm").slideToggle();
      });

      // 댓글 작성 폼 검증
      $("form").on("submit", function (e) {
        const commentContent = $("#commentContent").val().trim();
        if (commentContent === "") {
          alert("댓글 내용을 입력해주세요.");
          e.preventDefault();
        }
      });
    });
  </script>
</head>
<body>
<div class="container mt-5">
  <h2>${board.noticeTitle}</h2>
  <p><strong>작성자:</strong> ${board.custId}</p>
  <p><strong>작성일:</strong> ${board.noticeDate}</p>
  <p><strong>내용:</strong> ${board.noticeContent}</p>
  <p><strong>이미지:</strong>
    <img src="<c:url value='/imgs/${board.boardImg}' />" alt="게시물 관련 이미지" height="400" width="550" />
  </p>

  <!-- 목록으로 돌아가기와 댓글 작성 버튼 -->
  <a href="<c:url value='/board' />" class="btn btn-primary">목록으로 돌아가기</a>
  <a href="javascript:void(0)" id="commentToggleBtn" class="btn btn-success ml-2">댓글 작성</a>

  <!-- 댓글 리스트 -->
  <div id="commentsSection" class="mt-4">
    <c:if test="${empty comments}">
      <p><strong>아직 댓글이 없습니다. 제일 먼저 댓글을 작성해보세요!</strong></p>
    </c:if>
    <c:forEach var="comment" items="${comments}">
      <div class="comment mt-3 p-2 border rounded">
        <p><strong>${comment.custId}</strong>
          <span class="text-muted">(${fn:replace(comment.commentDate, 'T', ' ')})</span>
        </p>
        <p>${comment.commentContent}</p>
      </div>
    </c:forEach>
  </div>

  <!-- 댓글 작성 폼 -->
  <div id="commentForm" class="mt-4">
    <form action="<c:url value='/comment/save' />" method="post">
      <div class="form-group">
        <label for="noticeNo">게시글 번호</label>
        <input type="text" class="form-control" id="noticeNo" name="noticeNo" value="${board.noticeNo}"  />
      </div>
      <div class="form-group">
        <label for="custId">작성자 ID</label>
        <input type="text" class="form-control" id="custId" name="custId" value="${loginUser.custId}"  />
      </div>
      <div class="form-group">
        <label for="commentContent">댓글 내용</label>
        <textarea class="form-control" id="commentContent" name="content" rows="3" placeholder="댓글 내용을 입력하세요"></textarea>
      </div>
      <button type="submit" class="btn btn-success">댓글 작성</button>
    </form>
  </div>
</div>
</body>
</html>

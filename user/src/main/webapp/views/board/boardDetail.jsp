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
    body {
      font-family: Arial, sans-serif;
      background-color: #000;
      color: #e0e0e0;
      margin: 0;
      padding: 0;
    }

    h2 {
      color: #ae00c7;
      text-align: center;
      margin-bottom: 20px;
    }

    p {
      margin-bottom: 10px;
    }


    .btn {
      padding: 10px 15px;
      text-decoration: none;
      color: #e0e0e0;
      border-radius: 5px;
      text-align: center;
      font-size: 1rem;
      transition: background-color 0.3s ease, color 0.3s ease;
    }

    .btn-primary {
      background-color: #ae00c7;
      border: 1px solid #ae00c7;
    }

    .btn-primary:hover {
      background-color: #e0e0e0;
      color: #ae00c7;
    }

    #commentForm, #commentEditForm {
      display: none;
      background-color: #1e1e1e;
      border: 1px solid #ae00c7;
      padding: 20px;
      border-radius: 8px;
      margin-top: 20px;
    }

    .text-muted {
      color: #888;
    }

    .form-group{
      background-color: #1a1a1a;!important;
      color: #f1f1f1;!important;
    }

    .btn-warning, .btn-danger {
      background-color: #ae00c7;
      border: 1px solid #ae00c7;
      color: #e0e0e0;
    }

    .btn-warning:hover, .btn-danger:hover {
      background-color: #e0e0e0;
      color: #ae00c7;
    }
  </style>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script>
    $(document).ready(function () {
      // 댓글 작성 폼 토글
      $("#commentToggleBtn").click(function () {
        $("#commentForm").slideToggle();
      });

      // 댓글 수정 폼 토글
      $(".commentEditBtn").click(function () {
        var content = $(this).data("content");
        var commentNo = $(this).data("commentno");
        var noticeNo = "${board.noticeNo}";

        $("#commentEditForm").slideDown();
        $("#commentEditForm #content").val(content);
        $("#commentEditForm #commentNo").val(commentNo);
        $("#commentEditForm #noticeNoEdit").val(noticeNo);
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
    <img src="<c:url value='/imgs/${board.boardImg}' />" alt="게시물 관련 이미지" style="
      max-width: 100%;
      height: auto;
      margin-bottom: 15px;
      border: 1px solid #ae00c7;
      border-radius: 5px;
    " />
  </p>

  <!-- 목록으로 돌아가기와 댓글 작성 버튼 -->
  <a href="<c:url value='/board' />" class="btn btn-primary">목록으로 돌아가기</a>
  <a href="javascript:void(0)" id="commentToggleBtn" class="btn btn-primary ml-2">댓글 작성</a>

  <!-- 댓글 리스트 -->
  <div id="commentsSection" class="mt-4">
    <c:if test="${empty comments}">
      <p class="text-muted">아직 댓글이 없습니다. 제일 먼저 댓글을 작성해보세요!</p>
    </c:if>
    <c:forEach var="comment" items="${comments}">
      <div class="comment">
        <p><strong>${comment.custId}</strong>
          <span class="text-muted">(${fn:replace(comment.commentDate, 'T', ' ')})</span>
        </p>
        <p>${comment.commentContent}</p>

        <!-- 댓글 수정 및 삭제 버튼 표시 -->
        <c:if test="${comment.custId == loginUser.custId}">
          <button type="button" class="btn btn-warning btn-sm commentEditBtn"
                  data-commentno="${comment.commentNo}"
                  data-content="${comment.commentContent}">
            수정버튼
          </button>
          <a href="<c:url value='/comment/delete?commentId=${comment.commentNo}&noticeNo=${board.noticeNo}' />" class="btn btn-danger btn-sm">삭제</a>
        </c:if>
      </div>
    </c:forEach>
  </div>

  <!-- 댓글 작성 폼 -->
  <div id="commentForm">
    <form action="<c:url value='/comment/save' />" method="post">
      <div class="form-group" s>
        <label for="noticeNo">게시글 번호</label>
        <input type="text" class="form-control" id="noticeNo" name="noticeNo" value="${board.noticeNo}" readonly style="background-color: #1a1a1a; color: #f1f1f1"/>
      </div>
      <div class="form-group">
        <label for="custId">작성자 ID</label>
        <input type="text" class="form-control" id="custId" name="custId" value="${loginUser.custId}" readonly style="background-color: #1a1a1a; color: #f1f1f1"/>
      </div>
      <div class="form-group">
        <label for="commentContent">댓글 내용</label>
        <textarea class="form-control" id="commentContent" name="content" rows="3" placeholder="댓글 내용을 입력하세요" style="background-color: #1a1a1a; color: #f1f1f1"></textarea>
      </div>
      <button type="submit" class="btn btn-primary">댓글 작성</button>
    </form>
  </div>
  <!-- 댓글 수정 폼 -->
  <div id="commentEditForm">
    <form action="<c:url value='/comment/modify' />" method="post">
      <div class="form-group" >
        <label for="noticeNoEdit">게시글 번호</label>
        <input type="text" class="form-control" id="noticeNoEdit" name="noticeNo" value="${board.noticeNo}" readonly style="background-color: #1a1a1a; color: #f1f1f1"/>
      </div>
      <div class="form-group">
        <label for="commentNo">댓글 번호</label>
        <input type="text" class="form-control" id="commentNo" name="commentNo" readonly style="background-color: #1a1a1a; color: #f1f1f1"/>
      </div>
      <div class="form-group">
        <label for="content">댓글 내용</label>
        <textarea class="form-control" id="content" name="commentContent" rows="3" style="background-color: #1a1a1a; color: #f1f1f1"></textarea>
      </div>
      <button type="submit" class="btn btn-primary">댓글 수정</button>
      <a href="<c:url value='/board/detail?noticeNo=${board.noticeNo}' />" class="btn btn-primary">취소</a>
    </form>
  </div>

</div>
</body>
</html>

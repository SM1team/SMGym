<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="공지사항 상세보기" />
    <title>공지사항 상세보기</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.5;
            color: #e0e0e0;
            background-color: #000000;
            margin: 0;
            padding: 0;
        }

        .board-container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            border-radius: 8px;
            background-color: #000000;
        }

        .board-title {
            font-size: 1.8rem;
            margin-bottom: 20px;
            text-align: center;
            color: #ae00c7;
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

        .btn.primary-btn {
            background-color: #000000;
            color: #ffffff;
            border: 1px solid #ae00c7;
        }

        .btn.primary-btn:hover {
            background-color: #ae00c7;
            color: #ffffff;
            border-color: #ffffff;
        }

        .comment {
            background-color: #1E1E1E;
            border: 1px solid #ae00c7;
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 10px;
        }

        #commentForm {
            display: none;
            margin-top: 20px;
            padding: 20px;
            background-color: #1E1E1E;
            border: 1px solid #ae00c7;
            border-radius: 5px;
        }

        .form-control {
            background-color: #000000;
            color: #e0e0e0;
            border: 1px solid #ae00c7;
            border-radius: 4px;
            padding: 10px;
            font-size: 1rem;
        }

        .form-control:focus {
            border-color: #ae00c7;
            box-shadow: 0 0 8px #ae00c7;
        }


    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function () {
            // 댓글 작성 폼 토글
            $("#commentToggleBtn").click(function () {
                $("#commentForm").slideToggle();
            });
        });
    </script>
</head>
<body>
<section class="board-container">
    <h2 class="board-title">${notice.noticeTitle}</h2>
    <p><strong>작성자:</strong> ${notice.trainerId}</p>
    <p><strong>작성일:</strong> ${notice.noticeDate}</p>
    <p><strong>내용:</strong></p>
    <p>${notice.noticeContent}</p>
    <p><strong>이미지:</strong></p>
    <img src="<c:url value='/imgs/${notice.noticeImg}' />" alt="게시물 관련 이미지"  style="
            max-width: 100%;
            height: auto;
            border: 1px solid #ae00c7;
            border-radius: 4px;
    "/>

    <div class="action-buttons">
        <a href="<c:url value='/notice' />" class="btn primary-btn" style="margin-top: 20px">목록으로 돌아가기</a>
        <button id="commentToggleBtn" class="btn primary-btn" style="margin-top: 20px">댓글 작성</button>
    </div>

    <div id="commentsSection">
        <c:if test="${empty comments}">
            <p class="text-muted">아직 댓글이 없습니다. 제일 먼저 댓글을 작성해보세요!</p>
        </c:if>
        <c:forEach var="comment" items="${comments}">
            <div class="comment">
                <p><strong>${comment.custId}</strong>
                    <span class="text-muted">(${fn:replace(comment.commentDate, 'T', ' ')})</span>
                </p>
                <p>${comment.commentContent}</p>
            </div>
        </c:forEach>
    </div>

    <div id="commentForm">
        <form action="<c:url value='/comment/save' />" method="post">
            <div class="form-group">
                <label for="noticeNo">게시글 번호</label>
                <input type="text" class="form-control" id="noticeNo" name="noticeNo" value="${notice.noticeNo}" readonlystyle="color:#000000" />
            </div>
            <div class="form-group">
                <label for="custId">작성자 ID</label>
                <input type="text" class="form-control" id="custId" name="custId" value="${notice.trainerId}" readonlystyle="color:#000000"/>
            </div>
            <div class="form-group">
                <label for="commentContent">댓글 내용</label>
                <textarea class="form-control" id="commentContent" name="content" rows="3" placeholder="댓글 내용을 입력하세요"></textarea>
            </div>
            <button type="submit" class="btn primary-btn">댓글 작성</button>
        </form>
    </div>
</section>
</body>
</html>

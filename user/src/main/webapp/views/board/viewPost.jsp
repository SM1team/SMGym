<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>${board.noticeTitle}</title>
</head>
<body>
<h1>${board.noticeTitle}</h1> <!-- 게시물 제목 -->
<p><strong>작성자:</strong> ${board.custId}</p> <!-- 작성자 -->
<p><strong>작성일:</strong> ${board.noticeDate}</p> <!-- 작성일 -->
<p><strong>내용:</strong> ${board.noticeContent}</p> <!-- 내용 -->

<!-- 게시물 이미지 출력 -->
<c:if test="${not empty board.boardImg}">
  <img src="<c:url value='/assets/img/board/${board.boardImg}'/>" alt="게시물 이미지">
</c:if>
</body>
</html>

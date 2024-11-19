<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${pageTitle}</title>
</head>
<body>

<h2>${pageTitle}</h2>

<!-- 오류 메시지 표시 -->
<c:if test="${not empty error}">
    <p style="color: red;">${error}</p>
</c:if>

<!-- 게시물 작성 폼 -->
<div>
    <form action="/board/write" method="post" enctype="multipart/form-data">
        <table>
            <tr>
                <th>작성자 (ID)</th>
                <td>
                    <!-- 로그인한 사용자의 ID가 자동으로 채워지도록 처리 -->
                    <input type="text" name="custId"  required>
                </td>
            </tr>
            <tr>
                <th>제목</th>
                <td><input type="text" name="noticeTitle" required></td>
            </tr>
            <tr>
                <th>내용</th>
                <td><textarea name="noticeContent" required></textarea></td>
            </tr>
            <tr>
                <th>이미지</th>
                <td><input type="file" name="boardImg"></td>
            </tr>
        </table>

        <button type="submit">작성 완료</button>
    </form>
</div>

</body>
</html>

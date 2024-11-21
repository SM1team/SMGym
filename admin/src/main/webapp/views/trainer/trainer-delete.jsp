<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>트레이너 삭제</title>
    <!-- 필요한 스타일 시트 추가 -->
</head>
<body>
<h1>트레이너 삭제</h1>
<form action="/deleteTrainer" method="post">
    <label for="trainerId">트레이너 ID:</label><br>
    <input type="number" id="trainerId" name="trainerId" required><br><br>

    <button type="submit">삭제</button>
</form>
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>트레이너 추가</title>
    <!-- 필요한 스타일 시트 추가 -->
</head>
<body>
<h1>트레이너 추가</h1>
<form action="/addTrainer" method="post">
    <label for="name">이름:</label><br>
    <input type="text" id="name" name="name" required><br><br>

    <label for="specialty">전문분야:</label><br>
    <input type="text" id="specialty" name="specialty" required><br><br>

    <label for="email">이메일:</label><br>
    <input type="email" id="email" name="email" required><br><br>

    <button type="submit">추가</button>
</form>
</body>
</html>

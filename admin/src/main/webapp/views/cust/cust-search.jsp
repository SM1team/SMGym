<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>고객 검색</title>
    <!-- 필요한 스타일 시트 추가 -->
</head>
<body>
<h1>고객 검색</h1>
<form action="/searchCust" method="get">
    <label for="searchName">이름:</label><br>
    <input type="text" id="searchName" name="searchName"><br><br>

    <button type="submit">검색</button>
</form>

<!-- 검색 결과 표시 (예시) -->
<table border="1">
    <thead>
    <tr>
        <th>고객 ID</th>
        <th>이름</th>
        <th>이메일</th>
        <th>가입일</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>1</td>
        <td>홍길동</td>
        <td>hong@example.com</td>
        <td>2023-01-15</td>
    </tr>
    </tbody>
</table>
</body>
</html>
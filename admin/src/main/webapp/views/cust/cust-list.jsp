<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>고객 목록</title>
    <!-- 필요한 스타일 시트 추가 -->
</head>
<body>
<h1>고객 목록</h1>
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
    <!-- 여기에 서버에서 동적으로 고객 목록을 가져와서 표시 -->
    <tr>
        <td>1</td>
        <td>홍길동</td>
        <td>hong@example.com</td>
        <td>2023-01-15</td>
    </tr>
    <tr>
        <td>2</td>
        <td>김철수</td>
        <td>kim@example.com</td>
        <td>2023-02-20</td>
    </tr>
    </tbody>
</table>
</body>
</html>
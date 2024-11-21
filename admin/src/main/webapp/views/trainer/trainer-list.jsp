<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>트레이너 목록</title>
    <!-- 필요한 스타일 시트 추가 -->
</head>
<body>
<h1>트레이너 목록</h1>
<table border="1">
    <thead>
    <tr>
        <th>트레이너 ID</th>
        <th>이름</th>
        <th>전문분야</th>
        <th>가입일</th>
    </tr>
    </thead>
    <tbody>
    <!-- 여기에 서버에서 동적으로 트레이너 목록을 가져와서 표시 -->
    <tr>
        <td>1</td>
        <td>김지훈</td>
        <td>헬스</td>
        <td>2023-03-10</td>
    </tr>
    <tr>
        <td>2</td>
        <td>박지은</td>
        <td>요가</td>
        <td>2023-04-12</td>
    </tr>
    </tbody>
</table>
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>고객 목록</title>
</head>
<body>
<h2>고객 목록</h2>
<table border="1">
    <thead>
    <tr>
        <th>고객 ID</th>
        <th>고객 이름</th>
        <th>고객 이메일</th>
        <th>상세 보기</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="cust" items="${custs}">
        <tr>
            <td>${cust.custId}</td>
            <td>${cust.custName}</td>
            <td>${cust.custAddress}</td>
            <td><a href="/cust/detail?id=${cust.custId}">상세 보기</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>

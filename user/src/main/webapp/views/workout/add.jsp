<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.DataSource" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>새로운 항목 추가</title>
    <script type="text/javascript">
        function confirmAdd() {
            var userConfirmed = confirm("새로운 항목을 만들어 드릴까요?");
            if (userConfirmed) {
                // 확인 버튼을 누르면 서버로 데이터 전송
                window.location.href = "addItem.jsp";
            } else {
                // 취소 버튼을 누르면 알림창이 닫히고 아무 일도 일어나지 않음
                return;
            }
        }
    </script>
</head>
<body>
<h1>새로운 항목 추가</h1>
<button onclick="confirmAdd()">추가</button>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>QR 코드 생성</title>
</head>
<body>
<!-- 나의 전용 QR 코드 제목 -->
<h1>나의 전용 QR 코드</h1>

<!-- 사용자 정보 표시 -->
<h5>${sessionScope.loginid.custId}님의 QR코드.</h5>

<!-- QR 코드 이미지 출력 (Base64로 인코딩된 QR 코드) -->
<img src="${qrCodeImage}" alt="QR 코드" id="qrCodeImage" style="width: 200px; height: 200px;" />


<!-- QR 코드 새로 만들기 버튼 -->
<form action="/qr/generateQRCode" method="get">
  <button type="submit">QR 코드 새로 만들기</button>
</form>

<p>이 QR 코드를 스캔하여 출석을 체크하세요!</p>

<!-- 홈으로 가기 버튼 -->
<a href="/home">홈으로 가기</a>
</body>
</html>
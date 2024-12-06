<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>QR 코드 생성</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f9f9f9;

      height: 100vh;
      text-align: center;
    }
    .container2 {

      align-items: center;

    }
    h1 {
      color: #800080;
      margin-bottom: 20px;
    }
    h5 {
      color: #555;
      margin-bottom: 20px;
    }
    #qrCodeImage {
      width: 150px; /* 적절한 크기 설정 */
      height: 150px; /* 적절한 크기 설정 */
      border: 3px solid #800080;
      border-radius: 10px;
      margin-bottom: 20px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }
    form button {
      background-color: #800080;
      color: white;
      border: none;
      padding: 10px 20px;
      border-radius: 5px;
      font-size: 16px;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }
    form button:hover {
      background-color: #800080;
    }





    p {
      color: #777;
      margin-top: 20px;
    }
  </style>
</head>
<body>
<div class="container2">
  <!-- 나의 전용 QR 코드 제목 -->
  <h1>나의 전용 QR 코드</h1>

  <!-- 사용자 정보 표시 -->
  <h5>${sessionScope.loginid.custId}님의 QR코드.</h5>

  <!-- QR 코드 이미지 출력 (Base64로 인코딩된 QR 코드) -->
  <img src="${qrCodeImage}" alt="QR 코드" id="qrCodeImage" />

  <!-- QR 코드 새로 만들기 버튼 -->
  <form action="/qr/generateQRCode" method="get">
    <button type="submit">QR 코드 새로 만들기</button>
  </form>

  <p>이 QR 코드를 스캔하여 출석을 체크하세요!</p>


</div>
</body>
</html>